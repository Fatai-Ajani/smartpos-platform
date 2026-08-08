import { BlockchainQueue } from "./bullmq.queue.js";

export async function enqueueBlockchainSettlement(
  data: {
    transactionId: string;
    blockchain: string;
    merchantWalletId: string;
    destinationWalletId: string;
    fromAddress: string;
    toAddress: string;
    currency: string;
  }
) {
  return BlockchainQueue.add(
    "settle-blockchain",
    data,
    {
      attempts: 5,
      backoff: {
        type: "exponential",
        delay: 2000
      },
      removeOnComplete: 100,
      removeOnFail: 500
    }
  );
}
