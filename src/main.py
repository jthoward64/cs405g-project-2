from mysql import connection

if connection and connection.is_connected():
    with connection.cursor() as cursor:
        result = cursor.execute("show tables;")

        rows = cursor.fetchall()

        for rows in rows:
            print(rows)

    connection.close()

else:
    print("Could not connect")
