"use client";

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

const fieldClass =
  "mt-2 h-11 rounded-xl border-slate-200 bg-white text-slate-900 shadow-sm transition focus-visible:border-blue-500 focus-visible:ring-4 focus-visible:ring-blue-500/10";

const labelClass = "text-sm font-medium text-slate-700";

export function MerchantForm({ value, onChange }: MerchantFormProps) {
  const update =
    (field: keyof CreateMerchantDto) =>
    (event: ChangeEvent<HTMLInputElement>) =>
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
    <div className="space-y-8">
      <section className="rounded-2xl border border-slate-200 bg-slate-50/60 p-5 md:p-6">
        <div className="mb-5">
          <p className="text-xs font-semibold uppercase tracking-[0.16em] text-blue-600">
            Business profile
          </p>

          <h3 className="mt-1 text-lg font-semibold tracking-tight text-slate-950">
            Tell us about the merchant
          </h3>

          <p className="mt-1 text-sm text-slate-500">
            These details identify the business across SmartPOS.
          </p>
        </div>

        <div className="grid gap-5 md:grid-cols-2">
          <div>
            <Label className={labelClass}>Business Name *</Label>

            <Input
              className={fieldClass}
              value={value.businessName}
              onChange={update("businessName")}
              placeholder="e.g. Acme Stores"
            />
          </div>

          <div>
            <Label className={labelClass}>Business Type</Label>

            <Input
              className={fieldClass}
              value={value.businessType}
              onChange={update("businessType")}
              placeholder="e.g. Retail"
            />
          </div>

          <div>
            <Label className={labelClass}>Legal Business Name</Label>

            <Input
              className={fieldClass}
              value={value.legalBusinessName ?? ""}
              onChange={update("legalBusinessName")}
              placeholder="Registered legal name"
            />
          </div>

          <div>
            <Label className={labelClass}>Email *</Label>

            <Input
              className={fieldClass}
              type="email"
              value={value.email}
              onChange={update("email")}
              placeholder="merchant@example.com"
            />
          </div>

          <div>
            <Label className={labelClass}>Phone</Label>

            <div className="mt-2">
              <MerchantPhoneInput
                value={value.phone ?? ""}
                defaultCountry={value.country || undefined}
                onChange={updateValue("phone")}
              />
            </div>
          </div>

          <div>
            <Label className={labelClass}>Website</Label>

            <div className="mt-2 flex">
              <span className="flex h-11 items-center rounded-l-xl border border-r-0 border-slate-200 bg-slate-50 px-3 text-sm font-medium text-slate-500">
                https://
              </span>

              <Input
                className="h-11 rounded-l-none rounded-r-xl border-slate-200 bg-white shadow-sm focus-visible:border-blue-500 focus-visible:ring-4 focus-visible:ring-blue-500/10"
                value={value.website ?? ""}
                onChange={update("website")}
                placeholder="example.com"
              />
            </div>
          </div>
        </div>
      </section>

      <section className="rounded-2xl border border-slate-200 bg-white p-5 md:p-6">
        <div className="mb-5">
          <p className="text-xs font-semibold uppercase tracking-[0.16em] text-blue-600">
            Location & settlement
          </p>

          <h3 className="mt-1 text-lg font-semibold tracking-tight text-slate-950">
            Where does this merchant operate?
          </h3>

          <p className="mt-1 text-sm text-slate-500">
            Location and currency are used throughout the merchant account.
          </p>
        </div>

        <div className="grid gap-5 md:grid-cols-2">
          <div>
            <Label className={labelClass}>Country *</Label>

            <div className="mt-2">
              <CountrySelect
                value={value.country}
                onChange={updateValue("country")}
              />
            </div>
          </div>

          <div>
            <Label className={labelClass}>Currency *</Label>

            <div className="mt-2">
              <CurrencySelect
                value={value.currency}
                onChange={updateValue("currency")}
              />
            </div>
          </div>

          <div>
            <Label className={labelClass}>State</Label>

            <div className="mt-2">
              <StateSelect
                country={value.country}
                value={value.state ?? ""}
                onChange={updateValue("state")}
              />
            </div>
          </div>

          <div>
            <Label className={labelClass}>City</Label>

            <div className="mt-2">
              <CitySelect
                country={value.country}
                state={value.state ?? ""}
                value={value.city ?? ""}
                onChange={updateValue("city")}
              />
            </div>
          </div>

          <div className="md:col-span-2">
            <Label className={labelClass}>Address</Label>

            <Input
              className={fieldClass}
              value={value.address ?? ""}
              onChange={update("address")}
              placeholder="Street address"
            />
          </div>

          <div>
            <Label className={labelClass}>Postal Code</Label>

            <Input
              className={fieldClass}
              value={value.postalCode ?? ""}
              onChange={update("postalCode")}
              placeholder="Postal code"
            />
          </div>
        </div>
      </section>
    </div>
  );
}