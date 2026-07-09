import fp from "fastify-plugin";
import fastifyJwt from "@fastify/jwt";
import { FastifyInstance } from "fastify";

export default fp(async (app: FastifyInstance) => {
  await app.register(fastifyJwt, {
    secret: process.env.JWT_SECRET || "smartpos-secret-key"
  });
});

declare module "@fastify/jwt" {
  interface FastifyJWT {
    payload: {
      id: string;
      email: string;
      role: string;
    };

    user: {
      id: string;
      email: string;
      role: string;
    };
  }
}
