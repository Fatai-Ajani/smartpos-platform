"use client";

import { useQuery } from "@tanstack/react-query";
import { api } from "@/lib/api";

export function useTerminals(){

  return useQuery({

    queryKey:["terminals"],

    queryFn:async()=>{

      const res=await api.get("/api/v1/terminals");

      return res.data.data.items;

    },

    refetchInterval:10000,

  });

}
