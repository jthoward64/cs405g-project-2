# Programming Project #2 - Imports, APIs, Python, and more!

**Due:** Friday by 9am

The owner is overjoyed with the force multiplication your database has brought to their business. The business was so successful the owner has bought out a couple rival businesses at bankruptcy sales and wants to leverage those new assets, equipment, people, and data to increase business.

You are responsible for merging their customer databases with your current one.

Each part is points as indicated. Some are really giveaways - like "Deliverable 1)", but do not underestimate this project and fail to start on it promptly. Late penalties can eat into your scores rapidly.

This is a group project again!
Find two other groups and exchange copies of your database with them.

## Deliverable 1: Group Database Exchange (20 points)

> 1.1) Note the members of the other teams and their team number/name here for your submission.

Add the contents of those databases to your teams database.
How is up to you as the data base architect to decide. I will demo one method of converting the database backups into something you can import in class.

Be careful how you deal with duplicates, you will need to track in some manner if customers in the imported databases are also present in your existing database. How is up to you. You will note your instructor's provided entries are duplicates as each database will have copies of them.

## Deliverable 2: Database Merging (50 points)

> 2.1) Describe the method of importing data you chose.

> 2.2) Describe how you handled duplicates. NOTE! Points are lost if Duplicates are not detected and handled properly.

> 2.3) Show the commands you used for four of the entries: two that are duplicates, two that are not duplicates. At least one example from each of the imported databases.

You can copy and paste them into your submission document.

DO NOT use screen grabs or other image clipping for these submissions.

Use a fixed space font for this like courier for the database outputs.

Display your completed tables

## Deliverable 3: Display Completed Tables (20 points)

> 3.1) Run `show tables;`` from your database prompt after connecting to your database and place the output in your submission.

> 3.2) `select * from <tablename>;` where `<tablename>` is the name of the table(s) you created in your database and place that output in your submission. Follow the same copy paste conventions as described in Deliverable 2. Follow the same copy paste conventions as described previously.

Some customers hate junk mail. Some customers hate having their phone buzz. Some hate everything except your services apparently. You are asked to add some controls to the customer database to assist with managing contact preferences.

Add a field to your address table(s) that indicates contact preferences. The domain for this is `("ALL", "EMAIL", "TEXT", "DNC", "MAIL", "ROBOCALL","FAX","PHONE")`.

```
DNC = Do Not Contact
ALL = Short hand for everything except DNC and FAX.
EMAIL = Accepts email contact (does this work if there is no email? - sounds like a potential constraint to set in your DB)
TEXT = Accepts text messages
MAIL = Accepts physical mail
ROBOCALL = Accepts automated phone calls (does this work if there is no phone number? - sounds like another potential constraint)
FAX = Accepts fax connections (this tends to be a dedicated line)

PHONE = Accepts live person phone calls.
```

You may implement whichever data type or table structure you deem appropriate here.

Assign these customers these settings:
John Wick accepts ROBOCALLS.
The Bob's accept TEXT messages. (that is all the Bobs)
Tony Stark accepts EMAIL, TEXT, MAIL, ROBOCALL, FAX, & PHONE as Jarvis answers them.
Stephen Strange accepts MAIL.
Ray Hyatt is strictly DNC.

Assign the addresses preferences randomly, but be mindful that if they don't have a phone number or email address, some items (phone/robot/fax or email as appropriate) should not apply. Points will be lost if the configuration is not logical.

## Deliverable 4: Customer Database Enhancement (30 points)

> 4.1) Show the commands you used to input 5 of these entries and update the tables.

> 4.2) Run `select * from <tablename>;` where `<tablename>` is the name of the table(s) that accommodate the contact preferences from your database and place the output in your submission.

## Note about Python

You will find examples of accessing a DB via python here -
https://realpython.com/python-sql-libraries/#mysqlLinks to an external site.

And other places. python and the libraries needed are pre-installed on the multi-lab machines so you need not worry with that.
Be sure to apply the practices you have learned here and in other classes with respect to good coding and good security.

Write a python program to extract customers that you already had in your database and are in one of the new databases you imported (you did flag them in deliverable 2 right?) . Send those addresses an update postcard on how the former food delivery businesses are now a part of your food delivery business.

This report should NOT honor the contact preferences. There will be repercussions for this.

The post card & Email output will look something like this: (remove `< >` in your output)

```
<email address>
<Customer name>
<Customer street address>
<Customer City, Customer State, Customer Zip>
```

```
<Full name and title of Customer>
```

It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

---

## Deliverable 5: Python Program - Postcard and Email (30 points)

> 5.1) Provide a listing of your python program.

> 5.2) Provide the output from a run of this program generating postcards.

Your boss has got a lot of bad feedback from their long term customers - In apology they want to offer the existing customers a promotion to get them to spend more at their stores. They wants to follow the contact preferences strictly.

Write a python program to extract pre-existing customers and offer them a 25% discount coupon. You will generate the coupon as follows:

For EMAIL output

```
EMAIL: <Business Name>, <Customer Name>; <Customer email>; 25% Coupon Code
```

For TEXT output

```
TEXT: <Business Name>,<Customer Name>; <Customer phone>; 25% Coupon Code
```

For ROBOCALL output

```
ROBOCALL: <Business Name>,<Customer Name>; <Customer phone>; 25% Coupon Code
```

For PHONE output

```
PHONE: <Business Name>,<Customer Name>; <Customer phone>; 25% Coupon Code
```

For FAX output

```
FAX: <Business Name>,<Customer Name>; <Customer phone>; 25% Coupon Code
```

For DNC output:

```
DNC: <Customer Name>
```

For MAIL output:

```
MAIL: <Business Name>,<Customer Name>; <Customer postal address as a single line>; 25% Coupon Code
```

For ALL output: (should cause the same output as `TEXT,ROBOTCALL,EMAIL,MAIL` to be generated as above)

## Deliverable 6: Python Program - Discount Coupons (30 points)

> 6.1) Provide a listing of your python program.

> 6.2) Provide the output from a run of this program generating the above contact lists.

## Deliverable 7: Database Backup (10 points)

> 7.1) Backup up your database to the name "cs405.teamname.sql" and store in your home directory on the multi-lab systems.

Show the commands you used to do this and place these in your submission.

## Deliverable 8: Reflection (10 points)

> 8.1) Write a short blurb about how your path in completing this project as influenced by the information you had at hand. No more that one typed page, I am not looking for a paper here, just experiences and lessons learned.

You may be asked to demo your project so do not lose your backup! Might be wise for each team member to keep a copy of it.

Closing Comments: Put your names on the first page of your submissions!
