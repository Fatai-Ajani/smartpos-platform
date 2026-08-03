import { FastifyInstance } from "fastify";
import bcrypt from "bcrypt";

import {
  generateRefreshToken,
  hashRefreshToken,
  verifyRefreshToken
} from "../utils/token.js";

const REFRESH_TOKEN_DAYS = 30;

export default class AuthService {

  constructor(
    private readonly app: FastifyInstance
  ) {}

  private async createTokens(user: any) {

    const accessToken =
      this.app.jwt.sign({

        id: user.id,

        email: user.email,

        role: user.role,

        merchantId: user.merchantId ?? undefined

      });

    const refreshToken =
      generateRefreshToken();

    const hashedToken =
      await hashRefreshToken(
        refreshToken
      );

    const expiresAt = new Date();

    expiresAt.setDate(
      expiresAt.getDate() + REFRESH_TOKEN_DAYS
    );

    await this.app.prisma.refreshToken.create({

      data: {

        token: hashedToken,

        userId: user.id,

        expiresAt

      }

    });

    return {

      accessToken,

      refreshToken

    };

  }

  async register(data: {
    firstName: string;
    lastName: string;
    email: string;
    password: string;
  }) {

    const existing =
      await this.app.prisma.user.findUnique({
        where: {
          email: data.email
        }
      });

    if (existing) {

      const error = new Error("Email already exists.");
      (error as any).statusCode = 409;
      throw error;

    }

    const passwordHash =
      await bcrypt.hash(data.password, 12);

    const user =
      await this.app.prisma.user.create({

        data: {

          firstName: data.firstName,
          lastName: data.lastName,
          email: data.email,
          passwordHash,
          role: "VIEWER"

        }

      });

    const tokens =
      await this.createTokens(user);

    const {
      passwordHash: _,
      passwordResetToken,
      passwordResetExpires,
      emailVerifyToken,
      emailVerifyExpires,
      ...safeUser
    } = user;

    return {

      ...tokens,

      user: safeUser

    };

  }

  async login(
    email: string,
    password: string
  ) {

    const user =
      await this.app.prisma.user.findUnique({
        where: {
          email
        }
      });

    if (!user?.passwordHash) {

      const error = new Error("Invalid credentials.");
      (error as any).statusCode = 401;
      throw error;

    }

    const valid =
      await bcrypt.compare(
        password,
        user.passwordHash
      );

    if (!valid) {

      const error = new Error("Invalid credentials.");
      (error as any).statusCode = 401;
      throw error;

    }

    const tokens =
      await this.createTokens(user);

    const {
      passwordHash: _,
      passwordResetToken,
      passwordResetExpires,
      emailVerifyToken,
      emailVerifyExpires,
      ...safeUser
    } = user;

    return {

      ...tokens,

      user: safeUser

    };

  }

  async refresh(
    refreshToken: string
  ) {

    const records =
      await this.app.prisma.refreshToken.findMany({

        where: {
          revoked: false
        },

        include: {
          user: true
        }

      });

    let record: any = null;

    for (const item of records) {

      const ok =
        await verifyRefreshToken(
          refreshToken,
          item.token
        );

      if (ok) {

        record = item;
        break;

      }

    }

    if (
      !record ||
      record.expiresAt < new Date()
    ) {

      const error = new Error(
        "Invalid refresh token."
      );

      (error as any).statusCode = 401;

      throw error;

    }

    await this.app.prisma.refreshToken.update({

      where: {
        id: record.id
      },

      data: {
        revoked: true
      }

    });

    return this.createTokens(
      record.user
    );

  }

  async me(
    userId: string
  ) {

    const user =
      await this.app.prisma.user.findUnique({

        where: {
          id: userId
        }

      });

    if (!user) {

      const error = new Error(
        "User not found."
      );

      (error as any).statusCode = 404;

      throw error;

    }

    const {
      passwordHash: _,
      passwordResetToken,
      passwordResetExpires,
      emailVerifyToken,
      emailVerifyExpires,
      ...safeUser
    } = user;

    return safeUser;

  }

}
