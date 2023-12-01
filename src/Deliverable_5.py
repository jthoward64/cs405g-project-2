import mysql.connector
import pandas as pd

from args import args
from connection import connection

# Create Dataframe
Entity_Table = pd.read_sql("Select * from Entity_Table", connection)

Entity_Table["duplicate"] = "N"

Entity_Table.loc[:5, "duplicate"] = "Y"

# Create duplicates dataframe
duplicates = Entity_Table[Entity_Table.duplicate == "Y"].copy()
duplicates.reset_index(inplace=True, drop=True)

# Combine name and Address to get identifier for possible duplicates
duplicates["Name_Address"] = (
    duplicates.EntityName
    + " "
    + duplicates.Street_Name
    + " "
    + duplicates.City
    + " "
    + duplicates.StateName
    + " "
    + duplicates.Zip
)
unique_names = duplicates.Name_Address.unique()

# Create postcard
# Only send postcard to first listing for likely duplicate. If after sending postcard it is determined that the customer was not a duplicate,
# adjust database to indicate that the likely duplicates were unique customers
for i in unique_names:
    row = duplicates[duplicates.Name_Address == i].iloc[0]
    print(
        row.EntityName
        + "\n"
        + row.Street_Name
        + "\n"
        + row.City
        + ", "
        + row.StateName
        + " "
        + row.Zip
        + "\n\n"
        + row.EntityName
        + "\n"
        + "It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!"
        + "\n\n"
        + "Looking forward to serving you again!"
        + "\n"
    )
