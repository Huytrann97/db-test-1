import { pgTable, serial, text } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { gtn_in_charges } from "@/schemas/agencies/gtn_in_charges";
import { base_schema_columns } from "@/schemas/base_schemas";

export const gtn_members = pgTable("gtn_members", {
  id: serial("id").primaryKey(),
  name: text("name").notNull(),
  department: text("department").notNull(),
  ...base_schema_columns,
});

export const gtn_members_relations = relations(gtn_members, ({ many }) => ({
  gtnInCharges: many(gtn_in_charges),
}));
