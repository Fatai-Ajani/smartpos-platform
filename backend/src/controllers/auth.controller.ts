import {
  FastifyReply,
  FastifyRequest
} from "fastify";

import AuthService from "../services/auth.service.js";

export default class AuthController {

  constructor(
    private readonly authService: AuthService
  ) {}

  register = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {

    const result =
      await this.authService.register(
        request.body as any
      );

    return reply
      .status(201)
      .send({

        success: true,

        data: result

      });

  };

  login = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {

    const body =
      request.body as any;

    const result =
      await this.authService.login(

        body.email,

        body.password

      );

    return reply.send({

      success: true,

      data: result

    });

  };

  refresh = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {

    const body =
      request.body as any;

    const result =
      await this.authService.refresh(
        body.refreshToken
      );

    return reply.send({

      success: true,

      data: result

    });

  };

  me = async (
    request: FastifyRequest,
    reply: FastifyReply
  ) => {

    const profile =
      await this.authService.me(

        (request.user as any).id

      );

    return reply.send({

      success: true,

      data: profile

    });

  };

}
