import { FastifyReply, FastifyRequest } from "fastify";
import ExchangeService from "../services/exchange.service.js";

export default class ExchangeController {
  constructor(
    private readonly exchangeService: ExchangeService
  ) {}

  createRate = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {
    const rate =
      await this.exchangeService.createExchangeRate(
        request.body as any
      );

    return reply.code(201).send({
      success: true,
      message: "Exchange rate created",
      data: rate
    });
  };

  quote = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {
    const {
      fromCurrency,
      toCurrency,
      amount
    } = request.body as any;

    const result =
      await this.exchangeService.calculateQuote(
        fromCurrency,
        toCurrency,
        amount
      );

    return reply.send({
      success: true,
      data: result
    });
  };
}