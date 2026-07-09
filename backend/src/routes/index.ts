import { FastifyInstance } from "fastify";

import healthRoutes from "./health";
import authRoutes from "./auth";

export async function registerRoutes(
  app: FastifyInstance
): Promise<void> {
  await app.register(healthRoutes);
  await app.register(authRoutes);

  // Future modules
  // await app.register(userRoutes);
  // await app.register(merchantRoutes);
  // await app.register(storeRoutes);
  // await app.register(categoryRoutes);
  // await app.register(productRoutes);
  // await app.register(inventoryRoutes);
  // await app.register(customerRoutes);
  // await app.register(supplierRoutes);
  // await app.register(purchaseRoutes);
  // await app.register(salesRoutes);
  // await app.register(expenseRoutes);
  // await app.register(reportRoutes);
  // await app.register(dashboardRoutes);
  // await app.register(settingsRoutes);
}
