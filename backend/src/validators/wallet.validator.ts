import { z } from "zod";

export const createWalletSchema = z.object({
  merchantId: z.string().min(1),
  name: z.string().min(2).max(100),
  currency: z.string().min(3).max(10)
});

export const walletIdSchema = z.object({
  id: z.string().min(1)
});

export const amountSchema = z.object({
  amount: z.coerce.number().positive()
});

export const transferSchema = z.object({
  fromWalletId: z.string().min(1),
  toWalletId: z.string().min(1),
  amount: z.coerce.number().positive()
});

export const merchantWalletsSchema = z.object({
  merchantId: z.string().min(1)
});

export type CreateWalletDto =
  z.infer<typeof createWalletSchema>;

export type WalletTransferDto =
  z.infer<typeof transferSchema>;
