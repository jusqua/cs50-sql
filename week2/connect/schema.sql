CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "user_user_connections" (
    "id" INTEGER,
    "user_a" INTEGER NOT NULL,
    "user_b" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_a") REFERENCES "users"("id"),
    FOREIGN KEY("user_b") REFERENCES "users"("id")
);

CREATE TABLE "user_school_connections" (
    "id" INTEGER,
    "user" INTEGER NOT NULL,
    "school" INTEGER NOT NULL,
    "type" TEXT,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("user") REFERENCES "users"("id"),
    FOREIGN KEY("school") REFERENCES "schools"("id")
);

CREATE TABLE "user_company_connections" (
    "id" INTEGER,
    "user" INTEGER NOT NULL,
    "company" INTEGER NOT NULL,
    "title" TEXT,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("user") REFERENCES "users"("id"),
    FOREIGN KEY("company") REFERENCES "companies"("id")
);
