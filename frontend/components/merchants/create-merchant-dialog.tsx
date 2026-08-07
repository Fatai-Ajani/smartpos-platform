"use client";

import { useState } from "react";

import { Button } from "@/components/ui/button";
import {
  Dialog,
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
  const [open, setOpen] = useState(false);
  const [form, setForm] = useState(initialState);

  const createMerchant = useCreateMerchant();

  async function handleSubmit() {
    await createMerchant.mutateAsync(form);
    setForm(initialState);
    setOpen(false);
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger
        render={
          <Button className="h-10 rounded-xl bg-blue-600 px-5 font-semibold text-white shadow-sm transition hover:bg-blue-700 hover:shadow-md" />
        }
      >
        New Merchant
      </DialogTrigger>

      <DialogContent className="w-[calc(100vw-2rem)] max-w-5xl max-h-[92vh] overflow-y-auto rounded-2xl border border-slate-200 bg-white p-0 shadow-2xl">
        <div className="border-b border-slate-200 bg-gradient-to-r from-white via-white to-blue-50/70 px-6 py-6 md:px-8">
          <DialogHeader>
            <div className="pr-8">
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
          </DialogHeader>
        </div>

        <div className="px-6 py-6 md:px-8">
          <MerchantForm value={form} onChange={setForm} />
        </div>

        <DialogFooter className="border-t border-slate-200 bg-slate-50/80 px-6 py-4 md:px-8">
          <Button
            variant="outline"
            className="rounded-xl border-slate-200 bg-white"
            onClick={() => setOpen(false)}
          >
            Cancel
          </Button>

          <Button
            className="rounded-xl bg-blue-600 px-5 font-semibold text-white hover:bg-blue-700"
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