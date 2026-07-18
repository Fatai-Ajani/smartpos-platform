import { FastifyInstance } from "fastify";

import cors from "@fastify/cors";
import helmet from "@fastify/helmet";
import rateLimit from "@fastify/rate-limit";
import sensible from "@fastify/sensible";
import swagger from "@fastify/swagger";
import swaggerUI from "@fastify/swagger-ui";

import redisPlugin from "./redis.plugin.js";
import registerJwt from "./jwt.js";
import registerPrisma from "./prisma.js";
import errorHandlerPlugin from "./error-handler.js";
import requestValidatorPlugin from "./request-validator.js";

import { swaggerOptions } from "../config/swagger.js";

export async function registerPlugins(
  app: FastifyInstance
) {

  await app.register(helmet);

  await app.register(cors, {
    origin: true,
    credentials: true
  });

  await app.register(rateLimit, {
    max: 100,
    timeWindow: "1 minute"
  });

  await app.register(sensible);

  await app.register(
    swagger,
    swaggerOptions
  );

  await app.register(swaggerUI, {
    routePrefix: "/docs"
  });

  await registerJwt(app);

  await registerPrisma(app);

//  await app.register(redisPlugin);

  await app.register(
    errorHandlerPlugin
  );

  await app.register(
    requestValidatorPlugin
  );

}