import { pgEnum } from "drizzle-orm/pg-core";

export const gas_start_time_type = pgEnum("gas_start_time_type", [
  "9am-12pm",
  "1pm-3pm",
  "3pm-5pm",
  "5pm-7pm",
]);
