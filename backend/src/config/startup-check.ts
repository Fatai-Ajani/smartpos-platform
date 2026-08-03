import env from "./env.js";

export default function startupCheck() {
  const required = [
    "DATABASE_URL",
    "JWT_SECRET",
    "JWT_REFRESH_SECRET",
    "REDIS_URL",
  ] as const;

  for (const variable of required) {
    const value =
      env[variable];

    if (!value) {
      throw new Error(
        `Missing environment variable: ${variable}`
      );
    }
  }
}
