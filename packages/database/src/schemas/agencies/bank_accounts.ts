import { pgTable, serial, text, integer } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { bank_classification } from "@/enums/bank_classification";
import { base_schema_columns } from "@/schemas/base_schemas";

import { agencies } from "./index";

export const bank_accounts = pgTable("bank_accounts", {
  id: serial("id").primaryKey(),
  agencyId: integer("agency_id")
    .notNull()
    .references(() => agencies.id, { onDelete: "cascade" }),
  bankName: text("bank_name").notNull(),
  branch: text("branch").notNull(),
  accountNumber: text("account_number").notNull(),
  accountName: text("account_name").notNull(),
  classification: bank_classification("classification").notNull(),
  ...base_schema_columns,
});

export const bank_accounts_relations = relations(bank_accounts, ({ one }) => ({
  agency: one(agencies, {
    fields: [bank_accounts.agencyId],
    references: [agencies.id],
  }),
}));
