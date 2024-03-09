import { pgEnum } from "drizzle-orm/pg-core";

export const bank_classification = pgEnum("bank_classification", [
  //   "普通savings",
  //   "当座checking",
  //   "定期deposit",
  "savings",
  "checking",
  "deposit",
]);
