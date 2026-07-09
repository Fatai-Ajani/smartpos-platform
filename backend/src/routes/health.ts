import { FastifyInstance } from "fastify";

export default async function healthRoutes(app: FastifyInstance) {
  app.get("/api/v1/health", async (_request, reply) => {
    try {
      await app.prisma.$queryRaw`SELECT 1`;

      return reply.send({
        status: "ok",
        timestamp: new Date().toISOString(),
        services: {
          database: "up"
        }
      });
    } catch {
      return reply.status(503).send({
        status: "unhealthy",
        timestamp: new Date().toISOString(),
        services: {
          database: "down"
        }
      });
    }
  });
}
