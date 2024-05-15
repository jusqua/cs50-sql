CREATE TABLE "desk" (
  "id" INTEGER,
  "index" INTEGER,
  "length" INTEGER,
  PRIMARY KEY("id")
);

INSERT INTO "desk" ("id", "index", "length")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);

CREATE VIEW "message" AS
SELECT substr("sentence", "index", "length") AS "phrase"
FROM "sentences" JOIN "desk" ON "sentences"."id" = "desk"."id";
