import { relations } from "drizzle-orm";
import { pgTable, serial, text, integer, timestamp } from "drizzle-orm/pg-core";

import { site } from "@/enums/site";
import { agency_accounts } from "@/schemas/agencies/agency_accounts";
import { base_schema_columns } from "@/schemas/base_schemas";

export const user_tokens = pgTable("user_tokens", {
  id: serial("id").primaryKey(),
  agencyAccountId: integer("agency_account_id").references(
    () => agency_accounts.id,
    { onDelete: "cascade" }
  ),
  email: text("email").notNull(),
  siteCode: site("site_code").notNull(),
  token: text("token").notNull(),
  expiredAt: timestamp("expired_at"),
  loginAt: timestamp("login_at"),
  ...base_schema_columns,
});

export const user_tokens_relations = relations(user_tokens, ({ one }) => ({
  agencyAccounts: one(agency_accounts, {
    fields: [user_tokens.agencyAccountId],
    references: [agency_accounts.id],
  }),
}));
