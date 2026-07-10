import { FastifyInstance } from "fastify";

export default class GatewayService {

  constructor(
    private readonly app: FastifyInstance
  ) {}

  async createGatewayRequest(
    paymentIntentId: string,
    providerId: string,
    payload: unknown
  ) {

    return this.app.prisma.gatewayRequest.create({

      data: {

        paymentIntentId,

        providerId,

        payload: payload as any,

        status: "PENDING"

      }

    });

  }

  async saveGatewayResponse(
    gatewayRequestId: string,
    response: unknown,
    successful: boolean
  ) {

    return this.app.prisma.gatewayResponse.create({

      data: {

        gatewayRequestId,

        payload: response as any,

        successful

      }

    });

  }

}
