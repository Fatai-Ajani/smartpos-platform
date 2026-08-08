import "dotenv/config";
import buildApp from "./app.js";

async function start() {
  const app =
    await buildApp();

  const PORT =
    Number(
      process.env.PORT
    ) || 4000;

  const HOST =
    process.env.HOST ||
    "0.0.0.0";

  let shuttingDown = false;

  const shutdown = async (
    signal: NodeJS.Signals
  ) => {
    if (shuttingDown) {
      return;
    }

    shuttingDown = true;

    console.log(
      `Received ${signal}. Shutting down gracefully...`
    );

    try {
      await app.close();

      console.log(
        "SmartPOS API shutdown complete."
      );

      process.exit(0);
    } catch (error) {
      console.error(
        "Graceful shutdown failed:",
        error
      );

      process.exit(1);
    }
  };

  process.on(
    "SIGINT",
    () => {
      void shutdown("SIGINT");
    }
  );

  process.on(
    "SIGTERM",
    () => {
      void shutdown("SIGTERM");
    }
  );

  try {
    if (
      process.env.NODE_ENV ===
      "development"
    ) {
      console.log(
        app.printRoutes()
      );
    }

    await app.listen({
      port: PORT,
      host: HOST
    });

    app.log.info(
      `SmartPOS API running on ${HOST}:${PORT}`
    );
  } catch (error) {
    app.log.error(error);

    process.exit(1);
  }
}

start();
