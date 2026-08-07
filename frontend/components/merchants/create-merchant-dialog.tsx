"use client";

import { useState } from "react";
import { X } from "lucide-react";

import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogClose,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";

import { MerchantForm } from "./merchant-form";
import { useCreateMerchant } from "@/features/merchants/hooks/use-create-merchant";

import type { CreateMerchantDto } from "@/features/merchants/types/merchant";

const initialState: CreateMerchantDto = {
  businessName: "",
  businessType: "GENERAL",
  legalBusinessName: "",
  email: "",
  phone: "",
  website: "",
  country: "",
  currency: "USD",
  state: "",
  city: "",
  address: "",
  postalCode: "",
};

export function CreateMerchantDialog() {
  const [form, setForm] = useState(initialState);

  const createMerchant = useCreateMerchant();

  async function handleSubmit() {
    await createMerchant.mutateAsync(form);
    setForm(initialState);
  }

  return (
    <Dialog>
      <DialogTrigger
        className="inline-flex items-center rounded-xl bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-blue-700 focus:outline-none focus:ring-4 focus:ring-blue-500/15"
      >
        New Merchant
      </DialogTrigger>

      <DialogContent className="w-[calc(100vw-2rem)] max-h-[92vh] max-w-5xl overflow-y-auto rounded-2xl border border-slate-200 bg-white p-0 shadow-2xl">
        <div className="border-b border-slate-200 bg-gradient-to-r from-white via-white to-blue-50/70 px-6 py-6 md:px-8">
          <DialogHeader>
            <div className="flex items-start justify-between gap-4 pr-8">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.16em] text-blue-600">
                  Merchant onboarding
                </p>

                <DialogTitle className="mt-1 text-2xl font-semibold tracking-tight text-slate-950">
                  Create merchant
                </DialogTitle>

                <p className="mt-2 max-w-2xl text-sm leading-6 text-slate-500">
                  Set up the business profile and settlement details needed to
                  activate this merchant in SmartPOS.
                </p>
              </div>

              <DialogClose
                aria-label="Close merchant form"
                className="absolute right-5 top-5 inline-flex h-9 w-9 items-center justify-center rounded-full border border-slate-200 bg-white text-slate-500 shadow-sm transition hover:border-blue-200 hover:bg-blue-50 hover:text-blue-600 focus:outline-none focus:ring-4 focus:ring-blue-500/10"
              >
                <X className="h-4 w-4" />
              </DialogClose>
            </div>
          </DialogHeader>
        </div>

        <div className="px-6 py-6 md:px-8">
          <MerchantForm value={form} onChange={setForm} />
        </div>

        <DialogFooter className="border-t border-slate-200 bg-slate-50/80 px-6 py-4 md:px-8">
          <DialogClose
            className="inline-flex h-10 items-center justify-center rounded-xl border border-slate-200 bg-white px-4 text-sm font-semibold text-slate-700 shadow-sm transition hover:bg-slate-50 focus:outline-none focus:ring-4 focus:ring-slate-500/10"
          >
            Cancel
          </DialogClose>

          <Button
            className="h-10 rounded-xl bg-blue-600 px-5 font-semibold text-white shadow-sm hover:bg-blue-700 focus:ring-4 focus:ring-blue-500/15"
            onClick={handleSubmit}
            disabled={createMerchant.isPending}
          >
            {createMerchant.isPending ? "Creating..." : "Create Merchant"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
