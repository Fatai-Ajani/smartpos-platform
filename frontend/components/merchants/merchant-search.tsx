"use client";

import { Input } from "@/components/ui/input";

interface MerchantSearchProps {
  value: string;
  onChange: (value: string) => void;
}

export function MerchantSearch({
  value,
  onChange,
}: MerchantSearchProps) {
  return (
    <Input
      placeholder="Search merchants..."
      value={value}
      onChange={(e) => onChange(e.target.value)}
    />
  );
}