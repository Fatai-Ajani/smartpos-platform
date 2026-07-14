import {
  FastifyReply,
  FastifyRequest
} from "fastify";

import WebhookService from "../services/webhook.service.js";

export default class WebhookController {

  constructor(
    private readonly webhookService: WebhookService
  ) {}

  receive = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {

    const body =
      request.body as any;

    const headers =
      request.headers;

    const webhook =
      await this.webhookService.receiveWebhook({

        webhookId:    body.webhookId,
        event:        body.event,
        payload:      body.payload,
        transactionId: body.transactionId
      });

    return reply.code(202).send({

      success: true,

      data: webhook

    });

  };

  process = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {

    const { id } =
      request.params as any;

    const result =
      await this.webhookService.processWebhook(
        id
      );

    return reply.send({

      success: true,

      data: result

    });

  };

}
