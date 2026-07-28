"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

export interface DashboardMetrics {
  totalMerchants: number;
  activeTerminals: number;
  transactionsToday: number;
  revenue: string | number;
}

interface MetricsResponse {
  success: boolean;
  data: DashboardMetrics;
}

async function getDashboardMetrics(): Promise<DashboardMetrics> {
  const response = await api.get<MetricsResponse>(
    ENDPOINTS.dashboard.metrics
  );

  return response.data.data;
}

export function useDashboardMetrics() {
  return useQuery({
    queryKey: ["dashboard", "metrics"],
    queryFn: getDashboardMetrics,
  });
}
