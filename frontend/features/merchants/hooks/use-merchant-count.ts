"use client";

import { useQuery } from "@tanstack/react-query";

import {
  getMerchants,
} from "../services/merchant.service";

export function useMerchantCount() {
  return useQuery({
    queryKey: [
      "merchants",
      "count",
    ],

    queryFn: async () => {
      const data =
        await getMerchants(
          1,
          1
        );

      return (
        data.pagination.total
      );
    },
  });
}
