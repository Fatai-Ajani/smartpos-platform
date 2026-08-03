import { FastifyReply, FastifyRequest } from "fastify";
import { ZodTypeAny } from "zod";

export function validateBody(schema: ZodTypeAny) {
  return async function (
    request: FastifyRequest,
    reply: FastifyReply
  ) {
    const result = schema.safeParse(request.body);

    if (!result.success) {
      return reply.status(400).send({
        success: false,
        statusCode: 400,
        error: "Bad Request",
        message: "Request validation failed.",
        details: result.error.flatten(),
      });
    }

    request.body = result.data;
  };
}
