import BlockchainService from "../services/blockchain.service.js";
import createBlockchainWorker from "./blockchain.queue.js";
import PaymentService from "../services/payment.service.js";
import SettlementService from "../services/settlement.service.js";
import WebhookService from "../services/webhook.service.js";

import createSettlementWorker from "./settlement.queue.js";
import createWebhookWorker from "./webhook.queue.js";
import createNotificationWorker from "./notification.queue.js";

export default class QueueManager {

  constructor(

    private readonly _paymentService: PaymentService,

    private readonly settlementService: SettlementService,
    
    private readonly blockchainService: BlockchainService,

    private readonly webhookService: WebhookService

  ) {}

  start() {
    createSettlementWorker(
      this.settlementService
    );

    createBlockchainWorker(
      this.blockchainService
    );

    createWebhookWorker(
      this.webhookService
    );

    createNotificationWorker();

  }

}
