import {
  FastifyReply,
  FastifyRequest,
} from "fastify";

import MetricsService from "../services/metrics.service.js";

export default class MetricsController {
  constructor(
    private readonly metrics: MetricsService
  ) {}

  getMetrics = async (
    _request: FastifyRequest,
    reply: FastifyReply
  ) => {

    const metrics =
      await this.metrics.getDashboardMetrics();

    return reply.send({
      success: true,
      data: metrics,
    });
  };
}