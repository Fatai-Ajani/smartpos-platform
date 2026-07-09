```typescript
import dotenv from "dotenv";
dotenv.config();

import Fastify from "fastify";

const app = Fastify({
  logger: {
    transport:
      process.env.NODE_ENV === "development"
        ? {
            target: "pino-pretty"
          }
        : undefined
  }
});

app.get("/", async () => {
  return {
    name: "SmartPOS API",
    version: "0.0.1",
    status: "running"
  };
});

app.get("/api/v1/health", async () => {
  return {
    status: "ok",
    timestamp: new Date().toISOString()
  };
});

const start = async () => {
  try {
    const port = Number(process.env.PORT) || 3000;

    await app.listen({
      host: "0.0.0.0",
      port
    });

    app.log.info(`🚀 SmartPOS API running on http://localhost:${port}`);
  } catch (error) {
    app.log.error(error);
    process.exit(1);
  }
};

start();
```
