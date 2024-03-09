import { relations } from "drizzle-orm";
import { pgTable, serial, integer, timestamp, text } from "drizzle-orm/pg-core";

import { correspondence_destination_type } from "@/enums/correspondence_destination_type";
import { applications } from "@/schemas/applications";
import { base_schema_columns } from "@/schemas/base_schemas";

export const correspondences = pgTable("correspondences", {
  id: serial("id").primaryKey(),
  applicationId: integer("application_id")
    .notNull()
    .references(() => applications.id, { onDelete: "cascade" }),
  destinationTypeCode: correspondence_destination_type(
    "destination_type_code"
  ).notNull(),
  date: timestamp("date").notNull(),
  message: text("message").notNull(),
  emailSentAt: timestamp("email_sent_at"),
  ...base_schema_columns,
});

export const correspondences_relations = relations(
  correspondences,
  ({ one }) => ({
    applications: one(applications, {
      fields: [correspondences.applicationId],
      references: [applications.id],
    }),
  })
);
