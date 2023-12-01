# Deliverables

- Michael Stacy: jmst231@uky.edu

- DeMarkus Butler: dlbu228@uky.edu

- Tag Howard: tag@jthoward.dev

- Keegan McCorkle: kjmc240@uky.edu

# Deliverable 1.1

- Team 20: Blake Crockett, Bowen Fan, Madhav Dahal, Nishan Budhathoki
- Team 21: Brennan Graham, Connor Day, Jose Cruz Guerrero, Keaton Martin

# Deliverable 2.1

To load in the other databases we initially used two methods depending on whether we had MySQL locally. Those of us who could only use mysql.cs.uky.edu renamed the other team's databases to have something like '\_team_20' after each name to avoid conflicting with our own tables. Those of us who had MySQL locally could instead load the other databases separately (into the databases team_3, team_20, and team_21). During our final integration one of us set up an internet accessible MySQL server and used the second method to load the three databases as it was more reproducible (and less prone to error) than loading all three team's tables into one database. This also mirrors much more closely how an actual database integration would work.

To merge the databases together we wrote a Python script that loaded both of the other team's databases into Pandas dataframes which were used to reformat and check the data. The script then output the Pandas dataframe into an SQL `INSERT` statement which added the data to our database.

Additionally, our database only accepts entities that include both a name and address. Therefore, values from other databases that did not have values for both characteristics are dropped.

# Deliverable 2.2

We used python with pandas to flag duplicates. If the Name and Address for an entity matched another entity in the table, both were flagged as duplicates. For deliverables 5 and 6, only the information for the first value for each duplicate pair was used to generate the output.

# Deliverable 2.3

We used strings and python to update the tables. We Used the code:

```python
cursor.execute(
    "INSERT INTO Entity_Table (Entity_ID, Street_Name, Zip, City, StateName, EntityName, Primary_Telephone_Number) Values "
    + e21
    + e20[:-1]
    + ";"
)
```

where e20 were the entities from team20 and e21 were the values from team 21. Some of the values associated with these strings were

```python
e20 :(41,'300 Rose Street Room 102 Hardymon Building','40506','Lexington','KY','Mr. Ray L. Hyatt Jr.',NULL),
(42,'301 Hilltop Avenue, Room 102','40506','Lexington','KY','Mr. Ray L. Hyatt Jr.',NULL)
```

```python
e21:(113,'666 Chestnut Road','40514','Lexington','KY','Richard Jackson','859-345-6782'),(114,'777 Poplar Court','40515','Lexington','KY','Mary Lewis','859-456-7893')
```

Of note: some of the duplicate entries were copied into the other databases with different addresses. Given that we were importing the data as if we were a business who had acquired these customers, we did not modify the addresses as this could indicate that these are separate people with the same name.

# Deliverable 3.1

```
+-------------------+
| Tables_in_team3   |
+-------------------+
| Entity_Table      |
| Receipt_Table     |
| Telephone_Numbers |
+-------------------+
```

# Deliverable 3.2

