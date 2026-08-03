import crypto from "crypto";
import bcrypt from "bcrypt";

const SALT_ROUNDS = 12;

export function generateRefreshToken(): string {

  return crypto.randomBytes(64).toString("hex");

}

export async function hashRefreshToken(
  token: string
): Promise<string> {

  return bcrypt.hash(
    token,
    SALT_ROUNDS
  );

}

export async function verifyRefreshToken(
  token: string,
  hash: string
): Promise<boolean> {

  return bcrypt.compare(
    token,
    hash
  );

}
