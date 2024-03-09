import { pgEnum } from "drizzle-orm/pg-core";

export const site = pgEnum("site", ["gtn_admin", "agency", "utilities"]);
