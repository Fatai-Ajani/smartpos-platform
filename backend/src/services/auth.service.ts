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

    const user =
      await this.app.prisma.user.findUnique({

        where: {

          email

        }

      });

    if (!user?.passwordHash) {

      throw new Error("Invalid credentials.");
    }

    const valid = await bcrypt.compare(
        password,
        user.passwordHash
      );

    if (!valid) {

      throw new Error(
        "Invalid credentials."
      );

    }

    const token =
      this.app.jwt.sign({

        id: user.id,

        email: user.email,

        role: user.role

      });

    const { passwordHash, ...safeUser } = user;

return {

  token,

  user: safeUser

};

  }

  async me(
    userId: string
  ) {

    return this.app.prisma.user.findUnique({

      where: {

        id: userId

      }

    });

  }

}
