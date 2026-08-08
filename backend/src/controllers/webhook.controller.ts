import {
  FastifyReply,
  FastifyRequest
} from "fastify";

import WebhookService from "../services/webhook.service.js";
import { enqueueWebhook } from "../queues/webhook.producer.js";

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

    const webhook =
      await this.webhookService.receiveWebhook({

        webhookId:
          body.webhookId,

        event:
          body.event,

        payload:
          body.payload,

        transactionId:
          body.transactionId

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

    const job =
      await enqueueWebhook(id);

    return reply.code(202).send({

      success: true,

      message: "Webhook queued for processing",

      data: {

        jobId: job.id,

        webhookId: id,

        status: "QUEUED"

      }

    });

  };

}
