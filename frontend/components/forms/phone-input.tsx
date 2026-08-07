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
      defaultCountry={defaultCountry as never}
      value={value}
      onChange={(value) => onChange(value ?? "")}
      className="PhoneInput h-11 w-full rounded-xl border border-slate-200 bg-white px-3 shadow-sm transition focus-within:border-blue-500 focus-within:ring-4 focus-within:ring-blue-500/10"
    />
  );
}
