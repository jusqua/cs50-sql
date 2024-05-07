SELECT COUNT(*) AS "Player who alternately bat and throw" FROM "players"
WHERE ("bats" = 'R' AND "throws" = 'L') OR ("bats" = 'L' AND "throws" = 'R');
