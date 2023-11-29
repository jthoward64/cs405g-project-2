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

    else:
        print("Not connected - connection object is not connected")


def grab_all(table_name):
    """Grabs everything from a table"""
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():
        with connection.cursor() as cursor:
            cursor.execute(f"select * from {table_name};")

            rows = cursor.fetchall()

            for rows in rows:
                print(rows)

    else:
        print("Not connected - connection object is not connected")


def grab_all_entities():
    """Grabs everything from the entities table"""
    grab_all("Entity_Table")


def grab_all_receipts():
    """Grabs everything from the receipts table"""
    grab_all("Receipt_Table")


def grab_all_telephone_numbers():
    """Grabs everything from the telephone numbers table"""
    grab_all("Telephone_Numbers")
