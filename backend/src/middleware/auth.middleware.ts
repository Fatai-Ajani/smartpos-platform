import {
  FastifyReply,
  FastifyRequest
} from "fastify";

export async function authMiddleware(
  request: FastifyRequest,
  reply: FastifyReply
) {
  try {await request.jwtVerify();

    console.log("JWT VERIFIED:", {
      user: request.user
    });

  } catch (error: any) {

    console.error("JWT VERIFY FAILED:", {
      name: error?.name,
      code: error?.code,
      message: error?.message
    });

    return reply.status(401).send({
      success: false,
      statusCode: 401,
      error: "Unauthorized",
      message: "Authentication required.",
      debug: {
        name: error?.name,
        code: error?.code,
        message: error?.message
      }
    });
  }
}
