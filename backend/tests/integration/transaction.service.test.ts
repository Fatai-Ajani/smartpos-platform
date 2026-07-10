import TransactionService from "../../src/services/transaction.service";

describe(

  "Transaction Service",

  () => {

    let service: TransactionService;

    beforeEach(() => {

      service =

        new TransactionService(

          {} as any

        );

    });

    it(

      "service should exist",

      () => {

        expect(

          service

        ).toBeDefined();

      }

    );

  }

);
