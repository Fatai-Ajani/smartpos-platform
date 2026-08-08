import { WebhookQueue } from "./bullmq.queue.js";

export async function enqueueWebhook(
  webhookId: string
) {
  return WebhookQueue.add(
    "process-webhook",
    {
      webhookId
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
