import { pgEnum } from "drizzle-orm/pg-core";

export const contact_day_of_weeks = pgEnum("contact_day_of_weeks", [
  "monday",
  "tuesday",
  "wednesday",
  "thursday",
  "friday",
  "saturday",
  "sunday",
]);
