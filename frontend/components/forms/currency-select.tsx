"use client";

import Select from "react-select";
import { selectStyles } from "@/lib/react-select-theme";

import { countries } from "@/lib/location/location";

const currencyMap = new Map<
  string,
  {
    value: string;
    label: string;
  }
>();

countries.forEach((country) => {
  if (!country.currency) return;

  if (!currencyMap.has(country.currency)) {
    currencyMap.set(country.currency, {
      value: country.currency,
      label: `${country.currency} (${country.name})`,
    });
  }
});

const options = [...currencyMap.values()].sort((a, b) =>
  a.label.localeCompare(b.label)
);

interface CurrencySelectProps {
  value: string;
  onChange: (value: string) => void;
}

export function CurrencySelect({
  value,
  onChange,
}: CurrencySelectProps) {
  return (
    <Select
      
      styles={selectStyles}options={options}
      value={
        options.find(
          (option) => option.value === value
        ) ?? null
      }
      onChange={(option) =>
        onChange(option?.value ?? "")
      }
      placeholder="Select currency..."
      isSearchable
    />
  );
}