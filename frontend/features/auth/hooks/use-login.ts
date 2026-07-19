"use client";

import { useRouter } from "next/navigation";
import { useMutation } from "@tanstack/react-query";

import { login } from "../services/auth.service";

import { useAuthStore } from "@/store/auth.store";

import { toast } from "sonner";

export function useLogin() {
  const router = useRouter();

  const setAuth = useAuthStore(
    (state) => state.setAuth
  );

  return useMutation({
    mutationFn: login,

    onSuccess(response) {
  setAuth(
    response.data.token,
    response.data.user
  );

  toast.success(
    "Login successful."
  );

  window.location.href = "/dashboard";

  console.log("AUTH SAVED");

  toast.success(
    "Login successful."
  );

      router.push("/test-auth");
    },

    onError(error: any) {
      toast.error(
        error?.response?.data?.message ??
          "Unable to login."
      );
    },
  });
}