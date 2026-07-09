import { FastifyError, FastifyInstance } from "fastify";
import { ZodError } from "zod";

import { AppError } from "../utils/error";
import { logger } from "../utils/logger";

export async function registerErrorHandler(app: FastifyInstance) {
  app.setErrorHandler(
    (error: FastifyError | AppError | ZodError, request, reply) => {
      logger.error(error);

      if (error instanceof ZodError) {
        return reply.status(400).send({
          success: false,
          message: "Validation failed",
          errors: error.errors.map((e) => ({
            field: e.path.join("."),
            message: e.message
          }))
        });
      }

      if (error instanceof AppError) {
        return reply.status(error.statusCode).send({
          success: false,
          message: error.message
        });
      }

      return reply.status(500).send({
        success: false,
        message: "Internal Server Error"
      });
    }
  );
}
