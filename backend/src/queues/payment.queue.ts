import { Job, Worker } from "bullmq";

import {
  BullConnection
} from "./bullmq.queue.js";

import TransactionService from "../services/transaction.service.js";

export default function createPaymentWorker(
  transactionService: TransactionService
) {
  return new Worker(
    "payments",
    async (job: Job) => {
      const {
        transactionId,
        fromCurrency,
        toCurrency
      } = job.data;

      return transactionService.executePayment({
        transactionId,
        fromCurrency,
        toCurrency
      });
    },
    {
      connection: BullConnection
    }
  );
}
