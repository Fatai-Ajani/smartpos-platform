import fp from "fastify-plugin";
import Redis from "ioredis";
import { FastifyInstance } from "fastify";

const redis = new Redis({
  host: process.env.REDIS_HOST,
  port: Number(process.env.REDIS_PORT),
  password: process.env.REDIS_PASSWORD || undefined,
  lazyConnect: true
});

declare module "fastify" {
  interface FastifyInstance {
    redis: Redis;
  }
}

export default fp(async function (app: FastifyInstance) {

  await redis.connect();

  app.decorate("redis", redis);

  app.addHook("onClose", async () => {
    await redis.quit();
  });

});
