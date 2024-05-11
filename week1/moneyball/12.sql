SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "id" FROM (
        SELECT "players"."id", SUM("salary") / "H" AS "dollars per hit"
        FROM "players"
            JOIN "performances"
                ON "performances"."player_id" = "players"."id"
            JOIN "salaries"
                ON "salaries"."player_id" = "players"."id"
        WHERE "performances"."year" = "salaries"."year"
            AND "performances"."year" = 2001
            AND "H" != 0
        GROUP BY "players"."id"
        ORDER BY "dollars per hit"
        LIMIT 10
    )
    INTERSECT
    SELECT "id" FROM (
        SELECT "players"."id", SUM("salary") / "RBI" AS "dollars per RBI"
        FROM "players"
            JOIN "performances"
                ON "performances"."player_id" = "players"."id"
            JOIN "salaries"
                ON "salaries"."player_id" = "players"."id"
        WHERE "performances"."year" = "salaries"."year"
            AND "performances"."year" = 2001
            AND "RBI" != 0
        GROUP BY "players"."id"
        ORDER BY "dollars per RBI"
        LIMIT 10
    )
)
ORDER BY "id";
