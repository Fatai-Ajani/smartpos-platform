import type { GroupBase, StylesConfig } from "react-select";

export type SelectOption = {
  value: string;
  label: string;
  phone?: string;
};

export const selectStyles: StylesConfig<
  SelectOption,
  false,
  GroupBase<SelectOption>
> = {
  control: (base, state) => ({
    ...base,
    minHeight: 44,
    borderRadius: 10,
    borderColor: state.isFocused ? "#2563eb" : "#dbe3ef",
    backgroundColor: "#ffffff",
    color: "#0f172a",
    boxShadow: state.isFocused
      ? "0 0 0 3px rgba(37, 99, 235, 0.12)"
      : "0 1px 2px rgba(15, 23, 42, 0.04)",
    transition: "border-color 150ms ease, box-shadow 150ms ease",
    "&:hover": {
      borderColor: state.isFocused ? "#2563eb" : "#93c5fd",
    },
  }),

  valueContainer: (base) => ({
    ...base,
    padding: "2px 12px",
  }),

  input: (base) => ({
    ...base,
    color: "#0f172a",
    margin: 0,
    padding: 0,
  }),

  placeholder: (base) => ({
    ...base,
    color: "#94a3b8",
  }),

  singleValue: (base) => ({
    ...base,
    color: "#0f172a",
    fontWeight: 500,
  }),

  indicatorSeparator: (base) => ({
    ...base,
    backgroundColor: "#e2e8f0",
  }),

  dropdownIndicator: (base, state) => ({
    ...base,
    color: state.isFocused ? "#2563eb" : "#64748b",
    padding: "0 10px",
    transition: "color 150ms ease, transform 150ms ease",
    "&:hover": {
      color: "#2563eb",
    },
  }),

  clearIndicator: (base) => ({
    ...base,
    color: "#94a3b8",
    "&:hover": {
      color: "#2563eb",
    },
  }),

  menu: (base) => ({
    ...base,
    marginTop: 6,
    borderRadius: 12,
    border: "1px solid #e2e8f0",
    backgroundColor: "#ffffff",
    boxShadow:
      "0 18px 45px rgba(15, 23, 42, 0.12), 0 4px 12px rgba(15, 23, 42, 0.06)",
    overflow: "hidden",
    zIndex: 9999,
  }),

  menuList: (base) => ({
    ...base,
    padding: 6,
    backgroundColor: "#ffffff",
  }),

  option: (base, state) => ({
    ...base,
    minHeight: 40,
    display: "flex",
    alignItems: "center",
    borderRadius: 8,
    padding: "8px 10px",
    margin: "1px 0",
    backgroundColor: state.isSelected
      ? "#2563eb"
      : state.isFocused
        ? "#eff6ff"
        : "#ffffff",
    color: state.isSelected ? "#ffffff" : "#0f172a",
    fontWeight: state.isSelected ? 600 : 400,
    cursor: "pointer",
    "&:active": {
      backgroundColor: state.isSelected ? "#1d4ed8" : "#dbeafe",
    },
  }),
};