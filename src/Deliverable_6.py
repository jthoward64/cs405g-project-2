import mysql.connector
import pandas as pd

from connection import connection
from contact import get_contact_info

# Create Dataframe
Entity_Table = pd.read_sql("Select * from Entity_Table", connection)

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

# Send Coupon codes. Our customers are listed as entities rather than as businesses and customers; therefore, entity name is
# used for the name for the coupon.
# Customer can choose a contact preference that involves a phone number without providing a phone number. If no phone number is provided, the business is alerted that there is no phone number and therefore can collect one.
for i in unique_names:
    row = duplicates[duplicates.Name_Address == i].iloc[0]
    row.contact_preferences = get_contact_info(row.Contact_Preferences)
    if row.contact_preferences["email"] == "True":
        print("EMAIL: " + row.EntityName + ";" + row.email + ";" + "25% Coupon Code")
    if row.contact_preferences["text"] == True:
        if row.Primary_Telephone_Number != None:
            print(
                "TEXT: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("TEXT: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["robocall"] == "True":
        if row.Primary_Telephone_Number != None:
            print(
                "ROBOCALL: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("ROBOCALL: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["phone"] == True:
        if row.Primary_Telephone_Number != None:
            print(
                "PHONE: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("PHONE: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["fax"] == True:
        if row.Primary_Telephone_Number != None:
            print(
                "FAX: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("FAX: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["dnc"] == True:
        print("DNC: " + row.EntityName)
    if row.contact_preferences["mail"] == True:
        print(
            "MAIL: "
            + row.EntityName
            + "; "
            + row.Street_Name
            + " "
            + row.City
            + ", "
            + row.StateName
            + " "
            + row.Zip
            + "; "
            + "25% Coupon Code"
        )
    print(" ")

connection.close()
