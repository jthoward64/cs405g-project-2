import mysql.connector
from mysql.connector import errorcode

from args import args

config = {
    "user": args.linkblue,
    "password": args.password,
    "host": "mysql.cs.uky.edu",
    "database": args.linkblue,
    "raise_on_warnings": True,
}

connection = None

try:
    connection = mysql.connector.connect(**config)
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
