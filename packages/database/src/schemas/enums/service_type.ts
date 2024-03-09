import { pgEnum } from "drizzle-orm/pg-core";

export const service_type = pgEnum("service_type", [
  //   "光wifi",
  //   "電気ガスutility",
  //   "カードcredit_card",
  "wifi",
  "utility",
  "credit_card",
]);
