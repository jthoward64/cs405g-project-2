from tabulate import tabulate

from connection import connection
from database import (
    grab_all_entities,
    grab_all_receipts,
    grab_all_telephone_numbers,
    show_tables,
)

try:
    show_tables()
    print(tabulate(grab_all_entities()))
    print(tabulate(grab_all_receipts()))
    print(grab_all_telephone_numbers())
finally:
    connection.close()