```
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+--------------------------+---------------------+-----------+--------------------+
| Entity_ID | Street_Name                                   | Zip   | City             | StateName | EntityName                        | Primary_Telephone_Number | Contact_Preferences | duplicate | email              |
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+--------------------------+---------------------+-----------+--------------------+
|         1 | 300 Rose Street Room 102 Hardymon Building    | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              | NULL                     |                  64 | Y         | Mr.887@uky.edu     |
|         2 | 301 Hilltop Avenue, Room 102                  | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              | NULL                     |                  64 | Y         | Mr.512@icloud.com  |
|         3 | 82 Beaver St Room 1301                        | 10005 | New York         | NY        | John Wick                         | 555-555-5555             |                   8 | Y         | Joh621@icloud.com  |
|         4 | 200 Park Avenue Penthouse                     | 10001 | New York         | NY        | Tony Stark                        | 555-555-3142             |                  63 | Y         | Ton562@icloud.com  |
|         5 | 117A Bleecker Street                          | 10001 | New York         | NY        | Dr. Stephen Strange               | (555)555-4321            |                   4 | Y         | Dr.820@uky.edu     |
|         6 | 200 Park Avenue Apartment 221                 | 10001 | New York         | NY        | Bob C. Smith                      | NULL                     |                   1 | Y         | Bob711@uky.edu     |
|         7 | #1 Avenue of Champions                        | 40506 | Lexington        | KY        | Bowman F. Wildcat                 | NULL                     |                 124 | N         | Bow841@gmail.com   |
|         8 | 200 Park Avenue                               | 40507 | Lexington        | KY        | Bob C. Smith                      | NULL                     |                   1 | Y         | Bob979@icloud.com  |
|         9 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Bob Porter c/o Intech             | NULL                     |                   1 | Y         | Bob684@uky.edu     |
|        10 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Mr. Bob Sydell c/o Intech         | NULL                     |                   1 | Y         | Mr.567@gmail.com   |
|        11 | 2299 Richmond Rd                              | 40502 | Lexington        | KY        | Chick-fil-A                       | (859)335-9856            |                 158 | N         | Chi573@icloud.com  |
|        12 | 471 Rose St                                   | 40508 | Lexington        | KY        | President Eli Capilouto           | 859-257-1701             |                 249 | N         | Pre142@gmail.com   |
|        13 | 150 W Lowry Ln #190                           | 40503 | Lexington        | KY        | Kroger                            | (859) 278-6228           |                  38 | N         | Kro149@gmail.com   |
|        14 | 2161 Paul Jones Way                           | 40509 | Lexington        | KY        | Culver's                          | (859)263-7777            |                  68 | N         | Cul736@uky.edu     |
|        15 | 1180 Seven Seas Dr                            | 32830 | Lake Buena Vista | FL        | Magic Kingdom Park                | (407)939-5277            |                 150 | N         | Mag329@gmail.com   |
|        16 | 500 W New Circle Rd                           | 40511 | Lexington        | KY        | Walmart Supercenter               | (859)381-9370            |                 150 | N         | Wal926@uky.edu     |
|        17 | 123 NotAReal St                               | 40502 | Lexington        | KY        | Tag Howard                        | (859)684-8444            |                 142 | N         | Tag718@uky.edu     |
|        18 | 1600 Pennsylvania Ave NW                      | 20500 | Washington       | DC        | White House                       | (202)456-1414            |                 125 | N         | Whi177@icloud.com  |
|        19 | 1400 Defense Pentagon                         | 20301 | Washington       | DC        | Pentagon                          | (703)697-1776            |                  66 | N         | Pen123@icloud.com  |
|        20 | 101 Cochran Rd                                | 40502 | Lexington        | KY        | Joella's Hot Chicken              | (859) 269-9593           |                 138 | N         | Joe423@uky.edu     |
|        21 | 867 South Broadway                            | 40504 | Lexington        | KY        | Jersey Mike's Subs                | (859)288-0008            |                  45 | N         | Jer528@uky.edu     |
|        22 | 700 Clark Ave                                 | 63102 | St. Louis        | MO        | Busch Stadium                     | 13143459600              |                 141 | N         | Bus702@icloud.com  |
|        23 | Antarctic Support Contract 7400 S. Tucson Way | 80112 | Centennial       | CO        | Palmer Station (Antarctica)       | NULL                     |                 103 | N         | Pal276@icloud.com  |
|        24 | 1386 Lexington Rd                             | 40206 | Louisville       | KY        | Headliners Music Hall             | (502) 584-8088           |                  41 | N         | Hea795@uky.edu     |
|        25 | 867 South Broadway                            | 40504 | Lexington        | KY        | Miyako Poke Bowl                  | (859)469-9098            |                 210 | N         | Miy581@gmail.com   |
|        26 | 899 Manchester St                             | 40508 | Lexington        | KY        | Manchester Music Hall             | (859) 537-7321           |                 181 | N         | Man355@uky.edu     |
|        27 | 1649 M-32                                     | 49735 | Gaylord          | MI        | E-Free Church Gaylord Campus      | 19897322647              |                  13 | N         | E-F453@gmail.com   |
|        28 | 7345 Delridge Way SW                          | 98106 | Seattle          | WA        | The Home Depot                    | 12067622126              |                  89 | N         | The526@gmail.com   |
|        29 | 500 S Upper St STE 110                        | 40508 | Lexington        | KY        | Target                            | 18592863352              |                 205 | N         | Tar395@gmail.com   |
|        30 | 211 NE Revere Avenue                          | 97701 | Bend             | OR        | Blockbuster                       | (541)385-9111            |                  49 | N         | Blo523@gmail.com   |
|        31 | 1837 Plaudit Pl                               | 40509 | Lexington        | KY        | Michael Stacy                     | (859)789-0812            |                 103 | N         | Mic866@icloud.com  |
|        32 | 525 Alakawa St                                | 96817 | Honolulu         | HI        | Costco Wholesale                  | (808)526-6100            |                 177 | N         | Cos689@icloud.com  |
|        33 | 2021 Harrodsburg Rd                           | 40504 | Lexington        | KY        | The Home Depot                    | (859) 373-0594           |                 210 | N         | The136@uky.edu     |
|        34 | 2039 El Camino Real                           | 95050 | Santa Clara      | CA        | Patel Brothers                    | 14082613555              |                 199 | N         | Pat530@uky.edu     |
|        35 | 918 Natural Bridge Rd                         | 40376 | Slade            | KY        | Thatcher Barbecue Company         | (606)947-8040            |                  64 | N         | Tha767@icloud.com  |
|        36 | 867 S Broadway                                | 40504 | Lexington        | KY        | DV8 Kitchen                       | (859) 955-0388           |                 120 | N         | DV8834@gmail.com   |
|        37 | 3400 Vine St                                  | 45220 | Cincinnati       | OH        | Cincinnati Zoo & Botanical Garden | (513)281-4700            |                  24 | N         | Cin331@uky.edu     |
|        38 | 417 E Maxwell St Unit B                       | 40508 | Lexington        | KY        | Kentucky Native Café              | (859)281-1718            |                 213 | N         | Ken830@gmail.com   |
|        39 | 4055 Nichols Park Dr                          | 40503 | Lexington        | KY        | Lowe's                            | (859) 971-8300           |                 213 | N         | Low724@gmail.com   |
|        40 | 4081 Finn Way                                 | 40503 | Lexington        | KY        | J. Alexander's Restaurant         | (859)687-0099            |                 153 | N         | J.489735@gmail.com |
|        41 | 300 Rose Street Room 102 Hardymon Building    | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              | NULL                     |                  64 | Y         | Mr.184@uky.edu     |
|        42 | 301 Hilltop Avenue, Room 102                  | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              | NULL                     |                  64 | Y         | Mr.384@uky.edu     |
|        43 | 82 Beaver St Room 1301                        | 10005 | New York         | NY        | John Wick                         | 555-555-5555             |                   8 | Y         | Joh911@uky.edu     |
|        44 | 200 Park Avenue Penthouse                     | 10001 | New York         | NY        | Tony Stark                        | 555-555-3142             |                  63 | Y         | Ton978@uky.edu     |
|        45 | 117A Bleecker Street                          | 10001 | New York         | NY        | Dr. Stephen Strange               | (555)555-4321            |                   4 | Y         | Dr.386@gmail.com   |
|        46 | 200 Park Avenue Apartment 221                 | 10001 | New York         | NY        | Bob C. Smith                      | NULL                     |                   1 | Y         | Bob258@gmail.com   |
|        47 | #1 Avenue of Champions                        | 40507 | Lexington        | KY        | Bowman F. Wildcat                 | NULL                     |                  34 | N         | Bow546@uky.edu     |
|        48 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Bob Porter c/o Intech             | NULL                     |                   1 | Y         | Bob184@icloud.com  |
|        49 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Mr. Bob Sydell c/o Intech         | NULL                     |                   1 | Y         | Mr.532@uky.edu     |
|        50 | 200 Park Avenue                               | 40507 | Lexington        | KY        | Bob C. Smith                      | NULL                     |                   1 | Y         | Bob440@gmail.com   |
|        51 | 1625 Pelham South                             | 36265 | Jacksonville     | AL        | Alfred Gates                      | 859-555-1234             |                 189 | N         | Alf943@icloud.com  |
|        52 | 3371 S Alabama Ave                            | 36460 | Monroeville      | AL        | Alvin McKee                       | 859-455-5678             |                 129 | N         | Alv994@gmail.com   |
|        53 | 103 North Caroline St                         | 13350 | Herkimer         | NY        | Karla Herbert                     | 617-575-1234             |                 152 | N         | Kar938@icloud.com  |
|        54 | 1000 State Route 36                           | 14843 | Hornell          | NY        | Marcy Mays                        | 617-355-5678             |                 252 | N         | Mar614@uky.edu     |
|        55 | 1400 County Rd 64                             | 14845 | Horseheads       | NY        | Bridget Bawen                     | 535-859-1234             |                 118 | N         | Bri783@icloud.com  |
|        56 | 135 Fairgrounds Memorial Pkwy                 | 14850 | Ithaca           | NY        | Taylor Kaiser                     | NULL                     |                 250 | N         | Tay352@gmail.com   |
|        57 | 2 Gannett Dr                                  | 13790 | Johnson City     | NY        | Diane Sanford                     | NULL                     |                 248 | N         | Dia588@icloud.com  |
|        58 | 233 5th Ave Ext                               | 12095 | Johnstown        | NY        | Delia Malone                      | NULL                     |                  56 | N         | Del404@uky.edu     |
|        59 | 601 Frank Stottile Blvd                       | 12401 | Kingston         | NY        | Ernest Sharp                      | NULL                     |                 202 | N         | Ern903@icloud.com  |
|        60 | 350 E Fairmount Ave                           | 14750 | Lakewood         | NY        | Marguerite Booth                  | NULL                     |                 221 | N         | Mar154@gmail.com   |
|        61 | 4975 Transit Rd                               | 14086 | Lancaster        | NY        | Mike Travis                       | NULL                     |                 187 | N         | Mik732@gmail.com   |
|        62 | 579 Troy-Schenectady Road                     | 12110 | Latham           | NY        | Debra Mason                       | NULL                     |                 241 | N         | Deb169@gmail.com   |
|        63 | 5783 So Transit Road                          | 14094 | Lockport         | NY        | Victor Norman                     | NULL                     |                 157 | N         | Vic343@icloud.com  |
|        64 | 280 Washington Street                         | 1749  | Hudson           | MA        | Herbert McMahon                   | NULL                     |                 197 | N         | Her431@uky.edu     |
|        65 | 20 Soojian Dr                                 | 1524  | Leicester        | MA        | Roberto Darling                   | NULL                     |                 180 | N         | Rob515@icloud.com  |
|        66 | 11 Jungle Road                                | 1453  | Leominster       | MA        | Juan Best                         | NULL                     |                  68 | N         | Jua421@uky.edu     |
|        67 | 301 Massachusetts Ave                         | 1462  | Lunenburg        | MA        | Lorna Schmidt                     | NULL                     |                   7 | N         | Lor876@icloud.com  |
|        68 | 780 Lynnway                                   | 1905  | Lynn             | MA        | Rick Nash                         | NULL                     |                  58 | N         | Ric531@icloud.com  |
|        69 | 70 Pleasant Valley Street                     | 1844  | Methuen          | MA        | Ken Bush                          | NULL                     |                 144 | N         | Ken632@gmail.com   |
|        70 | 3138 Custer Drive, Suite 210                  | 40517 | Lexington        | KY        | Central Business Systems, Inc     | 859-254-5568             |                 252 | N         | Cen699@gmail.com   |
|        71 | 1845 Goodpaster Way                           | 40505 | Lexington        | KY        | Inacomp IT                        | 859-494-1234             |                 227 | N         | Ina876@uky.edu     |
|        72 | 721 W. Main St.                               | 40508 | Lexington        | KY        | Trifecta!                         | 858-545-5638             |                  49 | N         | Tri957@icloud.com  |
|        73 | 241 Meadow Valley Rd.                         | 40511 | Lexington        | KY        | Tylark                            | 552-682-5334             |                 124 | N         | Tyl197@uky.edu     |
|        74 | 123 Means Drive                               | 40356 | Nicholasville    | KY        | Real Deals                        | 617-606-5678             |                 251 | N         | Rea201@uky.edu     |
|        75 | 956 Enterprise Ct Suite 150                   | 40510 | Lexington        | KY        | Green Solutions Land Care         | 687-101-1234             |                 158 | N         | Gre789@gmail.com   |
|        76 | 1 Dell Way                                    | 78682 | Round Rock       | TX        | Dell Technologies                 | 555-525-1000             |                 140 | N         | Del138@icloud.com  |
|        77 | 800 N Brand Blvd                              | 91203 | Glendale         | CA        | Hot Pockets                       | 222-222-1234             |                  44 | N         | Hot917@icloud.com  |
|        78 | 242 W 41st St.                                | 10036 | New York         | NY        | New York Times                    | 888-888-5678             |                 155 | N         | New930@uky.edu     |
|        79 | 5000 South Broad St.                          | 19112 | Philadelphia     | PA        | Urban Outfitters                  | 551-525-1204             |                 176 | N         | Urb202@gmail.com   |
|        80 | One Bowerman Drive                            | 97005 | Beaverton        | OR        | Nike                              | NULL                     |                  12 | N         | Nik208@gmail.com   |
|        81 | 300 Rose Street Room 102 Hardymon Building    | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              | NULL                     |                  64 | Y         | Mr.380@icloud.com  |
|        82 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Mr. Ray L. Hyatt Jr.              | NULL                     |                  64 | N         | Mr.788@gmail.com   |
|        83 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Bob Porter c/o Intech             | NULL                     |                   1 | Y         | Bob723@uky.edu     |
|        84 | 82 Beaver St Room 1301                        | 10005 | New York         | NY        | John Wick                         | 555-555-5555             |                   8 | Y         | Joh874@gmail.com   |
|        85 | 200 Park Avenue Penthouse                     | 10001 | New York         | NY        | Tony Stark                        | 555-555-3142             |                  63 | Y         | Ton755@uky.edu     |
|        86 | 117A Bleecker Street                          | 10001 | New York         | NY        | Dr. Stephen Strange               | (555)555-4321            |                   4 | Y         | Dr.884@gmail.com   |
|        87 | #1 Avenue of Champions                        | 40506 | Lexington        | KY        | Bowman F.  Wildcat                | NULL                     |                 131 | N         | Bow979@icloud.com  |
|        88 | 200 Park Avenue Apartment 221                 | 10001 | New York         | NY        | Bob C. Smith                      | NULL                     |                   1 | Y         | Bob929@uky.edu     |
|        89 | 200 Park Avenue Apartment 221                 | 10001 | New York         | NY        | Mr. Bob Sydell c/o Intech         | NULL                     |                   1 | N         | Mr.908@uky.edu     |
|        90 | 301 Hilltop Avenue, Room 102                  | 40506 | Lexington        | KY        | Mr. Bob Sydell c/o Intech         | NULL                     |                   1 | N         | Mr.335@gmail.com   |
|        91 | 2558 Larkin Rd #120                           | 40503 | Lexington        | KY        | Newport Cleaners #17              | 859-123-4567             |                 203 | N         | New554@uky.edu     |
|        92 | 10 Quality St                                 | 40507 | Lexington        | KY        | Gray Construction                 | 859-234-5678             |                  46 | N         | Gra762@uky.edu     |
|        93 | 2333 Alexandria Drive                         | 40504 | Lexington        | KY        | Weesner Properties, INC.          | 859-345-6789             |                 199 | N         | Wee332@uky.edu     |
|        94 | 740 W New Circle Rd                           | 40511 | Lexington        | KY        | Lexmark International, Inc.       | 859-456-7890             |                 216 | N         | Lex930@gmail.com   |
|        95 | 1780 Lexington Road                           | 40505 | Lexington        | KY        | Tempur Sealey                     | 859-567-8901             |                 187 | N         | Tem249@gmail.com   |
|        96 | 1700 Lexington Rd                             | 40505 | Lexington        | KY        | Valvoline                         | 859-678-9012             |                 136 | N         | Val672@gmail.com   |
|        97 | 4000 East New Circle Rd                       | 40511 | Lexington        | KY        | Lockheed Martin                   | 859-789-0123             |                 224 | N         | Loc844@uky.edu     |
|        98 | 4201 Versailles Rd.                           | 40510 | Lexington        | KY        | Keeneland Race Course             | 859-890-1234             |                  69 | N         | Kee253@gmail.com   |
|        99 | 4201 Versailles Rd.                           | 40510 | Lexington        | KY        | Mr. John Doe                      | 859-901-2345             |                  68 | N         | Mr.341@uky.edu     |
|       100 | 123 Elm Street                                | 40502 | Lexington        | KY        | Mrs. Jane Doe                     | 859-012-3456             |                  42 | N         | Mrs986@icloud.com  |
|       101 | 456 Oak Ave. Apt. 374                         | 40503 | Lexington        | KY        | Prof. Alice Smith                 | 859-123-4568             |                  63 | N         | Pro711@icloud.com  |
|       102 | 456 Oak Ave. Apt. 374                         | 40503 | Lexington        | KY        | Ms. Emily Brown                   | 859-345-6781             |                 226 | N         | Ms.331@icloud.com  |
|       103 | 789 Maple Road Unit 3                         | 40504 | Lexington        | KY        | Michael Johnson PhD               | 859-234-5670             |                  21 | N         | Mic775@gmail.com   |
|       104 | 789 Maple Road Unit 3                         | 40504 | Lexington        | KY        | Robert Taylor Esq.                | 859-456-7892             |                 148 | N         | Rob762@gmail.com   |
|       105 | 101 Pine Lane                                 | 40505 | Lexington        | KY        | William Davis                     | 859-567-8903             |                 116 | N         | Wil369@gmail.com   |
|       106 | 234 Cedar Dr.                                 | 40506 | Lexington        | KY        | Linda Wilson                      | 859-678-9014             |                  50 | N         | Lin257@icloud.com  |
|       107 | 890 Birch Circle                              | 40508 | Lexington        | KY        | David Moore                       | 859-789-0125             |                 133 | N         | Dav181@icloud.com  |
|       108 | 111 Willow Drive                              | 40509 | Lexington        | KY        | Susan Anderson                    | 859-890-1236             |                 254 | N         | Sus460@icloud.com  |
|       109 | 222 Spruce Avenue                             | 40510 | Lexington        | KY        | James Harris                      | 859-901-2347             |                 237 | N         | Jam292@gmail.com   |
|       110 | 333 Hickory Street                            | 40511 | Lexington        | KY        | Patricia Martin                   | 859-012-3458             |                  73 | N         | Pat300@gmail.com   |
|       111 | 444 Sycamore Lane                             | 40512 | Lexington        | KY        | Joseph Thompson                   | 859-123-4569             |                 136 | N         | Jos617@gmail.com   |
|       112 | 555 Redwood Drive                             | 40513 | Lexington        | KY        | Jessica White                     | 859-234-5671             |                 147 | N         | Jes436@icloud.com  |
|       113 | 666 Chestnut Road                             | 40514 | Lexington        | KY        | Richard Jackson                   | 859-345-6782             |                 145 | N         | Ric475@gmail.com   |
|       114 | 777 Poplar Court                              | 40515 | Lexington        | KY        | Mary Lewis                        | 859-456-7893             |                 146 | N         | Mar684@gmail.com   |
|       115 | 888 Birch Circle                              | 40516 | Lexington        | KY        | Thomas Hall                       | 859-567-8904             |                  78 | N         | Tho925@gmail.com   |
|       116 | 999 Willow Drive                              | 40517 | Lexington        | KY        | Elizabeth Adams                   | 859-678-9015             |                  71 | N         | Eli444@icloud.com  |
|       117 | 121 Pine Lane                                 | 40518 | Lexington        | KY        | Charles Clark                     | 859-789-0126             |                  82 | N         | Cha580@icloud.com  |
|       118 | 232 Cedar Drive                               | 40519 | Lexington        | KY        | Charles Clark                     | 859-789-0126             |                 225 | N         | Cha160@icloud.com  |
|       119 | 343 Walnut Court                              | 40520 | Lexington        | KY        | Charles Clark                     | 859-789-0126             |                 222 | N         | Cha701@gmail.com   |
|       121 | 547 Euclid Ave Ste. 120                       | 40504 | Lexington        | KY        | Jimmy John's                      | NULL                     |                  53 | N         | Jim154@gmail.com   |
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+--------------------------+---------------------+-----------+--------------------+
```

