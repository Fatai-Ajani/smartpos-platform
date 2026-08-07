import { z } from "zod";

export const merchantSchema = z.object({
  businessName: z.string().min(2, "Business name is required"),

  businessType: z.string().min(1),

  legalBusinessName: z.string().optional(),

  email: z.string().email("Invalid email"),

  phone: z.string().optional(),

  website: z.string().optional(),

  country: z.string().min(1, "Country is required"),

  currency: z.string().min(1, "Currency is required"),

  state: z.string().optional(),

  city: z.string().optional(),

  address: z.string().optional(),

  postalCode: z.string().optional(),
});

export type MerchantFormValues = z.infer<typeof merchantSchema>;