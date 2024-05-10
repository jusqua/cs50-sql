SELECT "name", "pupils" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "name" NOT LIKE '%(non-op)';
