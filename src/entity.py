from contact import get_contact_info
from connection import connection
import random

class Entity:
    def __init__(self, itemized_info):
        self.id = itemized_info[0]
        self.address = itemized_info[1]
        self.zip = itemized_info[2]
        self.city = itemized_info[3]
        self.state = itemized_info[4]
        self.name = itemized_info[5]
        self.primary_phone = itemized_info[6]
        self.contact_preference = get_contact_info(itemized_info[7])

    def __eq__(self, other):
        if self.name == other.name:
            return True
        
        return False

    def randomize(self):
        self.contact_preference = random.randint(0, 255)

class Database:
    def __init__(self):
        entities = []
        duplicates = []

    def duplicate(self, new_entity):
        '''Checks if there is a duplicate entity, assigns it to other table'''
        for check in self.entities:
            if check == new_entity:
                self.duplicates.append(new_entity)
                return
            
        self.entites.append(new_entity)

    def grab_entities_regular(self):
        if not connection:
            print('Could not connect - no connection object')
            return None
        elif connection.is_connected():
            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Entity_Table;')
                rows = cursor.fetchall()
                for item in rows:
                    self.duplicate(Entity(item))
        else:
            print("Not connected - connection object is not connected")

    def grab_entities_20(self):
        if not connection:
            print('Could not connect - no connection object')
            return None
        elif connection.is_connected():
            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Entity_Table;')
                rows = cursor.fetchall()
                for item in rows:
                    self.duplicate(Entity(item))
        else:
            print("Not connected - connection object is not connected")

    def grab_entities_21(self):
        if not connection:
            print('Could not connect - no connection object')
            return None
        elif connection.is_connected():
            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Entity_Table;')
                rows = cursor.fetchall()
                for item in rows:
                    self.duplicate(Entity(item))
        else:
            print("Not connected - connection object is not connected")