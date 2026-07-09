```typescript
import { FastifyInstance } from "fastify";

export default async function healthRoutes(app: FastifyInstance) {
  app.get("/api/v1/health", async () => {
    try {
      await app.prisma.$queryRaw`SELECT 1`;

      return {
        status: "ok",
        timestamp: new Date().toISOString(),
        services: {
          database: "up"
        }
      };
    } catch {
      return app.code(503).send({
        status: "unhealthy",
        timestamp: new Date().toISOString(),
        services: {
          database: "down"
        }
      });
    }
  });
}
```
