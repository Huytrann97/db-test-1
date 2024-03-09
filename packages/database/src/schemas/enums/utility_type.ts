import { pgEnum } from "drizzle-orm/pg-core";

export const utility_type = pgEnum("utility_type", [
  //   "電気とガスboth",
  //   "電気のみelectric",
  //   "ガスのみgas",
  "both",
  "electric",
  "gas",
]);
