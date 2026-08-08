import { Worker } from "bullmq";

import BlockchainService from "../services/blockchain.service.js";
import createBlockchainWorker from "./blockchain.queue.js";

import SettlementService from "../services/settlement.service.js";
import createSettlementWorker from "./settlement.queue.js";

import WebhookService from "../services/webhook.service.js";
import createWebhookWorker from "./webhook.queue.js";

import createNotificationWorker from "./notification.queue.js";

import TransactionService from "../services/transaction.service.js";
import createPaymentWorker from "./payment.queue.js";

export default class QueueManager {

  private paymentWorker?: Worker;
  private settlementWorker?: Worker;
  private blockchainWorker?: Worker;
  private webhookWorker?: Worker;
  private notificationWorker?: Worker;

  constructor(
    private readonly transactionService: TransactionService,
    private readonly settlementService: SettlementService,
    private readonly blockchainService: BlockchainService,
    private readonly webhookService: WebhookService
  ) {}

  start() {

    if (
      this.paymentWorker ||
      this.settlementWorker ||
      this.blockchainWorker ||
      this.webhookWorker ||
      this.notificationWorker
    ) {
      return;
    }

    this.paymentWorker =
      createPaymentWorker(
        this.transactionService
      );

    this.settlementWorker =
      createSettlementWorker(
        this.settlementService
      );

    this.blockchainWorker =
      createBlockchainWorker(
        this.blockchainService
      );

    this.webhookWorker =
      createWebhookWorker(
        this.webhookService
      );

    this.notificationWorker =
      createNotificationWorker();
  }

  async close() {

    const workers = [
      this.paymentWorker,
      this.settlementWorker,
      this.blockchainWorker,
      this.webhookWorker,
      this.notificationWorker
    ];

    await Promise.all(
      workers
        .filter(
          (
            worker
          ): worker is Worker =>
            Boolean(worker)
        )
        .map(
          worker => worker.close()
        )
    );

    this.paymentWorker = undefined;
    this.settlementWorker = undefined;
    this.blockchainWorker = undefined;
    this.webhookWorker = undefined;
    this.notificationWorker = undefined;
  }
}
