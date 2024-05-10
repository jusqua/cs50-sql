SELECT "name", "per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id" = "districts"."id"
WHERE "name" NOT LIKE '%(non-op)'
AND "name" NOT LIKE '%(District)'
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10;
