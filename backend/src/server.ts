import app from "./app.js";

const start = async () => {
  try {
    await app.listen({
      host: process.env.HOST || "0.0.0.0",
      port: Number(process.env.PORT) || 4000
    });

    app.log.info("======================================");
    app.log.info(" SmartPOS Backend Started Successfully ");
    app.log.info("======================================");
  } catch (error) {
    app.log.error(error);
    process.exit(1);
  }
};

start();
