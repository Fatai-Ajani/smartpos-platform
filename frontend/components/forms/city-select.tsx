"use client";

import Select from "react-select";

import { getCities } from "@/lib/location/location";

interface Props {
  country: string;
  state: string;
  value: string;
  onChange: (value: string) => void;
}

export function CitySelect({
  country,
  state,
  value,
  onChange,
}: Props) {
  const options = getCities(country, state).map(
    (city) => ({
      value: city.name,
      label: city.name,
    })
  );

  return (
    <Select
      options={options}
      value={
        options.find((o) => o.value === value) ??
        null
      }
      onChange={(o) => onChange(o?.value ?? "")}
      placeholder="City..."
      isDisabled={!country || !state}
      isSearchable
    />
  );
}