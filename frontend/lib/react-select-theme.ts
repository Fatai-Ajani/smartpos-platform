import type { StylesConfig } from "react-select";

export const selectStyles: StylesConfig<any, false> = {
  control: (base, state) => ({
    ...base,
    minHeight: 42,
    borderRadius: 8,
    borderColor: state.isFocused ? "#2563eb" : "#cbd5e1",
    backgroundColor: "#ffffff",
    color: "#0f172a",
    boxShadow: state.isFocused
      ? "0 0 0 1px #2563eb"
      : "none",
    "&:hover": {
      borderColor: "#2563eb",
    },
  }),

  input: (base) => ({
    ...base,
    color: "#0f172a",
  }),

  placeholder: (base) => ({
    ...base,
    color: "#64748b",
  }),

  singleValue: (base) => ({
    ...base,
    color: "#0f172a",
  }),

  menu: (base) => ({
    ...base,
    backgroundColor: "#ffffff",
    zIndex: 9999,
  }),

  menuList: (base) => ({
    ...base,
    backgroundColor: "#ffffff",
  }),

  option: (base, state) => ({
    ...base,
    backgroundColor: state.isFocused
      ? "#eff6ff"
      : state.isSelected
      ? "#2563eb"
      : "#ffffff",
    color: state.isSelected ? "#ffffff" : "#0f172a",
    cursor: "pointer",
  }),
};
