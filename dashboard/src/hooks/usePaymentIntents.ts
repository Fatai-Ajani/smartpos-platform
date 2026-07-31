"use client";

import { useQuery } from "@tanstack/react-query";
import { api } from "@/lib/api";

export function usePaymentIntents() {
  return useQuery({
    queryKey:["payment-intents"],
    queryFn:async()=>{
      const res=await api.get("/api/v1/payment-intents");
      return res.data.data;
    },
    refetchInterval:5000,
  });
}
