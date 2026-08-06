"use client";

import Select from "react-select";

import { countries } from "@/lib/location/location";

interface Props {
  country: string;
  value: string;
  onChange: (value: string) => void;
}

export function CurrencySelect({
  country,
  value,
  onChange,
}: Props) {
  const options = countries
    .filter((c) => !country || c.isoCode === country)
    .map((c) => ({
      value: c.currency || "",
      label: `${c.currency || ""} - ${c.name}`,
    }));

  return (
    <Select
      options={options}
      value={
        options.find((o) => o.value === value) ??
        null
      }
      onChange={(o) => onChange(o?.value ?? "")}
      placeholder="Currency..."
      isSearchable
    />
  );
}