import { pgTable, integer, serial, unique, text } from "drizzle-orm/pg-core";

import { agencies } from "@/schemas/agencies";
import { base_schema_columns } from "@/schemas/base_schemas";

export const billings = pgTable(
  "billings",
  {
    id: serial("id").primaryKey().unique(),
    gasCount: integer("gas_count"),
    electricCount: integer("electric_count"),
    bothCount: integer("both_count"),
    agencyId: integer("agency_id")
      .notNull()
      .references(() => agencies.id, { onDelete: "cascade" }),
    month: text("month").notNull(),
    amount: integer("amount").notNull(),
    ...base_schema_columns,
  },
  (b) => ({
    unq: unique("unique_agency_monthly_billing").on(b.agencyId, b.month),
  })
);
