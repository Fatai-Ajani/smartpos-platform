import { z } from "zod";

export const createPaymentIntentSchema = z.object({
  merchantId: z.string().min(1),
  amount: z.coerce.number().positive(),
  currency: z.string().min(3).max(10),
  customerId: z.string().optional(),
  description: z.string().optional()
});

export const paymentIntentIdSchema = z.object({
  id: z.string().min(1)
});

export const paymentIntentListQuerySchema = z.object({
  page: z.coerce.number().int().positive().default(1),
  limit: z.coerce.number().int().min(1).max(100).default(10)
});

export type CreatePaymentIntentDto =
  z.infer<typeof createPaymentIntentSchema>;
