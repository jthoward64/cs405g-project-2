# Deliverables

# Deliverable 1.1 ✔✔

- Team 20: Blake Crockett, Bowen Fan, Madhav Dahal, Nishan Budhathoki
- Team 21: Brennan Graham, Connor Day, Jose Cruz Guerrero, Keaton Martin

# Deliverable 2.1 ✔✔

To load in the other databases we initially used two methods depending on whether we had MySQL locally. Those of us who could only use mysql.cs.uky.edu renamed the other team's databases to have something like '\_team_20' after each name to avoid conflicting with our own tables. Those of us who had MySQL locally could instead load the other databases separately (into the databases team_3, team_20, and team_21). During our final integration one of us set up an internet accessible MySQL server and used the second method to load the three databases as it was more reproducible (and less prone to error) than loading all three team's tables into one database. This also mirrors much more closely how an actual database integration would work.

To merge the databases together we wrote a Python script that loaded both of the other team's databases into Pandas dataframes which were used to reformat and check the data. The script then output the Pandas dataframe into an SQL `INSERT` statement which added the data to our database.

# Deliverable 2.2

We used python with pandas to flag duplicates. If the Name and Address for an entity matched another entity in the table, both were flagged as duplicates. For deliverables 5 and 6, only the information for the first value for each duplicate pair was used to generate the output.

# Deliverable 2.3

We used strings and python to update the tables. We Used the code:

cursor.execute(
    "INSERT INTO Entity_Table (Entity_ID, Street_Name, Zip, City, StateName, EntityName, Primary_Telephone_Number) Values "
    + e21
    + e20[:-1]
    + ";"
)

where e20 were the entities from team20 and e21 were the values from team 21. Some of the values associated with these strings were

e20 :(41,'300 Rose Street Room 102 Hardymon Building','40506','Lexington','KY','Mr. Ray L. Hyatt Jr.',NULL),
(42,'301 Hilltop Avenue, Room 102','40506','Lexington','KY','Mr. Ray L. Hyatt Jr.',NULL)

e21:(113,'666 Chestnut Road','40514','Lexington','KY','Richard Jackson','859-345-6782'),(114,'777 Poplar Court','40515','Lexington','KY','Mary Lewis','859-456-7893')

Of note: some of the duplicate entries were copied into the other databases with different addresses. Given that we were importing the data as if we were a business who had acquired these customers, we did not modify the addresses as this could indicate that these are separate people with the same name.

# Deliverable 3.1 (Michael Stacy & Tag Howard) ✔

- EZ

# Deliverable 3.2 (Michael Stacy & Tag Howard) ✔

- EZ-ish

# Deliverable 4.1 (Michael Stacy) ✔✔

```py
from connection import connection
from database import grab_all_entities
import random

def randomize_entity(entity_id:int):
    '''Randomizes the contact preferences for a given entity'''
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():

        preference = random.randint(0, 255)
        print(entity_id, preference)

        # Grab our full Entity List
        with connection.cursor() as cursor:
            cursor.execute("UPDATE Entity_Table SET Contact_Preferences = (%s) WHERE Entity_ID = (%s);", (preference, entity_id,))

        connection.commit()
    else:
        print("Not connected - connection object is not connected")

peoples_list = {
    'John Wick': 8,
    'Bob': 1,
    'Tony Stark': 63,
    'Stephen Strange': 4,
    'Ray L. Hyatt': 64,
}

def set_specific():
    '''Sets the contact preferences for a given entity'''
    global peopls_list
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():

        # Grab our full Entity List
        with connection.cursor() as cursor:

            for person, preference in peoples_list.items():
                print(person, preference)
                person_pattern = f"%{person}%"
                cursor.execute("UPDATE Entity_Table SET Contact_Preferences = (%s) WHERE EntityName LIKE (%s);", (preference, person_pattern))

        connection.commit()
    else:
        print("Not connected - connection object is not connected")

def randomize_contacts():
    '''Randomizes the contact preferences for each entity'''
    global peoples_list

    # Grab the entity list
    entities = grab_all_entities()

    '''
    entity = {
            "entity_id": entity[0],
            "address": entity[1],
            "zip": entity[2],
            "city": entity[3],
            "state": entity[4],
            "name": entity[5],
            "primary_phone": entity[6],
            "contact_preference": get_contact_info(entity[7]),
        }
    '''

    for entity in entities:
        randomize_entity(entity['entity_id'])

set_specific()
randomize_contacts()
```

# Deliverable 4.2 (Michael Stacy) ✔

Waiting on Tables to be finished before running Deliverable_4 to grab output. Should be same output as Deliberable 3.2.

# Deliverable 5.1 (Demarkus Butler) ✔

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
        (row.email or "No email provided")
        + "\n"
        + row.EntityName
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

connection.close()

# Deliverable 5.2 (Demarkus Butler) ✔

Mr.296@icloud.com
Mr. Ray L. Hyatt Jr.
300 Rose Street Room 102 Hardymon Building
Lexington, KY 40506

Mr. Ray L. Hyatt Jr.
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Mr.922@gmail.com
Mr. Ray L. Hyatt Jr.
301 Hilltop Avenue, Room 102
Lexington, KY 40506

Mr. Ray L. Hyatt Jr.
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Joh111@gmail.com
John Wick
82 Beaver St Room 1301
New York, NY 10005

John Wick
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Ton795@gmail.com
Tony Stark
200 Park Avenue Penthouse
New York, NY 10001

Tony Stark
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Dr.902@gmail.com
Dr. Stephen Strange
117A Bleecker Street
New York, NY 10001

Dr. Stephen Strange
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Bob944@icloud.com
Bob C. Smith
200 Park Avenue Apartment 221
New York, NY 10001

Bob C. Smith
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

# Deliverable 6.1 (Demarkus Butler) ✔

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
    if row.contact_preferences["email"] == True:
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
    if row.contact_preferences["robocall"] == True:
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

# Deliverable 6.2 (Demarkus Butler) ✔

DNC: Mr. Ray L. Hyatt Jr.
 
DNC: Mr. Ray L. Hyatt Jr.
 
ROBOCALL: John Wick; 555-555-5555; 25% Coupon Code
 
EMAIL: Tony Stark;Ton795@gmail.com;25% Coupon Code
TEXT: Tony Stark; 555-555-3142; 25% Coupon Code
ROBOCALL: Tony Stark; 555-555-3142; 25% Coupon Code
PHONE: Tony Stark; 555-555-3142; 25% Coupon Code
FAX: Tony Stark; 555-555-3142; 25% Coupon Code
MAIL: Tony Stark; 200 Park Avenue Penthouse New York, NY 10001; 25% Coupon Code
 
MAIL: Dr. Stephen Strange; 117A Bleecker Street New York, NY 10001; 25% Coupon Code
 
TEXT: Bob C. Smith; No phone number provided
 
TEXT: Bob C. Smith; No phone number provided
 
TEXT: Bob Porter c/o Intech; No phone number provided
 
TEXT: Mr. Bob Sydell c/o Intech; No phone number provided

# Deliverable 7.1 (Group)

- EZ

# Deliverable 8.1 (Group)

-
