"use client";

import { useQuery } from "@tanstack/react-query";
import { api } from "@/lib/api";
import type { DashboardMetrics } from "@/types/dashboard";

export function useDashboard() {
  return useQuery<DashboardMetrics>({
    queryKey: ["dashboard"],
    queryFn: async () => {
      const res = await api.get("/api/v1/metrics");
      return res.data.data;
    },
    refetchInterval: 10000,
  });
}
