import random

import pandas as pd

from connection import connection

# Create Dataframe
Entity_Table = pd.read_sql("Select * from Entity_Table", connection)

cursor = connection.cursor()
emails = []
for i in Entity_Table["Entity_ID"]:
    name = Entity_Table[Entity_Table.Entity_ID == i].EntityName

    email = (
        name[:3]
        + str(random.randrange(111, 999))
        + random.choice(["@uky.edu", "@icloud.com", "@gmail.com"])
    )
    email = email.replace(" ", str(random.randrange(111, 999)))
    print(
        "UPDATE Entity_Table SET email = '"
        + email
        + "' WHERE Entity_ID = "
        + Entity_Table["Entity_ID"][i].astype(str)
        + ";"
    )

connection.commit()
connection.close()
