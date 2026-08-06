import { Country, State, City } from "country-state-city";

export const countries = Country.getAllCountries();

export function getStates(countryCode: string) {
  if (!countryCode) return [];
  return State.getStatesOfCountry(countryCode);
}

export function getCities(
  countryCode: string,
  stateCode: string
) {
  if (!countryCode || !stateCode) return [];
  return City.getCitiesOfState(
    countryCode,
    stateCode
  );
}

export function getCurrency(countryCode: string) {
  const country = countries.find(
    (c) => c.isoCode === countryCode
  );

  return country?.currency ?? "";
}

export function getPhoneCode(countryCode: string) {
  const country = countries.find(
    (c) => c.isoCode === countryCode
  );

  return country?.phonecode ?? "";
}
