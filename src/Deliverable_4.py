import random

from connection import connection
from database import grab_all_entities


def randomize_entity(entity_id: int):
    """Randomizes the contact preferences for a given entity"""
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():
        preference = random.randint(0, 255)
        print(entity_id, preference)

        # Grab our full Entity List
        with connection.cursor() as cursor:
            cursor.execute(
                "UPDATE Entity_Table SET Contact_Preferences = (%s) WHERE Entity_ID = (%s);",
                (
                    preference,
                    entity_id,
                ),
            )

        connection.commit()
    else:
        print("Not connected - connection object is not connected")


peoples_list = {
    "John Wick": 8,
    "Bob": 1,
    "Tony Stark": 63,
    "Stephen Strange": 4,
    "Ray L. Hyatt": 64,
}


def set_specific():
    """Sets the contact preferences for a given entity"""
    global peopls_list
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():
        # Grab our full Entity List
        with connection.cursor() as cursor:
            for person, preference in peoples_list.items():
                print(person, preference)
                person_pattern = f"%{person}%"
                cursor.execute(
                    "UPDATE Entity_Table SET Contact_Preferences = (%s) WHERE EntityName LIKE (%s);",
                    (preference, person_pattern),
                )

        connection.commit()
    else:
        print("Not connected - connection object is not connected")


def randomize_contacts():
    """Randomizes the contact preferences for each entity"""
    global peoples_list

    # Grab the entity list
    entities = grab_all_entities()

    """
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
    """

    for entity in entities:
        randomize_entity(entity["entity_id"])


randomize_contacts()
set_specific()

connection.close()
