"use client";

import { useQuery } from "@tanstack/react-query";
import { api } from "@/lib/api";

export function useTransactions() {
  return useQuery({
    queryKey: ["transactions"],
    queryFn: async () => {
      const res = await api.get("/api/v1/transactions");
      return res.data.data.items;
    },
    refetchInterval: 5000,
  });
}
