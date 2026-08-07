"use client";

import Select from "react-select";
import { selectStyles } from "@/lib/react-select-theme";

import { getCities } from "@/lib/location/location";

interface CitySelectProps {
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
}: CitySelectProps) {
  const options = getCities(country, state).map((city) => ({
    value: city.name,
    label: city.name,
  }));

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
      placeholder="Select city..."
      isDisabled={!country || !state}
      isSearchable
      noOptionsMessage={() => "No cities found"}
    />
  );
}