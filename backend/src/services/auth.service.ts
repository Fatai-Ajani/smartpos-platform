import bcrypt from "bcrypt";
import { FastifyInstance } from "fastify";

export default class AuthService {
  constructor(
    private readonly app: FastifyInstance
  ) {}

  async login(
    email: string,
    password: string
  ) {
    const user = await this.app.prisma.user.findUnique({
      where: {
        email,
      },
    });

    if (!user?.passwordHash) {
      const error = new Error("Invalid credentials.");
      (error as Error & { statusCode?: number }).statusCode = 401;
      throw error;
    }

    const valid = await bcrypt.compare(
      password,
      user.passwordHash
    );

    if (!valid) {
      const error = new Error("Invalid credentials.");
      (error as Error & { statusCode?: number }).statusCode = 401;
      throw error;
    }

    const accessToken = this.app.jwt.sign({
      id: user.id,
      email: user.email,
      role: user.role,
    });

    const {
      passwordHash,
      passwordResetToken,
      passwordResetExpires,
      emailVerifyToken,
      emailVerifyExpires,
      ...safeUser
    } = user;

    return {
      accessToken,
      user: safeUser,
    };
  }

  async me(
    userId: string
  ) {
    const user = await this.app.prisma.user.findUnique({
      where: {
        id: userId,
      },
    });

    if (!user) {
      const error = new Error("User not found.");
      (error as Error & { statusCode?: number }).statusCode = 404;
      throw error;
    }

    const {
      passwordHash,
      passwordResetToken,
      passwordResetExpires,
      emailVerifyToken,
      emailVerifyExpires,
      ...safeUser
    } = user;

    return safeUser;
  }
}
