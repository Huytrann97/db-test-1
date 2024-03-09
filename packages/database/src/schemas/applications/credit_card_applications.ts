import { pgTable, integer, index } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { credit_card_application_status } from "@/enums/credit_card_application_status";
import { currently_gtn_service } from "@/enums/currently_gtn_service";
import { applications } from "@/schemas/applications";
import { base_schema_columns } from "@/schemas/base_schemas";

export const credit_card_applications = pgTable(
  "credit_card_applications",
  {
    applicationId: integer("application_id")
      .primaryKey()
      .references(() => applications.id, { onDelete: "cascade" }),
    status: credit_card_application_status("status")
      .notNull()
      .default("not_handle"),
    currentlyGtnServices: currently_gtn_service("currently_gtn_services")
      .array()
      .notNull(),
    ...base_schema_columns,
  },
  (table) => {
    return {
      application_id_idx: index("credit_card_application_id_idx").on(
        table.applicationId
      ),
    };
  }
);

export const credit_card_applications_relations = relations(
  credit_card_applications,
  ({ one }) => ({
    application: one(applications, {
      fields: [credit_card_applications.applicationId],
      references: [applications.id],
    }),
  })
);
