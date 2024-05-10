SELECT "city", COUNT("city") AS "number_of_schools" FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "number_of_schools" < 4
ORDER BY "number_of_schools" DESC, "city" ASC;
