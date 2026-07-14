import "fastify";
import type Redis from "ioredis";
import type { PrismaClient } from "@prisma/client";

declare module "fastify" {
  interface FastifyRequest {
    idempotencyKey?: string;
  }

  interface FastifyInstance {
    redis: Redis;
    prisma: PrismaClient;
  }
}