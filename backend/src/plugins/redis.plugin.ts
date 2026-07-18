import fp from "fastify-plugin";

import { Redis } from "ioredis";

import env from "../config/env.js";

export default fp(async (app) => {

  if (!env.REDIS_URL) {
  app.log.warn("Redis disabled.");
  return;
}

const redis = new Redis(env.REDIS_URL, {
  maxRetriesPerRequest: null,
  enableReadyCheck: false
});

redis.on("error", (err) => {
  app.log.warn(`Redis unavailable: ${err.message}`);
});

  app.decorate(

    "redis",

    redis

  );

  app.addHook(

    "onClose",

    async () => {

      await redis.quit();

    }

  );

});
