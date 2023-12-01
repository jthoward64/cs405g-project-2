import random
import pandas as pd
from connection import connection

# Create Dataframe
Entity_Table = pd.read_sql("Select * from Entity_Table", connection)
names = list(Entity_Table.EntityName)
emails = ""
for i in names:
    email = i[:3] + str(random.randrange(111,999)) + random.choice(["@uky.edu", "@icloud.com", "@gmail.com"])
    email = email.replace(' ', str(random.randrange(111,999) ))
    emails += '(\'' + email + '\'),'

cursor = connection.cursor()

cursor.execute(
    "INSERT INTO Entity_Table (email) Values "
    + emails[:-1]
    + ";"
)
cursor.commit()