# Deliverable 4.1

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

# Deliverable 4.2

See 3.2, since the contact values are just booleans, we decided to use a bitmask to store them together in a single column. This is out logic for storing the value:

```python
TEXT_BITMASK = 0b00000001
EMAIL_BITMASK = 0b00000010
MAIL_BITMASK = 0b00000100
ROBOCALL_BITMASK = 0b00001000
FAX_BITMASK = 0b00010000
PHONE_BITMASK = 0b00100000
DNC_BITMASK = 0b01000000
ALL_BITMASK = (
    TEXT_BITMASK | EMAIL_BITMASK | MAIL_BITMASK | ROBOCALL_BITMASK | PHONE_BITMASK
)


def contact_info(
    ALL=False,
    EMAIL=False,
    TEXT=False,
    DNC=False,
    MAIL=False,
    ROBOCALL=False,
    FAX=False,
    PHONE=False,
) -> int:
    """Returns a binary representation for ALL, EMAIL, TEXT, DNC, MAIL, ROBOCALL, FAX, and PHONE"""
    bitmask = 0b00000000

    if ALL:
        bitmask |= ALL_BITMASK
    else:
        if EMAIL:
            bitmask |= EMAIL_BITMASK
        if TEXT:
            bitmask |= TEXT_BITMASK
        if MAIL:
            bitmask |= MAIL_BITMASK
        if ROBOCALL:
            bitmask |= ROBOCALL_BITMASK
        if PHONE:
            bitmask |= PHONE_BITMASK
    if DNC:
        bitmask |= DNC_BITMASK
    if FAX:
        bitmask |= FAX_BITMASK

    return bitmask
```

