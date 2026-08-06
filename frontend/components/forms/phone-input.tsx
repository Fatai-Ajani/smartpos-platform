"use client";

import PhoneInput from "react-phone-number-input";
import "react-phone-number-input/style.css";

interface Props {
  value: string;
  defaultCountry?: string;
  onChange: (value: string) => void;
}

export function MerchantPhoneInput({
  value,
  defaultCountry,
  onChange,
}: Props) {
  return (
    <PhoneInput
      international
      defaultCountry={
        (defaultCountry as any) || undefined
      }
      value={value}
      onChange={(v) => onChange(v ?? "")}
      className="rounded-lg border border-slate-300 p-2"
    />
  );
}