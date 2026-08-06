"use client";

import { useMutation, useQueryClient } from "@tanstack/react-query";

import {
  createMerchant,
} from "../services/merchant.service";

import type {
  CreateMerchantDto,
} from "../types/merchant";

export function useCreateMerchant() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (
      payload: CreateMerchantDto
    ) => createMerchant(payload),

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: ["merchants"],
      });
    },
  });
}
