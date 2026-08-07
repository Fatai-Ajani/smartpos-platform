"use client";

import Select from "react-select";
import { selectStyles } from "@/lib/react-select-theme";
import ReactCountryFlag from "react-country-flag";

import { countries } from "@/lib/location/location";

const options = countries.map((country) => ({
  value: country.isoCode,
  label: country.name,
  phone: country.phonecode,
}));

interface CountrySelectProps {
  value: string;
  onChange: (country: string) => void;
}

export function CountrySelect({
  value,
  onChange,
}: CountrySelectProps) {
  return (
    <Select
      
      styles={selectStyles}options={options}
      placeholder="Select country..."
      value={
        options.find(
          (option) => option.value === value
        ) ?? null
      }
      onChange={(option) =>
        onChange(option?.value ?? "")
      }
      formatOptionLabel={(option) => (
        <div className="flex items-center gap-2">
          <ReactCountryFlag
            countryCode={option.value}
            svg
            style={{
              width: "1.2em",
              height: "1.2em",
            }}
          />

          <span>{option.label}</span>

          <span className="ml-auto text-slate-400">
            +{option.phone}
          </span>
        </div>
      )}
      isSearchable
    />
  );
}
