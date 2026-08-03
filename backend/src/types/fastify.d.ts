import "@fastify/jwt";
import "fastify";
import { Redis } from "ioredis";

declare module "@fastify/jwt" {

  interface FastifyJWT {

    payload: {
      id: string;
      email: string;
      role: string;
      merchantId?: string;
    };

    user: {
      id: string;
      email: string;
      role: string;
      merchantId?: string;
    };

  }

}

declare module "fastify" {

  interface FastifyRequest {
    idempotencyKey?: string;
  }

  interface FastifyInstance {
    redis: Redis;
  }

}
