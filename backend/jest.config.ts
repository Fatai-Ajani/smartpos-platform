import type { Config } from "jest";

const config: Config = {
  testEnvironment: "node",

  roots: [
    "<rootDir>/src",
    "<rootDir>/tests",
  ],

  transform: {
    "^.+\\.tsx?$": [
      "ts-jest",
      {
        tsconfig: "<rootDir>/tsconfig.jest.json",
      },
    ],
  },

  moduleNameMapper: {
    "^(\\.{1,2}/.*)\\.js$": "$1",
  },

  collectCoverage: true,

  coverageDirectory: "coverage",

  collectCoverageFrom: [
    "src/**/*.ts",
    "!src/main.ts",
    "!src/**/*.d.ts",
  ],

  moduleFileExtensions: [
    "ts",
    "js",
    "json",
  ],

  setupFilesAfterEnv: [
    "<rootDir>/tests/setup.ts",
  ],
};

export default config;
