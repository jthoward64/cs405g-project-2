from connection import connection


def show_tables():
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():
        with connection.cursor() as cursor:
            cursor.execute("show tables;")

            rows = cursor.fetchall()

            for rows in rows:
                print(rows)

        connection.close()
    else:
        print("Not connected - connection object is not connected")


def grab_all():
    """Grabs everything from a table"""
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():
        with connection.cursor() as cursor:
            cursor.execute("select * from Entity_Table;")

            rows = cursor.fetchall()

            for rows in rows:
                print(rows)

        connection.close()
    else:
        print("Not connected - connection object is not connected")
