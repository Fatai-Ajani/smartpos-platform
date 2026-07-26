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
      console.log("LOGIN RESPONSE:", response);

      setAuth(
        response.token,
        response.user
      );

      toast.success("Login successful.");

      router.replace("/dashboard");
    },

    onError(error: unknown) {
      console.error("LOGIN ERROR:", error);
      const responseData =
        typeof error === "object" &&
        error !== null &&
        "response" in error
          ? (error as {
              response?: {
                data?: {
                  message?: string;
                };
              };
            }).response?.data
          : undefined;

      console.error("LOGIN RESPONSE:", responseData);

      toast.error(
        responseData?.message ??
        "Unable to login."
      );
    },
  });
}