SELECT "username"
FROM "users" JOIN (
    SELECT "to_user_id", COUNT("to_user_id") AS "messages_received"
    FROM "messages"
    GROUP BY "to_user_id"
) AS "popularity_list"
ON "users"."id" = "popularity_list"."to_user_id"
ORDER BY "messages_received" DESC, "username" ASC
LIMIT 1;
