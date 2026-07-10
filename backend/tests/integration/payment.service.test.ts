import prisma from "../helpers/test-db";

import PaymentService from "../../src/services/payment.service";

describe(

  "Payment Service",

  () => {

    let service: PaymentService;

    beforeAll(() => {

      service =

        new PaymentService(

          {} as any

        );

    });

    it(

      "should create payment intent",

      async () => {

        expect(

          service

        ).toBeDefined();

      }

    );

  }

);
