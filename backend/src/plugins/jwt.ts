import fp from "fastify-plugin";
import fastifyJwt from "@fastify/jwt";

export default fp(async (app) => {
  await app.register(fastifyJwt, {
    secret: process.env.JWT_SECRET || "CHANGE_THIS_SECRET",
    sign: {
      expiresIn: process.env.JWT_ACCESS_EXPIRES_IN || "15m",
    },
  });
});
