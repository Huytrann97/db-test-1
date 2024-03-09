import { pgTable, integer, serial, timestamp, boolean } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { agencies } from "@/schemas/agencies";
import { applicants } from "@/schemas/applicants";
import { base_schema_columns } from "@/schemas/base_schemas";
import { service_type } from "@/enums/service_type";

import { correspondences } from "./correspondences";
import { credit_card_applications } from "./credit_card_applications";
import { utility_applications } from "./utility_applications";
import { wifi_applications } from "./wifi_applications";

export const applications = pgTable("applications", {
  id: serial("id").primaryKey(),
  agencyId: integer("agency_id")
    .notNull()
    .references(() => agencies.id, { onDelete: "cascade" }),
  applicantId: integer("applicant_id")
    .notNull()
    .references(() => applicants.id, {
      onDelete: "cascade",
    }),
  serviceTypeCodes: service_type("service_type_codes").array().notNull(),
  completeAt: timestamp("complete_at"),
  isRpaExecuted: boolean("is_rpa_executed").default(false),
  ...base_schema_columns,
});

export const applications_relations = relations(
  applications,
  ({ one, many }) => ({
    agency: one(agencies, {
      fields: [applications.agencyId],
      references: [agencies.id],
    }),
    applicant: one(applicants, {
      fields: [applications.applicantId],
      references: [applicants.id],
    }),
    correspondences: many(correspondences),
    creditCard: one(credit_card_applications),
    utility: one(utility_applications),
    wifi: one(wifi_applications),
  })
);
