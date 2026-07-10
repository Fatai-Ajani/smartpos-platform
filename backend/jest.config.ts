import type { Config } from "@jest/types";

const config: Config.InitialOptions = {

  preset: "ts-jest",

  testEnvironment: "node",

  roots: [

    "<rootDir>/src",

    "<rootDir>/tests"

  ],

  collectCoverage: true,

  coverageDirectory: "coverage",

  collectCoverageFrom: [

    "src/**/*.ts",

    "!src/main.ts",

    "!src/**/*.d.ts"

  ],

  moduleFileExtensions: [

    "ts",

    "js",

    "json"

  ],

  setupFilesAfterEnv: [

    "<rootDir>/tests/setup.ts"

  ]

};

export default config;
