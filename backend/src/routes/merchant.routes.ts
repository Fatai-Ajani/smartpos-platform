import { FastifyInstance } from "fastify";

import MerchantService from "../services/merchant.service.js";
import MerchantController from "../controllers/merchant.controller.js";

import { authMiddleware } from "../middleware/auth.middleware.js";

import {
  validateBody,
  validateParams,
  validateQuery
} from "../middleware/validate.js";

import {
  createMerchantSchema,
  updateMerchantSchema,
  merchantIdSchema,
  merchantDashboardSchema,
  merchantListQuerySchema
} from "../validators/merchant.validator.js";

export default async function merchantRoutes(
  app: FastifyInstance
) {

  const service =
    new MerchantService(app);

  const controller =
    new MerchantController(service);

  app.post(

    "/merchants",

    {
      preHandler: [
        validateBody(createMerchantSchema)
      ]
    },

    controller.create

  );

  app.get(

    "/merchants",

    {
      preHandler: [

        authMiddleware,

        validateQuery(
          merchantListQuerySchema
        )

      ]
    },

    controller.list

  );

  app.get(

    "/merchants/:id",

    {
      preHandler: [

        authMiddleware,

        validateParams(
          merchantIdSchema
        )

      ]
    },

    controller.get

  );

  app.put(

    "/merchants/:id",

    {
      preHandler: [

        authMiddleware,

        validateParams(
          merchantIdSchema
        ),

        validateBody(
          updateMerchantSchema
        )

      ]
    },

    controller.update

  );

  app.delete(

    "/merchants/:id",

    {
      preHandler: [

        authMiddleware,

        validateParams(
          merchantIdSchema
        )

      ]
    },

    controller.delete

  );

  app.get(

    "/merchants/:merchantId/dashboard",

    {
      preHandler: [

        authMiddleware,

        validateParams(
          merchantDashboardSchema
        )

      ]
    },

    controller.dashboard

  );

}
