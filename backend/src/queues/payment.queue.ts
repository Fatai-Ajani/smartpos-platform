import { Worker } from "bullmq";

import { BullConnection } from "./bullmq.queue.js";

import TransactionService from "../services/transaction.service.js";

export default function createPaymentWorker(
  transactionService: TransactionService
) {
  return new Worker(
    "payments",
    async job => {

      if (job.name !== "execute-payment") {
        throw new Error(
          `Unknown payment job: ${job.name}`
        );
      }

      return transactionService.executePayment(
        job.data
      );
    },
    {
      connection: BullConnection
    }
  );
}
