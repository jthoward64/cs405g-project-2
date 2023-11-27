import mysql.connector
from args import args
from mysql.connector import errorcode

config = {
    "user": "jtho264",
    "password": args.password,
    "host": "mysql.cs.uky.edu",
    "database": "jtho264",
    "raise_on_warnings": True,
}

try:
    connection = mysql.connector.connect(**config)
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
else:
    connection.close()