# Deliverable 5.1

```python
import mysql.connector
import pandas as pd

from args import args
from connection import connection

# Create Dataframe
Entity_Table = pd.read_sql("Select * from Entity_Table", connection)

Entity_Table["duplicate"] = "N"

Entity_Table.loc[:5, "duplicate"] = "Y"

# Create duplicates dataframe
duplicates = Entity_Table[Entity_Table.duplicate == "Y"].copy()
duplicates.reset_index(inplace=True, drop=True)

# Combine name and Address to get identifier for possible duplicates
duplicates["Name_Address"] = (
    duplicates.EntityName
    + " "
    + duplicates.Street_Name
    + " "
    + duplicates.City
    + " "
    + duplicates.StateName
    + " "
    + duplicates.Zip
)
unique_names = duplicates.Name_Address.unique()

# Create postcard
# Only send postcard to first listing for likely duplicate. If after sending postcard it is determined that the customer was not a duplicate,
# adjust database to indicate that the likely duplicates were unique customers
for i in unique_names:
    row = duplicates[duplicates.Name_Address == i].iloc[0]
    print(
        (row.email or "No email provided")
        + "\n"
        + row.EntityName
        + "\n"
        + row.Street_Name
        + "\n"
        + row.City
        + ", "
        + row.StateName
        + " "
        + row.Zip
        + "\n\n"
        + row.EntityName
        + "\n"
        + "It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!"
        + "\n\n"
        + "Looking forward to serving you again!"
        + "\n"
    )

connection.close()
```

