"use client";

import Select from "react-select";

import { selectStyles } from "@/lib/react-select-theme";

const options = [
  { value: "", label: "All" },
  { value: "ACTIVE", label: "Active" },
  { value: "INACTIVE", label: "Inactive" },
  { value: "SUSPENDED", label: "Suspended" },
];

interface Props {
  value: string;
  onChange: (value: string) => void;
}

export function MerchantStatusFilter({
  value,
  onChange,
}: Props) {
  return (
    <Select
      styles={selectStyles}
      options={options}
      value={options.find((o) => o.value === value) ?? options[0]}
      onChange={(o) => onChange(o?.value ?? "")}
      isSearchable={false}
    />
  );
}