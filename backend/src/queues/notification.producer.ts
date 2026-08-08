import { NotificationQueue } from "./bullmq.queue.js";

export async function enqueueNotification(
  data: {
    channel: "email" | "sms" | "push";
    recipient: string;
    subject?: string;
    message?: string;
    token?: string;
    title?: string;
    body?: string;
    data?: Record<string, any>;
  }
) {
  return NotificationQueue.add(
    `send-${data.channel}`,
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