# Deliverable 5.2

```
Mr.296@icloud.com
Mr. Ray L. Hyatt Jr.
300 Rose Street Room 102 Hardymon Building
Lexington, KY 40506

Mr. Ray L. Hyatt Jr.
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Mr.922@gmail.com
Mr. Ray L. Hyatt Jr.
301 Hilltop Avenue, Room 102
Lexington, KY 40506

Mr. Ray L. Hyatt Jr.
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Joh111@gmail.com
John Wick
82 Beaver St Room 1301
New York, NY 10005

John Wick
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Ton795@gmail.com
Tony Stark
200 Park Avenue Penthouse
New York, NY 10001

Tony Stark
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Dr.902@gmail.com
Dr. Stephen Strange
117A Bleecker Street
New York, NY 10001

Dr. Stephen Strange
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!

Bob944@icloud.com
Bob C. Smith
200 Park Avenue Apartment 221
New York, NY 10001

Bob C. Smith
It is great to meet you again! Your favorite food delivery family is growing, looks like you have already met some of our now expanded family. We want you to know that you will now get the same great service from our newly added drivers!

Looking forward to serving you again!
```

# Deliverable 6.1

```python
import mysql.connector
import pandas as pd

from connection import connection
from contact import get_contact_info

# Create Dataframe
Entity_Table = pd.read_sql("Select * from Entity_Table", connection)

# Create duplicates dataframe
duplicates = Entity_Table[Entity_Table.duplicate == "Y"].copy()
duplicates.reset_index(inplace=True, drop=True)

# Combine name and Address to get identifier for possible duplicates
duplicates["Name_Address"] = (
    duplicates.EntityName
    + " "
    + duplicates.Street_Name
    + " "
    + duplicates.City
    + " "
    + duplicates.StateName
    + " "
    + duplicates.Zip
)
unique_names = duplicates.Name_Address.unique()

# Send Coupon codes. Our customers are listed as entities rather than as businesses and customers; therefore, entity name is
# used for the name for the coupon.
# Customer can choose a contact preference that involves a phone number without providing a phone number. If no phone number is provided, the business is alerted that there is no phone number and therefore can collect one.
for i in unique_names:
    row = duplicates[duplicates.Name_Address == i].iloc[0]
    row.contact_preferences = get_contact_info(row.Contact_Preferences)
    if row.contact_preferences["email"] == True:
        print("EMAIL: " + row.EntityName + ";" + row.email + ";" + "25% Coupon Code")
    if row.contact_preferences["text"] == True:
        if row.Primary_Telephone_Number != None:
            print(
                "TEXT: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("TEXT: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["robocall"] == True:
        if row.Primary_Telephone_Number != None:
            print(
                "ROBOCALL: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("ROBOCALL: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["phone"] == True:
        if row.Primary_Telephone_Number != None:
            print(
                "PHONE: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("PHONE: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["fax"] == True:
        if row.Primary_Telephone_Number != None:
            print(
                "FAX: "
                + row.EntityName
                + "; "
                + row.Primary_Telephone_Number
                + "; "
                + "25% Coupon Code"
            )
        else:
            print("FAX: " + row.EntityName + "; No phone number provided")
    if row.contact_preferences["dnc"] == True:
        print("DNC: " + row.EntityName)
    if row.contact_preferences["mail"] == True:
        print(
            "MAIL: "
            + row.EntityName
            + "; "
            + row.Street_Name
            + " "
            + row.City
            + ", "
            + row.StateName
            + " "
            + row.Zip
            + "; "
            + "25% Coupon Code"
        )
    print(" ")

connection.close()
```

