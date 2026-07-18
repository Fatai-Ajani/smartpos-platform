import Fastify from "fastify";

import { registerPlugins } from "./plugins/index.js";

import registerRoutes from "./routes/index.js";

const app = Fastify({
  logger: true
});

async function buildApp() {

  /*
  |--------------------------------------------------------------------------
  | Core Plugins
  |--------------------------------------------------------------------------
  */

  await registerPlugins(app);

  /*
  |--------------------------------------------------------------------------
  | Routes
  |--------------------------------------------------------------------------
  */

  await app.register(
    registerRoutes
  );

  /*
  |--------------------------------------------------------------------------
  | Health Check
  |--------------------------------------------------------------------------
  */

  app.get(
    "/health",
    async () => {
      return {
        success: true,
        service: "SmartPOS API",
        status: "healthy",
        timestamp: new Date()
      };
    }
  );

  return app;

}

export default buildApp;