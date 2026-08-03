import { FastifyReply, FastifyRequest } from "fastify";
import { ZodTypeAny } from "zod";

function validate(
  schema: ZodTypeAny,
  target: "body" | "params" | "query"
) {

  return async function (
    request: FastifyRequest,
    reply: FastifyReply
  ) {

    const result =
      schema.safeParse(request[target]);

    if (!result.success) {

      return reply.status(400).send({

        success: false,

        statusCode: 400,

        error: "Bad Request",

        message: "Request validation failed.",

        details: result.error.flatten()

      });

    }

    request[target] = result.data;

  };

}

export const validateBody =
  (schema: ZodTypeAny) =>
    validate(schema, "body");

export const validateParams =
  (schema: ZodTypeAny) =>
    validate(schema, "params");

export const validateQuery =
  (schema: ZodTypeAny) =>
    validate(schema, "query");
