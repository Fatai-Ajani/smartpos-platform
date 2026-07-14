import { Job, Worker } from "bullmq";

import { BullConnection } from "./bullmq.queue.js";

import BlockchainService from "../services/blockchain.service.js";

export default function createBlockchainWorker(
  blockchainService: BlockchainService
) {
  return new Worker(
    "blockchain",

    async (job: Job) => {
      const { transactionId } = job.data;

      // TODO:
      // Replace this with the actual blockchain processing
      // once BlockchainService exposes the required methods.

      await blockchainService.findTransaction(
        transactionId
      );
    },

    {
      connection: BullConnection
    }
  );
}