# Deliverable 6.2

```
DNC: Mr. Ray L. Hyatt Jr.

DNC: Mr. Ray L. Hyatt Jr.

ROBOCALL: John Wick; 555-555-5555; 25% Coupon Code

EMAIL: Tony Stark;Ton795@gmail.com;25% Coupon Code
TEXT: Tony Stark; 555-555-3142; 25% Coupon Code
ROBOCALL: Tony Stark; 555-555-3142; 25% Coupon Code
PHONE: Tony Stark; 555-555-3142; 25% Coupon Code
FAX: Tony Stark; 555-555-3142; 25% Coupon Code
MAIL: Tony Stark; 200 Park Avenue Penthouse New York, NY 10001; 25% Coupon Code

MAIL: Dr. Stephen Strange; 117A Bleecker Street New York, NY 10001; 25% Coupon Code

TEXT: Bob C. Smith; No phone number provided

TEXT: Bob C. Smith; No phone number provided

TEXT: Bob Porter c/o Intech; No phone number provided

TEXT: Mr. Bob Sydell c/o Intech; No phone number provided
```

# Deliverable 7.1

```sh
mysqldump --host HOSTNAME -u USER -p team3 > cs405g.team3.sql
```

# Deliverable 8.1

One of the largest difficulties within this project stemmed from the differences in how the various groups formatted their databases, and figuring out how to format the data when importing their data, not only to make the data compatible, but to also allow our database to detect the duplicate entries. Because of this, a fair amount of time was spent developing ways to sanitize the imported data to make it both usable and recognizable to our own database.

In addition, we learned the importance of standardizing data. To this point, sometimes providing too much granularity for the data can make a database too cumbersome to use. However, if the data is not broken up sufficiently, more work will be needed later to perform certain queries. Because of this, a balance must be struck.
