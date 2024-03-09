import { pgTable, integer, date, boolean, index } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { utility_application_status } from "@/enums/utility_application_status";
import { utility_type } from "@/enums/utility_type";
import { gas_start_time_type } from "@/enums/gas_start_time_type";
import { utility_contract_type } from "@/enums/utility_contract_type";
import { applications } from "@/schemas/applications";
import { base_schema_columns } from "@/schemas/base_schemas";

import { utility_companies } from ".//utility_companies";

export const utility_applications = pgTable(
  "utility_applications",
  {
    applicationId: integer("application_id")
      .primaryKey()
      .references(() => applications.id, { onDelete: "cascade" }),
    utilityCompanyId: integer("utility_company_id")
      .notNull()
      .references(() => utility_companies.id, { onDelete: "cascade" }),
    utilityTypeCode: utility_type("utility_type_code").notNull(),
    currentContractTypeCodes: utility_contract_type(
      "current_contract_type_codes"
    ).array(),
    electricStartDate: date("electric_start_date"),
    gasStartDate: date("gas_start_date"),
    gasStartTimeCode: gas_start_time_type("gas_start_time_code"),
    withWaterSupply: boolean("with_water_supply").notNull(),
    status: utility_application_status("status").notNull().default("not_handle"),
    ...base_schema_columns,
  },
  (table) => {
    return {
      application_id_idx: index("utility_application_id_idx").on(
        table.applicationId
      ),
    };
  }
);

export const utility_applications_relations = relations(
  utility_applications,
  ({ one }) => ({
    application: one(applications, {
      fields: [utility_applications.applicationId],
      references: [applications.id],
    }),
    company: one(utility_companies, {
      fields: [utility_applications.utilityCompanyId],
      references: [utility_companies.id],
    }),
  })
);
