import { pgEnum } from "drizzle-orm/pg-core";

export const currently_gtn_service = pgEnum("currently_gtn_services", [
  "mobile",
  "rent_guarantor",
  "assistants",
  "real_estate_agent",
  "specified_skilled_worker_program",
]);
