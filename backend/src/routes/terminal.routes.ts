import { FastifyInstance } from "fastify";
import TerminalService from "../services/terminal.service.js";

export default async function terminalRoutes(
  app: FastifyInstance
) {
  const service = new TerminalService(app);

  app.get(
    "/terminals",
    async () => {
      const items = await app.prisma.terminal.findMany({
        include: {
          merchant: true,
        },
        orderBy: {
          createdAt: "desc",
        },
      });

      return {
        success: true,
        data: {
          items,
          pagination: {
            page: 1,
            limit: items.length,
            total: items.length,
            pages: 1,
          },
        },
      };
    }
  );
}
