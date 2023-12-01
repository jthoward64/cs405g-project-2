import mysql.connector
import pandas as pd
import numpy as np
from args import args

#Connect to mysql
cnx = mysql.connector.connect(user = args.linkblue,
                              password = args.password,
                              host = 'mysql.cs.uky.edu',
                              database = args.linkblue)

cursor = cnx.cursor()

#Import Group 20 tables and clean data
Entities20 = pd.read_sql('Select * from Entities20', cnx)
ADDRESS20 = pd.read_sql('Select * from ADDRESS20', cnx)
PhoneNumbers20 = pd.read_sql('Select * from PhoneNumbers20', cnx)
PhoneNumbers20 = PhoneNumbers20[PhoneNumbers20.phone_number != 'NULL']
# Merge into single dataframe
df20 = ADDRESS20.merge(Entities20, how = 'outer')
# Remove Second Phone number from "Urban Outfitters" in main dataframe
df20.loc[38, 'phone_number'] = '551-525-1204'
df20.replace({'NULL' : None}, inplace = True)
df20.AddressID = df20.AddressID - 60

#Separate Urban Outfitters phone numbers in PhoneNumbers20
PhoneNumbers20.loc[25] = PhoneNumbers20.loc[24]
PhoneNumbers20.loc[24, 'phone_number'] = '551-525-1204'
PhoneNumbers20.loc[25, 'phone_number'] = '869-678-789'

#Join PhoneNumbers with new AddressID
PhoneNumbers20 = PhoneNumbers20.merge(df20, on = 'entity_id', how = 'left')

#Replace 'NA' with 'Null'
df20.fillna('NULL', inplace = True)
# Create String for Phone Numbers
ph20 = ''
for i in range(len(PhoneNumbers20)):
    row = PhoneNumbers20.iloc[i]
    ph20 += ( ('(\'' + str(row.phone_number_x) + '\',\'' + str(row.AddressID) + '\'),' ))


#Create string to add to entities
e20 = ''
for i in range(len(df20)):
    row = df20.iloc[i]
    e20 += ( ('(' + str(row.AddressID) + ',\'' + row.StreetAddress + '\',\'' + str(row.ZipCode) + '\',\'' + row.City + '\',\'' + row.State + '\',\'' + row.EntityName + '\',\'' + str(row.phone_number) + '\'),'))

# Put NULL in correct format
e20 = e20.replace('\'NULL\'', 'NULL')

cursor.execute('INSERT INTO Entity_Table3 Values' + e20)

#Import Group 21 tables and clean data
Name21 = pd.read_sql('Select * from Name21', cnx)
Name21['Full_Name'] = Name21[['Prefix','FirstName', 'MiddleName', 'LastName', 'Suffix', 'CompanyName']].apply(lambda x : ' '.join(x.dropna()), axis = 1)
Name21['Full_Name'] = Name21[['Full_Name', 'CareOf']].apply(lambda x : ' c/o '.join(x.dropna()), axis = 1)
Address21 = pd.read_sql('Select * from Address21', cnx)
Address21.loc[7, 'StreetAddress'] = '301 Hilltop Avenue,'
Address21['Full_Address'] = Address21[['StreetAddress', 'ApartmentSuite', 'BuildingName']].apply(lambda x : ' '.join(x.dropna()), axis = 1)
NameAddress21 = pd.read_sql('Select * from NameAddress21', cnx)
PhoneNumbers21 =  pd.read_sql('Select * from PhoneNumbers21', cnx)

#Merge tables into single dataframe
df21 = Name21.merge(NameAddress21, on = 'NameID', how = 'outer').merge(Address21, on = 'AddressID', how = 'outer').merge(PhoneNumbers21, on = "NameID", how = 'outer')
#Replace 'NA' with 'Null'
df21.fillna('NULL', inplace = True)
# Standardize state to match our database
df21.State.replace({'Kentucky' : 'KY', 'Ky' : 'KY', 'New York' : 'NY'}, inplace = True)

#Convert to Appropriate IDs
df21['EntityID'] = df21.index + 81
#Create dataframe of not null Phone Numbers
phone_21 = df21[df21.PhoneNumber != 'NULL']

cursor.execute('INSERT INTO Telephone_Numbers Values' + ph20)

# Create String for Phone Numbers
ph21 = ''
for i in range(len(phone_21)):
    row = phone_21.iloc[i]
    ph21 += ( ('(\'' + str(row.PhoneNumber) + '\',\'' + str(row.EntityID) + '\'),' ))
    
cursor.execute('INSERT INTO Telephone_Numbers Values' + ph21)

#Create string to add to entities
e21 = ''
for i in range(len(df21)):
    row = df21.iloc[i]
    e21 += ('(' + str(row.EntityID) + ',\'' + row.Full_Address + '\',\'' + str(row.ZipCode) + '\',\'' + row.City + '\',\'' + row.State + '\',\'' + row.Full_Name + '\',\'' + str(row.PhoneNumber) + '\'),')

# Put Null in Correct format
e21 = e21.replace('\'NULL\'', 'NULL')

cursor.execute('INSERT INTO Entity_Table3 Values' + e21)

# Check for duplicates
# Import Entity_Table as dataframe
Entity_Table3 = pd.read_sql('Select * from Entity_Table3', cnx)

#Determine which columns are duplicates
duplicates = Entity_Table3.duplicated(subset = ['EntityName', 'Street_Name', 'Zip', 'City', 'StateName'], keep = False)
duplicates.replace({True : 'Y', False : 'N'}, inplace = True)

#Create string for duplicates
du = ''
for i in range(len(duplicates)):
    du += ('(\'' + duplicates[i] + '\'),')