```typescript
import { FastifyInstance } from "fastify";
import bcrypt from "bcrypt";

export default async function authRoutes(app: FastifyInstance) {
  app.post("/api/v1/auth/login", async (request, reply) => {
    const body = request.body as {
      email: string;
      password: string;
    };

    const user = await app.prisma.user.findUnique({
      where: {
        email: body.email
      }
    });

    if (!user) {
      return reply.code(401).send({
        message: "Invalid email or password"
      });
    }

    const passwordMatches = await bcrypt.compare(
      body.password,
      user.password
    );

    if (!passwordMatches) {
      return reply.code(401).send({
        message: "Invalid email or password"
      });
    }

    const token = app.jwt.sign({
      id: user.id,
      email: user.email,
      role: user.role
    });

    return {
      token,
      user: {
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        role: user.role
      }
    };
  });
}
```
