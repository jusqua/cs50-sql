SELECT "name" FROM "districts"
WHERE "id" IN (
    SELECT "e1"."district_id"
    FROM "expenditures" "e1" LEFT JOIN "expenditures" "e2"
    ON "e2"."pupils" < "e1"."pupils"
    WHERE "e2"."pupils" IS NULL
);
