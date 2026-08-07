"use client";

import { MerchantSearch } from "./merchant-search";
import { MerchantStatusFilter } from "./status-filter";

interface Props {
  search: string;
  status: string;
  onSearch: (value: string) => void;
  onStatus: (value: string) => void;
}

export function MerchantToolbar({
  search,
  status,
  onSearch,
  onStatus,
}: Props) {
  return (
    <div className="mb-6 grid gap-4 md:grid-cols-[1fr_220px]">
      <MerchantSearch
        value={search}
        onChange={onSearch}
      />

      <MerchantStatusFilter
        value={status}
        onChange={onStatus}
      />
    </div>
  );
}