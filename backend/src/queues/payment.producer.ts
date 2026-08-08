import { PaymentQueue } from "./bullmq.queue.js";

export async function enqueuePayment(data: {
  transactionId: string;
  fromCurrency: string;
  toCurrency: string;
}) {
  return PaymentQueue.add(
    "execute-payment",
    data,
    {
      attempts: 3,
      backoff: {
        type: "exponential",
        delay: 1000
      },
      removeOnComplete: 100,
      removeOnFail: 500
    }
  );
}
