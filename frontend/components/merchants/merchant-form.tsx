"use client";

import { ChangeEvent } from "react";

import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

import type { CreateMerchantDto } from "@/features/merchants/types/merchant";

interface MerchantFormProps {
  value: CreateMerchantDto;
  onChange: (value: CreateMerchantDto) => void;
}

export function MerchantForm({
  value,
  onChange,
}: MerchantFormProps) {

  const update =
    (field: keyof CreateMerchantDto) =>
    (event: ChangeEvent<HTMLInputElement | HTMLSelectElement>) =>
      onChange({
        ...value,
        [field]: event.target.value,
      });

  return (
    <div className="grid gap-4 py-2">

      <div>
        <Label>Business Name *</Label>
        <Input value={value.businessName} onChange={update("businessName")} />
      </div>

      <div>
        <Label>Business Type</Label>
        <Input value={value.businessType} onChange={update("businessType")} />
      </div>

      <div>
        <Label>Legal Business Name</Label>
        <Input value={value.legalBusinessName ?? ""} onChange={update("legalBusinessName")} />
      </div>

      <div>
        <Label>Email *</Label>
        <Input type="email" value={value.email} onChange={update("email")} />
      </div>

      <div>
        <Label>Phone</Label>
        <Input value={value.phone ?? ""} onChange={update("phone")} />
      </div>

      <div>
        <Label>Website</Label>
        <Input value={value.website ?? ""} onChange={update("website")} />
      </div>

      <div>
        <Label>Country *</Label>
        <Input value={value.country} onChange={update("country")} />
      </div>

      <div>
        <Label>Currency *</Label>
        <Input value={value.currency} onChange={update("currency")} />
      </div>

      <div>
        <Label>State</Label>
        <Input value={value.state ?? ""} onChange={update("state")} />
      </div>

      <div>
        <Label>City</Label>
        <Input value={value.city ?? ""} onChange={update("city")} />
      </div>

      <div>
        <Label>Address</Label>
        <Input value={value.address ?? ""} onChange={update("address")} />
      </div>

      <div>
        <Label>Postal Code</Label>
        <Input value={value.postalCode ?? ""} onChange={update("postalCode")} />
      </div>

    </div>
  );
}
