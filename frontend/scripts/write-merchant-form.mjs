import fs from "node:fs";

const content = String.raw`"use client";

import { ChangeEvent } from "react";

import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

import { CountrySelect } from "@/components/forms/country-select";
import { StateSelect } from "@/components/forms/state-select";
import { CitySelect } from "@/components/forms/city-select";
import { CurrencySelect } from "@/components/forms/currency-select";
import { MerchantPhoneInput } from "@/components/forms/phone-input";

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
    (
      event:
        | ChangeEvent<HTMLInputElement>
        | ChangeEvent<HTMLSelectElement>
    ) =>
      onChange({
        ...value,
        [field]: event.target.value,
      });

  const updateValue =
    (field: keyof CreateMerchantDto) =>
    (newValue: string) =>
      onChange({
        ...value,
        [field]: newValue,
      });

  return (
    <div className="grid grid-cols-1 gap-5 py-2 md:grid-cols-2">

      <div className="md:col-span-2">
        <Label>Business Name *</Label>
        <Input
          value={value.businessName}
          onChange={update("businessName")}
        />
      </div>

      <div>
        <Label>Business Type</Label>
        <Input
          value={value.businessType}
          onChange={update("businessType")}
        />
      </div>

      <div>
        <Label>Legal Business Name</Label>
        <Input
          value={value.legalBusinessName ?? ""}
          onChange={update("legalBusinessName")}
        />
      </div>

      <div>
        <Label>Email *</Label>
        <Input
          type="email"
          value={value.email}
          onChange={update("email")}
        />
      </div>

      <div>
        <Label>Phone</Label>
        <MerchantPhoneInput
          value={value.phone ?? ""}
          defaultCountry={value.country || undefined}
          onChange={updateValue("phone")}
        />
      </div>

      <div className="md:col-span-2">
        <Label>Website</Label>

        <div className="flex">
          <span className="flex items-center rounded-l-md border border-r-0 border-slate-300 bg-slate-100 px-3 text-sm text-slate-600">
            https://www.
          </span>

          <Input
            className="rounded-l-none"
            value={value.website ?? ""}
            onChange={update("website")}
          />
        </div>
      </div>

      <div>
        <Label>Country *</Label>
        <CountrySelect
          value={value.country}
          onChange={updateValue("country")}
        />
      </div>

      <div>
        <Label>Currency *</Label>
        <CurrencySelect
          value={value.currency}
          onChange={updateValue("currency")}
        />
      </div>

      <div>
        <Label>State</Label>
        <StateSelect
          country={value.country}
          value={value.state ?? ""}
          onChange={updateValue("state")}
        />
      </div>

      <div>
        <Label>City</Label>
        <CitySelect
          country={value.country}
          state={value.state ?? ""}
          value={value.city ?? ""}
          onChange={updateValue("city")}
        />
      </div>

      <div className="md:col-span-2">
        <Label>Address</Label>
        <Input
          value={value.address ?? ""}
          onChange={update("address")}
        />
      </div>

      <div>
        <Label>Postal Code</Label>
        <Input
          value={value.postalCode ?? ""}
          onChange={update("postalCode")}
        />
      </div>

    </div>
  );
}
`;

fs.writeFileSync(
  "components/merchants/merchant-form.tsx",
  content
);

console.log("merchant-form.tsx written");
