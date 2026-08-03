import { z } from "zod";

export const createMerchantSchema = z.object({

  businessName: z.string().min(2),

  businessType: z.string().default("GENERAL"),

  legalBusinessName: z.string().optional(),

  email: z.string().email(),

  phone: z.string().optional(),

  website: z.string().url().optional(),

  country: z.string(),

  state: z.string().optional(),

  city: z.string().optional(),

  address: z.string().optional(),

  postalCode: z.string().optional()

});

export const updateMerchantSchema =
  createMerchantSchema.partial();

export const merchantIdSchema =
  z.object({

    id: z.string().min(1)

  });

export const merchantDashboardSchema =
  z.object({

    merchantId: z.string().min(1)

  });

export const merchantListQuerySchema =
  z.object({

    page:
      z.coerce.number().int().positive().default(1),

    limit:
      z.coerce.number().int().min(1).max(100).default(10)

  });

export type CreateMerchantDto =
  z.infer<typeof createMerchantSchema>;

export type UpdateMerchantDto =
  z.infer<typeof updateMerchantSchema>;
