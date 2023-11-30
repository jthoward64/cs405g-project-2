from connection import connection

if not connection:
    print("Could not connect - no connection object")
elif connection.is_connected():
    with connection.cursor() as cursor:
        cursor.execute(
            "ALTER TABLE Entity_Table ADD COLUMN (Contact_Preferences TINYINT UNSIGNED NOT NULL DEFAULT 0);"
        )

    connection.commit()
    connection.close()
else:
    print("Not connected - connection object is not connected")
