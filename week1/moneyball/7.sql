SELECT "first_name", "last_name" FROM "players"
WHERE "id" IN (
    SELECT "player_id" FROM "salaries"
    WHERE "salary" = (SELECT MAX("salary") FROM "salaries")
);
