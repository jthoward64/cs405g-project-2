# Load backup of project 1 database
mysql -e "source ./project1/cs405.group3.sql"
mysql -e "source ./project1/cs405.group20.sql"
mysql -e "source ./project1/cs405.group21.sql"

# Alter database to fit project 2 schema
python ./src/alter.py

# Load group 20 and 21 data into group 3 database
python ./src/project_2_data_cleaning.py

# Set contact preferences
python ./src/Deliverable_4.py

# Add the emails
python ./src/random_email_generator.py

#
