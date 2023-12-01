# Deliverables

# Deliverable 1.1 ✔✔

- Team 20: Blake Crockett, Bowen Fan, Madhav Dahal, Nishan Budhathoki  
- Team 21: Brennan Graham, Connor Day, Jose Cruz Guerrero, Keaton Martin

# Deliverable 2.1 

- Just do it in Python

# Deliverable 2.2 

- Also python

# Deliverable 2.3 

- ...

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

- Wrote email maker
- See Deliverable_5.py

# Deliverable 5.2 (Demarkus Butler) ✔

- See Deliverable_5.py

# Deliverable 6.1 (Demarkus Butler) ✔

- See Deliverable_6.py

# Deliverable 6.2 (Demarkus Butler) ✔

- See Deliverable_6.py

# Deliverable 7.1 (Group) 

- EZ

# Deliverable 8.1 (Group)

-
