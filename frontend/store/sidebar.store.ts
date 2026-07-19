"use client";

import { create } from "zustand";

interface SidebarStore {

  collapsed: boolean;

  toggle: () => void;

  open: () => void;

  close: () => void;

}

export const useSidebarStore =
  create<SidebarStore>((set) => ({

    collapsed: false,

    toggle: () =>
      set((state) => ({
        collapsed: !state.collapsed,
      })),

    open: () =>
      set({
        collapsed: false,
      }),

    close: () =>
      set({
        collapsed: true,
      }),

  }));