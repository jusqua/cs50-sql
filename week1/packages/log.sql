
-- *** The Lost Letter ***

-- Confirm the address package
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "contents" = 'Congratulatory letter'
    AND "id" = (
        SELECT "package_id" FROM "scans"
        WHERE "action" = 'Pick'
        AND "address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue')
    )
);

-- Get the address registered in scan where the package has dropped
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop'
    AND "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "contents" = 'Congratulatory letter'
        AND "id" = (
            SELECT "package_id" FROM "scans"
            WHERE "action" = 'Pick'
            AND "address_id" = (SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue')
        )
    )
);

-- *** The Devious Delivery ***

-- Get the packages that not have a "From" address
SELECT "contents" FROM "packages" WHERE "from_address_id" IS NULL;

-- Get the address where the package was dropped
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "action" = 'Drop'
    AND "package_id" = (SELECT "id" FROM "packages" WHERE "from_address_id" IS NULL)
);

-- *** The Forgotten Gift ***

-- Get the package contents
SELECT "contents" FROM "packages"
WHERE "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = "728 Maple Place")
AND "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = "109 Tileston Street");

-- Get the drivers that delivered those packages
SELECT "name", "action" FROM "drivers" JOIN "scans" ON "drivers"."id" = "scans"."driver_id"
WHERE "package_id" IN (
    SELECT "id" FROM "packages"
    WHERE "to_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = "728 Maple Place")
    AND "from_address_id" = (SELECT "id" FROM "addresses" WHERE "address" = "109 Tileston Street")
);
