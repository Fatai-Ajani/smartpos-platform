"use client"

import { useQuery } from "@tanstack/react-query"
import { getDashboardMetrics } from "../services/metrics.service"

export function useDashboardMetrics() {
  return useQuery({
    queryKey: ["dashboard", "metrics"],
    queryFn: getDashboardMetrics,
    staleTime: 30_000,
    refetchInterval: 60_000,
  })
}
