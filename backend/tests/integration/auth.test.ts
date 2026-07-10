import request from "supertest";

import app from "../../src/app";

describe(

  "Authentication",

  () => {

    it(

      "should reject invalid credentials",

      async () => {

        const response =

          await request(app.server)

            .post("/api/auth/login")

            .send({

              email:

                "invalid@test.com",

              password:

                "wrong"

            });

        expect(

          response.status

        ).toBeGreaterThanOrEqual(

          400

        );

      }

    );

  }

);
