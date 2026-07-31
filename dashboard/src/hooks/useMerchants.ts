"use client";

import { useQuery } from "@tanstack/react-query";
import { api } from "@/lib/api";

export function useMerchants(){

  return useQuery({

    queryKey:["merchants"],

    queryFn:async()=>{

      const res=await api.get("/api/v1/merchants");

      return res.data.data.items;

    },

    refetchInterval:10000,

  });

}
