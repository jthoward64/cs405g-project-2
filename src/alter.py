from connection import connection

if not connection:
    print("Could not connect - no connection object")
elif connection.is_connected():
    with connection.cursor() as cursor:
        # cursor.execute(
        #     "ALTER TABLE Entity_Table ADD COLUMN (Contact_Preferences TINYINT UNSIGNED NOT NULL DEFAULT 0);"
        # )
        # cursor.execute(
        #     "ALTER TABLE Entity_Table ADD COLUMN (duplicate VARCHAR(1) NOT NULL DEFAULT 'N');"
        # )

        # cursor.execute(
        #     "ALTER TABLE Entity_Table DROP FOREIGN KEY fk_Telephone_Number, DROP INDEX fk_Telephone_Number;"
        # )
        # connection.commit()
        # cursor.execute(
        #     "ALTER TABLE Telephone_Numbers DROP primary key, ADD primary key(Telephone_Number, Entity_ID);"
        # )
        # print("Added Primary Key")
        # cursor.execute(
        #     "ALTER TABLE Entity_Table ADD CONSTRAINT fk_Telephone_Number FOREIGN KEY (Entity_ID, Primary_Telephone_Number) REFERENCES Telephone_Numbers(Entity_ID, Telephone_Number);"
        # )
        # print("Added Foreign Key Constraint")

        cursor.execute("ALTER TABLE Entity_Table ADD COLUMN (email VARCHAR(255));")

    connection.commit()
    connection.close()
else:
    print("Not connected - connection object is not connected")
