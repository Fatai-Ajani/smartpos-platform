import fp from 'fastify-plugin';
import pino from 'pino';
import { env } from '../config/env';

export default fp(async (fastify) => {
  const logger = pino({
    level: env.LOG_LEVEL,
    transport: env.NODE_ENV !== 'production' ? {
      target: 'pino-pretty',
      options: {
        colorize: true,
        translateTime: 'SYS:standard',
        ignore: 'pid,hostname',
      },
    } : undefined,
  });

  fastify.decorate('logger', logger);
}, { name: 'logger' });

// Extend Fastify types
declare module 'fastify' {
  interface FastifyInstance {
    logger: pino.Logger;
  }
}
