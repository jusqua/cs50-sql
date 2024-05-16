SELECT "to_user_id" FROM (
    SELECT "to_user_id", COUNT("to_user_id") AS "messages_send"
    FROM "messages"
    WHERE "from_user_id" = (SELECT "id" FROM "users" WHERE "username" = 'creativewisdom377')
    GROUP BY "to_user_id"
    ORDER BY "messages_send" DESC
    LIMIT 3
);
