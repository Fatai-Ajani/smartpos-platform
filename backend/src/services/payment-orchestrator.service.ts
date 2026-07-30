import { FastifyInstance } from "fastify";
import { Prisma } from "@prisma/client";

import PaymentService from "./payment.service.js";
import GatewayService from "./gateway.service.js";

import ProviderManager from "../providers/provider.manager.js";
import SmartGatewaySelector from "../providers/smart-gateway-selector.js";
import ProviderFailover from "../providers/provider-failover.js";
import ProviderMetricsService from "../providers/provider-metrics.service.js";

export default class PaymentOrchestratorService {

  private readonly paymentService: PaymentService;

  private readonly gatewayService: GatewayService;

  private readonly providerManager = new ProviderManager();

  private readonly selector = new SmartGatewaySelector();

  private readonly failover = new ProviderFailover();

  private readonly metrics =
    new ProviderMetricsService();

  constructor(
    private readonly app: FastifyInstance
  ) {

    this.paymentService =
      new PaymentService(app);

    this.gatewayService =
      new GatewayService(app);

  }

  async createPayment(data: {

    merchantId: string;

    customerId?: string;

    paymentMethodId?: string;

    amount: Prisma.Decimal;

    currency: any;

    paymentMethod: string;

    description?: string;

    metadata?: Prisma.JsonValue;

  }) {

    const paymentIntent =
      await this.paymentService.createPaymentIntent({

        merchantId: data.merchantId,

        customerId: data.customerId,

        paymentMethodId: data.paymentMethodId,

        amount: data.amount,

        currency: data.currency,

        description: data.description,

        metadata: data.metadata

      });

    const providers =
      await this.gatewayService.activeProviders();

    const providerNames =
      providers
        .filter(provider => provider.isActive)
        .sort((a, b) => a.priority - b.priority)
        .map(provider => provider.name);

    const providerRecord =
      this.selector.select(providers, {

        merchantId: data.merchantId,

        currency: String(data.currency),

        amount: Number(data.amount),

        paymentMethod: data.paymentMethod

      });

    const provider =
      this.providerManager.getProvider(

        providerRecord.name

      );

    const transaction =
      await this.paymentService.createTransaction({

        merchantId: data.merchantId,

        customerId: data.customerId,

        amount: data.amount,

        currency: data.currency,

        paymentMethod: data.paymentMethod,

        type: "payment",

        description: data.description,

        paymentIntentId: paymentIntent.id,

        metadata: data.metadata

      });

    const gatewayRequest =
      await this.gatewayService.createGatewayRequest({

        providerId: providerRecord.id,

        transactionId: transaction.id,

        endpoint: "/payment",

        method: "POST",

        requestBody: (data.metadata ?? {}) as Prisma.JsonValue,

        requestHeaders: {} as Prisma.JsonValue

      });


    try {

      const started =
        Date.now();

      const response =
        await this.failover.execute(

          providerNames,

          async provider =>

            provider.createPayment({

              amount: Number(data.amount),

              currency: String(data.currency),

              description: data.description,

              reference:
                transaction.reference ??
                transaction.id,

              metadata:
                data.metadata as any

            })

        );

      this.metrics.record(

        providerRecord.name,

        true,

        Date.now() - started

      );

      await this.gatewayService.createGatewayResponse({

        gatewayRequestId:
          gatewayRequest.id,

        statusCode: 200,

        responseBody:
          response.raw,

        responseHeaders:
          {} as Prisma.JsonValue

      });

      return {

        paymentIntent,

        transaction,

        provider:
          response.reference,

        response

      };

    } catch (error) {

      this.metrics.record(

        providerRecord.name,

        false,

        0

      );

      await this.gatewayService.createGatewayResponse({

        gatewayRequestId:
          gatewayRequest.id,

        statusCode: 500,

        responseBody:
          {} as Prisma.JsonValue,

        responseHeaders:
          {} as Prisma.JsonValue,

        error:
          error instanceof Error
            ? error.message
            : "Unknown error"

      });

      throw error;

    }

  }

}
