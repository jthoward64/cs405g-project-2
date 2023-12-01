from connection import connection
from contact import get_contact_info


def show_tables():
    if not connection:
        print("Could not connect - no connection object")
    elif connection.is_connected():
        with connection.cursor() as cursor:
            cursor.execute("show tables;")

            rows = cursor.fetchall()

            if rows is None:
                print("No tables")
                return

            for rows in rows:
                print(rows)

    else:
        print("Not connected - connection object is not connected")


def grab_all(table_name):
    """Grabs everything from a table"""
    if not connection:
        print("Could not connect - no connection object")
        return None
    elif connection.is_connected():
        with connection.cursor() as cursor:
            cursor.execute(f"select * from {table_name};")

            rows = cursor.fetchall()

            return rows

    else:
        print("Not connected - connection object is not connected")
        return None


def grab_all_entities():
    """Grabs everything from the entities table"""
    entities = grab_all("Entity_Table")

    if entities is None:
        return None

    new_list = []

    for entity in entities:
        new_item = {
            "entity_id": entity[0],
            "address": entity[1],
            "zip": entity[2],
            "city": entity[3],
            "state": entity[4],
            "name": entity[5],
            "primary_phone": entity[6],
            "contact_preference": get_contact_info(entity[7]),
            "duplicate": entity[8],
            "email": entity[9],
        }
        new_list.append(new_item)

    return new_list


def grab_all_receipts():
    """Grabs everything from the receipts table"""
    receipts = grab_all("Receipt_Table")

    if receipts is None:
        return None

    for receipt in receipts:
        receipt = {
            "entity_seller_id": receipt[1],
            "entity_buyer_id": receipt[2],
            "picture": receipt[3],
            "zip": receipt[4],
            "state": receipt[5],
            "number_of_items": receipt[6],
            "total_price": receipt[7],
            "most_expensive_item": receipt[8],
            "least_expensive_item": receipt[9],
        }

    return receipts


def grab_all_telephone_numbers():
    """Grabs everything from the telephone numbers table"""
    numbers = grab_all("Telephone_Numbers")

    if numbers is None:
        return None

    entity_id_to_telephone_numbers = {}

    for number in numbers:
        entity_id_to_telephone_numbers[number[1]] = number[0]

    return entity_id_to_telephone_numbers
