import Fastify from "fastify";

import { registerPlugins } from "./plugins/index.js";
import registerRoutes from "./routes/index.js";

import BlockchainService from "./services/blockchain.service.js";
import TransactionService from "./services/transaction.service.js";
import SettlementService from "./services/settlement.service.js";
import WebhookService from "./services/webhook.service.js";

import QueueManager from "./queues/queue.manager.js";

const app = Fastify({
  logger: true
});

async function buildApp() {
  await registerPlugins(app);

  await app.register(
    registerRoutes
  );

  const transactionService = new TransactionService(app);
const settlementService =
    new SettlementService(app);

  const blockchainService =
    new BlockchainService(app);

  const webhookService =
    new WebhookService(app);

  const queueManager =
    new QueueManager(
    transactionService,
      settlementService,
      blockchainService,
      webhookService
    );

  queueManager.start();

  app.addHook(
    "onClose",
    async () => {
      await queueManager.close();
    }
  );

  return app;
}

export default buildApp;
