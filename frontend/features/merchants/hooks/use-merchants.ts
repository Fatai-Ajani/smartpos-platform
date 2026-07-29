"use client";

import { useQuery } from "@tanstack/react-query";

import {
  getMerchants,
} from "../services/merchant.service";

export function useMerchants(
  page = 1,
  limit = 10
) {
  return useQuery({
    queryKey: [
      "merchants",
      page,
      limit,
    ],

    queryFn: () =>
      getMerchants(
        page,
        limit
      ),
  });
}
