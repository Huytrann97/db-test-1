import { pgTable, serial, text, integer } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { utility_applications } from "@/schemas/applications/utility_applications";
import { base_schema_columns } from "@/schemas/base_schemas";

export const utility_companies = pgTable("utility_companies", {
  id: serial("id").primaryKey(),
  name: text("name").notNull(),
  email: text("email"),
  bothCommissionPay: integer("both_commission_pay"),
  bothCommissionReceive: integer("both_commission_receive"),
  electricCommissionPay: integer("electric_commission_pay"),
  electricCommissionReceive: integer("electric_commission_receive"),
  gasCommissionPay: integer("gas_commission_pay"),
  gasCommissionReceive: integer("gas_commission_receive"),
  ...base_schema_columns,
});

export const utility_companies_relations = relations(
  utility_companies,
  ({ many }) => ({
    utilityApplications: many(utility_applications),
  })
);
