import { FastifyInstance } from "fastify";

export default class PaymentService {

  constructor(
    private readonly app: FastifyInstance
  ) {}

  async createPaymentIntent(data: {
    merchantId: string;
    terminalId: string;
    amount: number;
    fiatCurrency: string;
    cryptoCurrency: string;
    customerId?: string;
  }) {

    const merchant =
      await this.app.prisma.merchant.findUnique({
        where: {
          id: data.merchantId
        }
      });

    if (!merchant) {
      throw new Error("Merchant not found.");
    }

    const terminal =
      await this.app.prisma.terminal.findUnique({
        where: {
          id: data.terminalId
        }
      });

    if (!terminal) {
      throw new Error("Terminal not found.");
    }

    const paymentIntent =
      await this.app.prisma.paymentIntent.create({

        data: {

          merchantId: data.merchantId,

          terminalId: data.terminalId,

          customerId: data.customerId,

          amount: data.amount,

          fiatCurrency: data.fiatCurrency,

          cryptoCurrency: data.cryptoCurrency,

          status: "PENDING"

        }

      });

    return paymentIntent;

  }

  async authorizePayment(
    paymentIntentId: string
  ) {

    const paymentIntent =
      await this.app.prisma.paymentIntent.findUnique({

        where: {
          id: paymentIntentId
        }

      });

    if (!paymentIntent) {
      throw new Error("Payment Intent not found.");
    }

    return this.app.prisma.authorization.create({

      data: {

        paymentIntentId,

        status: "AUTHORIZED"

      }

    });

  }

  async capturePayment(
    authorizationId: string
  ) {

    return this.app.prisma.capture.create({

      data: {

        authorizationId,

        status: "CAPTURED"

      }

    });

  }

}
