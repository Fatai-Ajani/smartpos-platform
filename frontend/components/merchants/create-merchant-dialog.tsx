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

      <DialogTrigger render={<Button />}>
        New Merchant
      </DialogTrigger>

      <DialogContent className="w-[95vw] max-w-5xl max-h-[90vh] overflow-y-auto">

        <DialogHeader>
          <DialogTitle>Create Merchant</DialogTitle>
        </DialogHeader>

        <MerchantForm
          value={form}
          onChange={setForm}
        />

        <DialogFooter>

          <Button
            variant="outline"
            onClick={() => setOpen(false)}
          >
            Cancel
          </Button>

          <Button
            onClick={handleSubmit}
            disabled={createMerchant.isPending}
          >
            {createMerchant.isPending
              ? "Creating..."
              : "Create Merchant"}
          </Button>

        </DialogFooter>

      </DialogContent>

    </Dialog>
  );
}
