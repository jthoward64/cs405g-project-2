from connection import connection

if not connection:
    print("Could not connect - no connection object")
elif connection.is_connected():
    with connection.cursor() as cursor:
        result = cursor.execute("show tables;")

        rows = cursor.fetchall()

        for rows in rows:
            print(rows)

    connection.close()
else:
    print("Not connected - connection object is not connected")
