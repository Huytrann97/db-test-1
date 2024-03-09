import { pgEnum } from "drizzle-orm/pg-core";

export const utility_contract_type = pgEnum("utility_contract_type", [
  //   "電気一括契約electric",
  //   "水道一括契約water_supply",
  //   "ガス一括契約gas",
  //   "一括契約なしno_contract",
  "electric",
  "water_supply",
  "gas",
  "no_contract",
]);
