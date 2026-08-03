import { FastifyInstance } from "fastify";

import TransactionService
  from "../services/transaction.service.js";

import TransactionController
  from "../controllers/transaction.controller.js";

import { authMiddleware }
  from "../middleware/auth.middleware.js";

import { validateBody }
  from "../middleware/validate.js";

import {
  StartTransactionSchema,
  ExecuteTransactionSchema,
  SettlementTransactionSchema,
  FailTransactionSchema
} from "../validators/transaction.validator.js";

export default async function transactionRoutes(
  app: FastifyInstance
) {

  const service =
    new TransactionService(app);

  const controller =
    new TransactionController(service);


  /*
  |--------------------------------------------------------------------------
  | Start Transaction
  |--------------------------------------------------------------------------
  */

  app.post(

    "/transactions/start",

    {

      preHandler: [

        authMiddleware,

        validateBody(
          StartTransactionSchema
        )

      ]

    },

    controller.start

  );


  /*
  |--------------------------------------------------------------------------
  | Execute Payment
  |--------------------------------------------------------------------------
  */

  app.post(

    "/transactions/execute",

    {

      preHandler: [

        authMiddleware,

        validateBody(
          ExecuteTransactionSchema
        )

      ]

    },

    controller.execute

  );


  /*
  |--------------------------------------------------------------------------
  | Settle Transaction
  |--------------------------------------------------------------------------
  */

  app.post(

    "/transactions/settle",

    {

      preHandler: [

        authMiddleware,

        validateBody(
          SettlementTransactionSchema
        )

      ]

    },

    controller.settle

  );


  /*
  |--------------------------------------------------------------------------
  | Complete / Capture Transaction
  |--------------------------------------------------------------------------
  */

  app.post(

    "/transactions/:id/complete",

    {

      preHandler: [

        authMiddleware

      ]

    },

    controller.complete

  );


  /*
  |--------------------------------------------------------------------------
  | Fail Transaction
  |--------------------------------------------------------------------------
  */

  app.post(

    "/transactions/fail",

    {

      preHandler: [

        authMiddleware,

        validateBody(
          FailTransactionSchema
        )

      ]

    },

    controller.fail

  );


  /*
  |--------------------------------------------------------------------------
  | List Transactions
  |--------------------------------------------------------------------------
  */

  app.get(

    "/transactions",

    {

      preHandler: [

        authMiddleware

      ]

    },

    controller.list

  );


  /*
  |--------------------------------------------------------------------------
  | Get Transaction
  |--------------------------------------------------------------------------
  */

  app.get(

    "/transactions/:id",

    {

      preHandler: [

        authMiddleware

      ]

    },

    controller.get

  );

}
