"use client";

import Select from "react-select";

import { getStates } from "@/lib/location/location";

interface StateSelectProps {
  country: string;
  value: string;
  onChange: (value: string) => void;
}

export function StateSelect({
  country,
  value,
  onChange,
}: StateSelectProps) {
  const options = getStates(country).map((state) => ({
    value: state.isoCode,
    label: state.name,
  }));

  return (
    <Select
      options={options}
      value={
        options.find(
          (option) => option.value === value
        ) ?? null
      }
      onChange={(option) =>
        onChange(option?.value ?? "")
      }
      placeholder="Select state..."
      isDisabled={!country}
      isSearchable
    />
  );
}
