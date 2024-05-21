import sqlite3


def main():
    con = sqlite3.connect("dont-panic.db")
    cur = con.cursor()

    password = input("Enter a password: ")

    cur.execute(
        """
        UPDATE "users"
        SET "password" = ?
        WHERE "username" = 'admin';
        """,
        [password]
    )

    con.commit()
    con.close()


if __name__ == "__main__":
    main()
