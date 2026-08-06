"use client";

import { ChangeEvent } from "react";

import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

import { CountrySelect } from "@/components/forms/country-select";
import { StateSelect } from "@/components/forms/state-select";
import { CitySelect } from "@/components/forms/city-select";
import { CurrencySelect } from "@/components/forms/currency-select";
import { MerchantPhoneInput } from "@/components/forms/phone-input";

import type {
  CreateMerchantDto,
} from "@/features/merchants/types/merchant";

interface MerchantFormProps {
  value: CreateMerchantDto;
  onChange: (value: CreateMerchantDto) => void;
}

export function MerchantForm({
  value,
  onChange,
}: MerchantFormProps) {
  function update(
    field: keyof CreateMerchantDto
  ) {
    return (
      event:
        | ChangeEvent<HTMLInputElement>
        | ChangeEvent<HTMLSelectElement>
    ) => {
      onChange({
        ...value,
        [field]: event.target.value,
      });
    };
  }

  function updateValue(
    field: keyof CreateMerchantDto,
    fieldValue: string
  ) {
    onChange({
      ...value,
      [field]: fieldValue,
    });
  }

  return (
    <div className="grid grid-cols-1 gap-5 py-2 md:grid-cols-2">

      <div>
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

      <div className="md:col-span-2">
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
          defaultCountry={value.country}
          onChange={(v) =>
            updateValue("phone", v)
          }
        />
      </div>

      <div>
        <Label>Website</Label>

        <div className="flex rounded-lg border border-slate-300">
          <span className="flex items-center border-r bg-slate-100 px-3 text-sm">
            https://www.
          </span>

          <Input
            className="border-0"
            value={value.website ?? ""}
            onChange={update("website")}
          />
        </div>
      </div>

      <div>
        <Label>Country *</Label>

        <CountrySelect
          value={value.country}
          onChange={(country) =>
            updateValue("country", country)
          }
        />
      </div>

      <div>
        <Label>Currency *</Label>

        <CurrencySelect
          country={value.country}
          value={value.currency}
          onChange={(currency) =>
            updateValue("currency", currency)
          }
        />
      </div>

      <div>
        <Label>State</Label>

        <StateSelect
          country={value.country}
          value={value.state ?? ""}
          onChange={(state) =>
            updateValue("state", state)
          }
        />
      </div>

      <div>
        <Label>City</Label>

        <CitySelect
          country={value.country}
          state={value.state ?? ""}
          value={value.city ?? ""}
          onChange={(city) =>
            updateValue("city", city)
          }
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