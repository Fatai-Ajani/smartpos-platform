import bcrypt from "bcrypt";
import { FastifyInstance } from "fastify";
import { Prisma } from "@prisma/client";

export default class AuthService {

  constructor(
    private readonly app: FastifyInstance
  ) {}

  async register(data: {

    firstName: string;

    lastName: string;

    email: string;

    password: string;

    merchantId?: string;

  }) {

    const existingUser =
      await this.app.prisma.user.findUnique({
        where: {
          email: data.email
        }
      });

    if (existingUser) {
      throw new Error("User already exists.");
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

          merchantId: data.merchantId

        }

      });

    return user;

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

    if (!user) {
      throw new Error("Invalid credentials.");
    }

    const validPassword =
      await bcrypt.compare(
        password,
        user.passwordHash
      );

    if (!validPassword) {
      throw new Error("Invalid credentials.");
    }

    const accessToken =
      this.app.jwt.sign({

        id: user.id,

        merchantId: user.merchantId,

        email: user.email,

        role: user.role

      });

    const refreshToken =
      this.app.jwt.sign({

        id: user.id

      }, {

        secret: process.env.JWT_REFRESH_SECRET,

        expiresIn:
          process.env.JWT_REFRESH_EXPIRES_IN

      });

    await this.app.prisma.refreshToken.create({

      data: {

        userId: user.id,

        token: refreshToken,

        expiresAt: new Date(
          Date.now() +
          30 * 24 * 60 * 60 * 1000
        )

      }

    });

    return {

      accessToken,

      refreshToken,

      user

    };

  }

  async logout(
    refreshToken: string
  ) {

    await this.app.prisma.refreshToken.deleteMany({

      where: {

        token: refreshToken

      }

    });

    return {

      success: true

    };

  }

  async refreshToken(
    refreshToken: string
  ) {

    const storedToken =
      await this.app.prisma.refreshToken.findFirst({

        where: {

          token: refreshToken,

          revoked: false

        },

        include: {

          user: true

        }

      });

    if (!storedToken) {
      throw new Error("Invalid refresh token.");
    }

    const accessToken =
      this.app.jwt.sign({

        id: storedToken.user.id,

        merchantId:
          storedToken.user.merchantId,

        email:
          storedToken.user.email,

        role:
          storedToken.user.role

      });

    return {

      accessToken

    };

  }

}
