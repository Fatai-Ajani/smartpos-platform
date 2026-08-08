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
