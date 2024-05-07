SELECT "first_name", "last_name" FROM "players"
WHERE "height" > (SELECT AVG("height") AS "Average Height" FROM "players")
ORDER BY "height" DESC, "first_name" ASC, "last_name" ASC;
