import { SettlementQueue } from "./bullmq.queue.js";

export async function enqueueSettlement(
  settlementId: string
) {
  return SettlementQueue.add(
    "process-settlement",
    {
      settlementId
    },
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
