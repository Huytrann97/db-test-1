import { pgEnum } from "drizzle-orm/pg-core";

export const language = pgEnum("language", [
  //   "日本語",
  //   "Tiếng Việt",
  //   "簡体字",
  //   "English",
  //   "한국어",
  //   "繁体字",
  "japanese",
  "vietnamese",
  "chinese",
  "english",
  "korean",
  "taiwan",
]);
