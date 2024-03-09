import { pgTable, integer, text, index, date } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { wifi_application_status } from "@/enums/wifi_application_status";
import { contact_day_of_weeks } from "@/enums/contact_day_of_weeks";
import { applications } from "@/schemas/applications";
import { base_schema_columns } from "@/schemas/base_schemas";

export const wifi_applications = pgTable(
  "wifi_applications",
  {
    applicationId: integer("application_id")
      .primaryKey()
      .references(() => applications.id, { onDelete: "cascade" }),
    contactDayOfWeeks: contact_day_of_weeks("contact_day_of_weeks").notNull(),
    visaFrontUrl: text("visa_front_url").notNull(),
    visaBackUrl: text("visa_back_url").notNull(),
    visaName: text("visa_name").notNull(),
    visaExpDate: date("visa_exp_date").notNull(),
    status: wifi_application_status("status").notNull().default("not_handle"),
    ...base_schema_columns,
  },
  (table) => {
    return {
      application_id_idx: index("wifi_application_id_idx").on(
        table.applicationId
      ),
    };
  }
);

export const wifi_applications_relations = relations(
  wifi_applications,
  ({ one }) => ({
    application: one(applications, {
      fields: [wifi_applications.applicationId],
      references: [applications.id],
    }),
  })
);
