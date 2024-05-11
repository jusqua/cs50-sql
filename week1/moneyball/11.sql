SELECT "first_name", "last_name", SUM("salary") / "H" AS "dollars per hit"
FROM "players"
    JOIN "performances"
        ON "performances"."player_id" = "players"."id"
    JOIN "salaries"
        ON "salaries"."player_id" = "players"."id"
WHERE "performances"."year" = "salaries"."year"
    AND "performances"."year" = 2001
    AND "H" != 0
GROUP BY "players"."id"
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;
