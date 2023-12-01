/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;

/*!40103 SET TIME_ZONE='+00:00' */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Entity_Table`
--
DROP TABLE IF EXISTS `Entity_Table`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE
  `Entity_Table` (
    `Entity_ID` int (11) NOT NULL AUTO_INCREMENT,
    `Street_Name` varchar(50) NOT NULL,
    `Zip` varchar(5) NOT NULL,
    `City` varchar(128) NOT NULL,
    `StateName` char(2) NOT NULL,
    `EntityName` varchar(128) NOT NULL,
    `Primary_Telephone_Number` varchar(32) DEFAULT NULL,
    `Contact_Preferences` tinyint (3) unsigned NOT NULL DEFAULT '0',
    `duplicate` varchar(1) NOT NULL DEFAULT 'N',
    `email` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`Entity_ID`),
    KEY `fk_Telephone_Number` (`Entity_ID`, `Primary_Telephone_Number`),
    CONSTRAINT `fk_Telephone_Number` FOREIGN KEY (`Entity_ID`, `Primary_Telephone_Number`) REFERENCES `Telephone_Numbers` (`Entity_ID`, `Telephone_Number`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 122 DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entity_Table`
--
LOCK TABLES `Entity_Table` WRITE;

/*!40000 ALTER TABLE `Entity_Table` DISABLE KEYS */;

INSERT INTO
  `Entity_Table`
VALUES
  (
    1,
    '300 Rose Street Room 102 Hardymon Building',
    '40506',
    'Lexington',
    'KY',
    'Mr. Ray L. Hyatt Jr.',
    NULL,
    64,
    'Y',
    'Mr.296@icloud.com'
  ),
  (
    2,
    '301 Hilltop Avenue, Room 102',
    '40506',
    'Lexington',
    'KY',
    'Mr. Ray L. Hyatt Jr.',
    NULL,
    64,
    'Y',
    'Mr.922@gmail.com'
  ),
  (
    3,
    '82 Beaver St Room 1301',
    '10005',
    'New York',
    'NY',
    'John Wick',
    '555-555-5555',
    8,
    'Y',
    'Joh111@gmail.com'
  ),
  (
    4,
    '200 Park Avenue Penthouse',
    '10001',
    'New York',
    'NY',
    'Tony Stark',
    '555-555-3142',
    63,
    'Y',
    'Ton795@gmail.com'
  ),
  (
    5,
    '117A Bleecker Street',
    '10001',
    'New York',
    'NY',
    'Dr. Stephen Strange',
    '(555)555-4321',
    4,
    'Y',
    'Dr.902@gmail.com'
  ),
  (
    6,
    '200 Park Avenue Apartment 221',
    '10001',
    'New York',
    'NY',
    'Bob C. Smith',
    NULL,
    1,
    'Y',
    'Bob944@icloud.com'
  ),
  (
    7,
    '#1 Avenue of Champions',
    '40506',
    'Lexington',
    'KY',
    'Bowman F. Wildcat',
    NULL,
    220,
    'N',
    'Bow421@icloud.com'
  ),
  (
    8,
    '200 Park Avenue',
    '40507',
    'Lexington',
    'KY',
    'Bob C. Smith',
    NULL,
    1,
    'Y',
    'Bob880@icloud.com'
  ),
  (
    9,
    '1 Dead End Row Room 200',
    '12347',
    'Dallas',
    'TX',
    'Bob Porter c/o Intech',
    NULL,
    1,
    'Y',
    'Bob761@gmail.com'
  ),
  (
    10,
    '1 Dead End Row Room 200',
    '12347',
    'Dallas',
    'TX',
    'Mr. Bob Sydell c/o Intech',
    NULL,
    1,
    'Y',
    'Mr.122@gmail.com'
  ),
  (
    11,
    '2299 Richmond Rd',
    '40502',
    'Lexington',
    'KY',
    'Chick-fil-A',
    '(859)335-9856',
    205,
    'N',
    'Chi391@icloud.com'
  ),
  (
    12,
    '471 Rose St',
    '40508',
    'Lexington',
    'KY',
    'President Eli Capilouto',
    '859-257-1701',
    118,
    'N',
    'Pre534@uky.edu'
  ),
  (
    13,
    '150 W Lowry Ln #190',
    '40503',
    'Lexington',
    'KY',
    'Kroger',
    '(859) 278-6228',
    201,
    'N',
    'Kro337@icloud.com'
  ),
  (
    14,
    '2161 Paul Jones Way',
    '40509',
    'Lexington',
    'KY',
    'Culver\'s',
    '(859)263-7777',
    255,
    'N',
    'Cul486@uky.edu'
  ),
  (
    15,
    '1180 Seven Seas Dr',
    '32830',
    'Lake Buena Vista',
    'FL',
    'Magic Kingdom Park',
    '(407)939-5277',
    15,
    'N',
    'Mag770@gmail.com'
  ),
  (
    16,
    '500 W New Circle Rd',
    '40511',
    'Lexington',
    'KY',
    'Walmart Supercenter',
    '(859)381-9370',
    173,
    'N',
    'Wal761@gmail.com'
  ),
  (
    17,
    '123 NotAReal St',
    '40502',
    'Lexington',
    'KY',
    'Tag Howard',
    '(859)684-8444',
    63,
    'N',
    'Tag706@uky.edu'
  ),
  (
    18,
    '1600 Pennsylvania Ave NW',
    '20500',
    'Washington',
    'DC',
    'White House',
    '(202)456-1414',
    139,
    'N',
    'Whi740@gmail.com'
  ),
  (
    19,
    '1400 Defense Pentagon',
    '20301',
    'Washington',
    'DC',
    'Pentagon',
    '(703)697-1776',
    167,
    'N',
    'Pen479@uky.edu'
  ),
  (
    20,
    '101 Cochran Rd',
    '40502',
    'Lexington',
    'KY',
    'Joella\'s Hot Chicken',
    '(859) 269-9593',
    141,
    'N',
    'Joe457@icloud.com'
  ),
  (
    21,
    '867 South Broadway',
    '40504',
    'Lexington',
    'KY',
    'Jersey Mike\'s Subs',
    '(859)288-0008',
    159,
    'N',
    'Jer399@icloud.com'
  ),
  (
    22,
    '700 Clark Ave',
    '63102',
    'St. Louis',
    'MO',
    'Busch Stadium',
    '13143459600',
    114,
    'N',
    'Bus362@icloud.com'
  ),
  (
    23,
    'Antarctic Support Contract 7400 S. Tucson Way',
    '80112',
    'Centennial',
    'CO',
    'Palmer Station (Antarctica)',
    NULL,
    6,
    'N',
    'Pal881@uky.edu'
  ),
  (
    24,
    '1386 Lexington Rd',
    '40206',
    'Louisville',
    'KY',
    'Headliners Music Hall',
    '(502) 584-8088',
    113,
    'N',
    'Hea628@icloud.com'
  ),
  (
    25,
    '867 South Broadway',
    '40504',
    'Lexington',
    'KY',
    'Miyako Poke Bowl',
    '(859)469-9098',
    245,
    'N',
    'Miy709@uky.edu'
  ),
  (
    26,
    '899 Manchester St',
    '40508',
    'Lexington',
    'KY',
    'Manchester Music Hall',
    '(859) 537-7321',
    204,
    'N',
    'Man736@gmail.com'
  ),
  (
    27,
    '1649 M-32',
    '49735',
    'Gaylord',
    'MI',
    'E-Free Church Gaylord Campus',
    '19897322647',
    3,
    'N',
    'E-F326@gmail.com'
  ),
  (
    28,
    '7345 Delridge Way SW',
    '98106',
    'Seattle',
    'WA',
    'The Home Depot',
    '12067622126',
    80,
    'N',
    'The488@gmail.com'
  ),
  (
    29,
    '500 S Upper St STE 110',
    '40508',
    'Lexington',
    'KY',
    'Target',
    '18592863352',
    78,
    'N',
    'Tar573@icloud.com'
  ),
  (
    30,
    '211 NE Revere Avenue',
    '97701',
    'Bend',
    'OR',
    'Blockbuster',
    '(541)385-9111',
    169,
    'N',
    'Blo989@icloud.com'
  ),
  (
    31,
    '1837 Plaudit Pl',
    '40509',
    'Lexington',
    'KY',
    'Michael Stacy',
    '(859)789-0812',
    141,
    'N',
    'Mic352@gmail.com'
  ),
  (
    32,
    '525 Alakawa St',
    '96817',
    'Honolulu',
    'HI',
    'Costco Wholesale',
    '(808)526-6100',
    65,
    'N',
    'Cos534@uky.edu'
  ),
  (
    33,
    '2021 Harrodsburg Rd',
    '40504',
    'Lexington',
    'KY',
    'The Home Depot',
    '(859) 373-0594',
    84,
    'N',
    'The604@icloud.com'
  ),
  (
    34,
    '2039 El Camino Real',
    '95050',
    'Santa Clara',
    'CA',
    'Patel Brothers',
    '14082613555',
    95,
    'N',
    'Pat522@uky.edu'
  ),
  (
    35,
    '918 Natural Bridge Rd',
    '40376',
    'Slade',
    'KY',
    'Thatcher Barbecue Company',
    '(606)947-8040',
    57,
    'N',
    'Tha223@gmail.com'
  ),
  (
    36,
    '867 S Broadway',
    '40504',
    'Lexington',
    'KY',
    'DV8 Kitchen',
    '(859) 955-0388',
    16,
    'N',
    'DV8607@gmail.com'
  ),
  (
    37,
    '3400 Vine St',
    '45220',
    'Cincinnati',
    'OH',
    'Cincinnati Zoo & Botanical Garden',
    '(513)281-4700',
    191,
    'N',
    'Cin554@uky.edu'
  ),
  (
    38,
    '417 E Maxwell St Unit B',
    '40508',
    'Lexington',
    'KY',
    'Kentucky Native Café',
    '(859)281-1718',
    94,
    'N',
    'Ken761@gmail.com'
  ),
  (
    39,
    '4055 Nichols Park Dr',
    '40503',
    'Lexington',
    'KY',
    'Lowe\'s',
    '(859) 971-8300',
    45,
    'N',
    'Low388@uky.edu'
  ),
  (
    40,
    '4081 Finn Way',
    '40503',
    'Lexington',
    'KY',
    'J. Alexander\'s Restaurant',
    '(859)687-0099',
    194,
    'N',
    'J.822955@gmail.com'
  ),
  (
    41,
    '300 Rose Street Room 102 Hardymon Building',
    '40506',
    'Lexington',
    'KY',
    'Mr. Ray L. Hyatt Jr.',
    NULL,
    64,
    'Y',
    'Mr.352@icloud.com'
  ),
  (
    42,
    '301 Hilltop Avenue, Room 102',
    '40506',
    'Lexington',
    'KY',
    'Mr. Ray L. Hyatt Jr.',
    NULL,
    64,
    'Y',
    'Mr.642@gmail.com'
  ),
  (
    43,
    '82 Beaver St Room 1301',
    '10005',
    'New York',
    'NY',
    'John Wick',
    '555-555-5555',
    8,
    'Y',
    'Joh889@gmail.com'
  ),
  (
    44,
    '200 Park Avenue Penthouse',
    '10001',
    'New York',
    'NY',
    'Tony Stark',
    '555-555-3142',
    63,
    'Y',
    'Ton768@uky.edu'
  ),
  (
    45,
    '117A Bleecker Street',
    '10001',
    'New York',
    'NY',
    'Dr. Stephen Strange',
    '(555)555-4321',
    4,
    'Y',
    'Dr.624@icloud.com'
  ),
  (
    46,
    '200 Park Avenue Apartment 221',
    '10001',
    'New York',
    'NY',
    'Bob C. Smith',
    NULL,
    1,
    'Y',
    'Bob680@gmail.com'
  ),
  (
    47,
    '#1 Avenue of Champions',
    '40507',
    'Lexington',
    'KY',
    'Bowman F. Wildcat',
    NULL,
    248,
    'N',
    'Bow319@gmail.com'
  ),
  (
    48,
    '1 Dead End Row Room 200',
    '12347',
    'Dallas',
    'TX',
    'Bob Porter c/o Intech',
    NULL,
    1,
    'Y',
    'Bob952@gmail.com'
  ),
  (
    49,
    '1 Dead End Row Room 200',
    '12347',
    'Dallas',
    'TX',
    'Mr. Bob Sydell c/o Intech',
    NULL,
    1,
    'Y',
    'Mr.268@icloud.com'
  ),
  (
    50,
    '200 Park Avenue',
    '40507',
    'Lexington',
    'KY',
    'Bob C. Smith',
    NULL,
    1,
    'Y',
    'Bob266@uky.edu'
  ),
  (
    51,
    '1625 Pelham South',
    '36265',
    'Jacksonville',
    'AL',
    'Alfred Gates',
    '859-555-1234',
    205,
    'N',
    'Alf563@icloud.com'
  ),
  (
    52,
    '3371 S Alabama Ave',
    '36460',
    'Monroeville',
    'AL',
    'Alvin McKee',
    '859-455-5678',
    254,
    'N',
    'Alv492@uky.edu'
  ),
  (
    53,
    '103 North Caroline St',
    '13350',
    'Herkimer',
    'NY',
    'Karla Herbert',
    '617-575-1234',
    34,
    'N',
    'Kar885@uky.edu'
  ),
  (
    54,
    '1000 State Route 36',
    '14843',
    'Hornell',
    'NY',
    'Marcy Mays',
    '617-355-5678',
    227,
    'N',
    'Mar677@gmail.com'
  ),
  (
    55,
    '1400 County Rd 64',
    '14845',
    'Horseheads',
    'NY',
    'Bridget Bawen',
    '535-859-1234',
    178,
    'N',
    'Bri917@uky.edu'
  ),
  (
    56,
    '135 Fairgrounds Memorial Pkwy',
    '14850',
    'Ithaca',
    'NY',
    'Taylor Kaiser',
    NULL,
    218,
    'N',
    'Tay608@uky.edu'
  ),
  (
    57,
    '2 Gannett Dr',
    '13790',
    'Johnson City',
    'NY',
    'Diane Sanford',
    NULL,
    108,
    'N',
    'Dia806@gmail.com'
  ),
  (
    58,
    '233 5th Ave Ext',
    '12095',
    'Johnstown',
    'NY',
    'Delia Malone',
    NULL,
    35,
    'N',
    'Del210@uky.edu'
  ),
  (
    59,
    '601 Frank Stottile Blvd',
    '12401',
    'Kingston',
    'NY',
    'Ernest Sharp',
    NULL,
    242,
    'N',
    'Ern473@gmail.com'
  ),
  (
    60,
    '350 E Fairmount Ave',
    '14750',
    'Lakewood',
    'NY',
    'Marguerite Booth',
    NULL,
    228,
    'N',
    'Mar361@uky.edu'
  ),
  (
    61,
    '4975 Transit Rd',
    '14086',
    'Lancaster',
    'NY',
    'Mike Travis',
    NULL,
    87,
    'N',
    'Mik830@uky.edu'
  ),
  (
    62,
    '579 Troy-Schenectady Road',
    '12110',
    'Latham',
    'NY',
    'Debra Mason',
    NULL,
    178,
    'N',
    'Deb740@uky.edu'
  ),
  (
    63,
    '5783 So Transit Road',
    '14094',
    'Lockport',
    'NY',
    'Victor Norman',
    NULL,
    25,
    'N',
    'Vic492@icloud.com'
  ),
  (
    64,
    '280 Washington Street',
    '1749',
    'Hudson',
    'MA',
    'Herbert McMahon',
    NULL,
    253,
    'N',
    'Her872@gmail.com'
  ),
  (
    65,
    '20 Soojian Dr',
    '1524',
    'Leicester',
    'MA',
    'Roberto Darling',
    NULL,
    213,
    'N',
    'Rob616@icloud.com'
  ),
  (
    66,
    '11 Jungle Road',
    '1453',
    'Leominster',
    'MA',
    'Juan Best',
    NULL,
    190,
    'N',
    'Jua434@icloud.com'
  ),
  (
    67,
    '301 Massachusetts Ave',
    '1462',
    'Lunenburg',
    'MA',
    'Lorna Schmidt',
    NULL,
    203,
    'N',
    'Lor691@uky.edu'
  ),
  (
    68,
    '780 Lynnway',
    '1905',
    'Lynn',
    'MA',
    'Rick Nash',
    NULL,
    84,
    'N',
    'Ric626@gmail.com'
  ),
  (
    69,
    '70 Pleasant Valley Street',
    '1844',
    'Methuen',
    'MA',
    'Ken Bush',
    NULL,
    171,
    'N',
    'Ken289@uky.edu'
  ),
  (
    70,
    '3138 Custer Drive, Suite 210',
    '40517',
    'Lexington',
    'KY',
    'Central Business Systems, Inc',
    '859-254-5568',
    248,
    'N',
    'Cen681@uky.edu'
  ),
  (
    71,
    '1845 Goodpaster Way',
    '40505',
    'Lexington',
    'KY',
    'Inacomp IT',
    '859-494-1234',
    96,
    'N',
    'Ina923@uky.edu'
  ),
  (
    72,
    '721 W. Main St.',
    '40508',
    'Lexington',
    'KY',
    'Trifecta!',
    '858-545-5638',
    236,
    'N',
    'Tri151@icloud.com'
  ),
  (
    73,
    '241 Meadow Valley Rd.',
    '40511',
    'Lexington',
    'KY',
    'Tylark',
    '552-682-5334',
    46,
    'N',
    'Tyl392@icloud.com'
  ),
  (
    74,
    '123 Means Drive',
    '40356',
    'Nicholasville',
    'KY',
    'Real Deals',
    '617-606-5678',
    35,
    'N',
    'Rea215@gmail.com'
  ),
  (
    75,
    '956 Enterprise Ct Suite 150',
    '40510',
    'Lexington',
    'KY',
    'Green Solutions Land Care',
    '687-101-1234',
    54,
    'N',
    'Gre303@icloud.com'
  ),
  (
    76,
    '1 Dell Way',
    '78682',
    'Round Rock',
    'TX',
    'Dell Technologies',
    '555-525-1000',
    154,
    'N',
    'Del647@uky.edu'
  ),
  (
    77,
    '800 N Brand Blvd',
    '91203',
    'Glendale',
    'CA',
    'Hot Pockets',
    '222-222-1234',
    154,
    'N',
    'Hot223@gmail.com'
  ),
  (
    78,
    '242 W 41st St.',
    '10036',
    'New York',
    'NY',
    'New York Times',
    '888-888-5678',
    25,
    'N',
    'New997@icloud.com'
  ),
  (
    79,
    '5000 South Broad St.',
    '19112',
    'Philadelphia',
    'PA',
    'Urban Outfitters',
    '551-525-1204',
    194,
    'N',
    'Urb990@icloud.com'
  ),
  (
    80,
    'One Bowerman Drive',
    '97005',
    'Beaverton',
    'OR',
    'Nike',
    NULL,
    85,
    'N',
    'Nik330@uky.edu'
  ),
  (
    81,
    '300 Rose Street Room 102 Hardymon Building',
    '40506',
    'Lexington',
    'KY',
    'Mr. Ray L. Hyatt Jr.',
    NULL,
    64,
    'Y',
    'Mr.477@uky.edu'
  ),
  (
    82,
    '1 Dead End Row Room 200',
    '12347',
    'Dallas',
    'TX',
    'Mr. Ray L. Hyatt Jr.',
    NULL,
    64,
    'N',
    'Mr.992@uky.edu'
  ),
  (
    83,
    '1 Dead End Row Room 200',
    '12347',
    'Dallas',
    'TX',
    'Bob Porter c/o Intech',
    NULL,
    1,
    'Y',
    'Bob809@icloud.com'
  ),
  (
    84,
    '82 Beaver St Room 1301',
    '10005',
    'New York',
    'NY',
    'John Wick',
    '555-555-5555',
    8,
    'Y',
    'Joh609@gmail.com'
  ),
  (
    85,
    '200 Park Avenue Penthouse',
    '10001',
    'New York',
    'NY',
    'Tony Stark',
    '555-555-3142',
    63,
    'Y',
    'Ton943@uky.edu'
  ),
  (
    86,
    '117A Bleecker Street',
    '10001',
    'New York',
    'NY',
    'Dr. Stephen Strange',
    '(555)555-4321',
    4,
    'Y',
    'Dr.953@icloud.com'
  ),
  (
    87,
    '#1 Avenue of Champions',
    '40506',
    'Lexington',
    'KY',
    'Bowman F.  Wildcat',
    NULL,
    29,
    'N',
    'Bow982@icloud.com'
  ),
  (
    88,
    '200 Park Avenue Apartment 221',
    '10001',
    'New York',
    'NY',
    'Bob C. Smith',
    NULL,
    1,
    'Y',
    'Bob632@uky.edu'
  ),
  (
    89,
    '200 Park Avenue Apartment 221',
    '10001',
    'New York',
    'NY',
    'Mr. Bob Sydell c/o Intech',
    NULL,
    1,
    'N',
    'Mr.448@icloud.com'
  ),
  (
    90,
    '301 Hilltop Avenue, Room 102',
    '40506',
    'Lexington',
    'KY',
    'Mr. Bob Sydell c/o Intech',
    NULL,
    1,
    'N',
    'Mr.390@gmail.com'
  ),
  (
    91,
    '2558 Larkin Rd #120',
    '40503',
    'Lexington',
    'KY',
    'Newport Cleaners #17',
    '859-123-4567',
    255,
    'N',
    'New898@gmail.com'
  ),
  (
    92,
    '10 Quality St',
    '40507',
    'Lexington',
    'KY',
    'Gray Construction',
    '859-234-5678',
    31,
    'N',
    'Gra573@gmail.com'
  ),
  (
    93,
    '2333 Alexandria Drive',
    '40504',
    'Lexington',
    'KY',
    'Weesner Properties, INC.',
    '859-345-6789',
    190,
    'N',
    'Wee606@icloud.com'
  ),
  (
    94,
    '740 W New Circle Rd',
    '40511',
    'Lexington',
    'KY',
    'Lexmark International, Inc.',
    '859-456-7890',
    234,
    'N',
    'Lex776@gmail.com'
  ),
  (
    95,
    '1780 Lexington Road',
    '40505',
    'Lexington',
    'KY',
    'Tempur Sealey',
    '859-567-8901',
    90,
    'N',
    'Tem160@uky.edu'
  ),
  (
    96,
    '1700 Lexington Rd',
    '40505',
    'Lexington',
    'KY',
    'Valvoline',
    '859-678-9012',
    159,
    'N',
    'Val537@icloud.com'
  ),
  (
    97,
    '4000 East New Circle Rd',
    '40511',
    'Lexington',
    'KY',
    'Lockheed Martin',
    '859-789-0123',
    242,
    'N',
    'Loc711@icloud.com'
  ),
  (
    98,
    '4201 Versailles Rd.',
    '40510',
    'Lexington',
    'KY',
    'Keeneland Race Course',
    '859-890-1234',
    73,
    'N',
    'Kee508@icloud.com'
  ),
  (
    99,
    '4201 Versailles Rd.',
    '40510',
    'Lexington',
    'KY',
    'Mr. John Doe',
    '859-901-2345',
    9,
    'N',
    'Mr.797@uky.edu'
  ),
  (
    100,
    '123 Elm Street',
    '40502',
    'Lexington',
    'KY',
    'Mrs. Jane Doe',
    '859-012-3456',
    209,
    'N',
    'Mrs972@uky.edu'
  ),
  (
    101,
    '456 Oak Ave. Apt. 374',
    '40503',
    'Lexington',
    'KY',
    'Prof. Alice Smith',
    '859-123-4568',
    197,
    'N',
    'Pro115@uky.edu'
  ),
  (
    102,
    '456 Oak Ave. Apt. 374',
    '40503',
    'Lexington',
    'KY',
    'Ms. Emily Brown',
    '859-345-6781',
    14,
    'N',
    'Ms.146@uky.edu'
  ),
  (
    103,
    '789 Maple Road Unit 3',
    '40504',
    'Lexington',
    'KY',
    'Michael Johnson PhD',
    '859-234-5670',
    248,
    'N',
    'Mic658@gmail.com'
  ),
  (
    104,
    '789 Maple Road Unit 3',
    '40504',
    'Lexington',
    'KY',
    'Robert Taylor Esq.',
    '859-456-7892',
    69,
    'N',
    'Rob691@uky.edu'
  ),
  (
    105,
    '101 Pine Lane',
    '40505',
    'Lexington',
    'KY',
    'William Davis',
    '859-567-8903',
    197,
    'N',
    'Wil349@uky.edu'
  ),
  (
    106,
    '234 Cedar Dr.',
    '40506',
    'Lexington',
    'KY',
    'Linda Wilson',
    '859-678-9014',
    34,
    'N',
    'Lin143@icloud.com'
  ),
  (
    107,
    '890 Birch Circle',
    '40508',
    'Lexington',
    'KY',
    'David Moore',
    '859-789-0125',
    121,
    'N',
    'Dav787@icloud.com'
  ),
  (
    108,
    '111 Willow Drive',
    '40509',
    'Lexington',
    'KY',
    'Susan Anderson',
    '859-890-1236',
    75,
    'N',
    'Sus843@uky.edu'
  ),
  (
    109,
    '222 Spruce Avenue',
    '40510',
    'Lexington',
    'KY',
    'James Harris',
    '859-901-2347',
    14,
    'N',
    'Jam424@uky.edu'
  ),
  (
    110,
    '333 Hickory Street',
    '40511',
    'Lexington',
    'KY',
    'Patricia Martin',
    '859-012-3458',
    241,
    'N',
    'Pat128@gmail.com'
  ),
  (
    111,
    '444 Sycamore Lane',
    '40512',
    'Lexington',
    'KY',
    'Joseph Thompson',
    '859-123-4569',
    214,
    'N',
    'Jos992@icloud.com'
  ),
  (
    112,
    '555 Redwood Drive',
    '40513',
    'Lexington',
    'KY',
    'Jessica White',
    '859-234-5671',
    94,
    'N',
    'Jes953@uky.edu'
  ),
  (
    113,
    '666 Chestnut Road',
    '40514',
    'Lexington',
    'KY',
    'Richard Jackson',
    '859-345-6782',
    246,
    'N',
    'Ric653@icloud.com'
  ),
  (
    114,
    '777 Poplar Court',
    '40515',
    'Lexington',
    'KY',
    'Mary Lewis',
    '859-456-7893',
    143,
    'N',
    'Mar737@icloud.com'
  ),
  (
    115,
    '888 Birch Circle',
    '40516',
    'Lexington',
    'KY',
    'Thomas Hall',
    '859-567-8904',
    137,
    'N',
    'Tho161@uky.edu'
  ),
  (
    116,
    '999 Willow Drive',
    '40517',
    'Lexington',
    'KY',
    'Elizabeth Adams',
    '859-678-9015',
    60,
    'N',
    'Eli769@icloud.com'
  ),
  (
    117,
    '121 Pine Lane',
    '40518',
    'Lexington',
    'KY',
    'Charles Clark',
    '859-789-0126',
    221,
    'N',
    'Cha391@icloud.com'
  ),
  (
    118,
    '232 Cedar Drive',
    '40519',
    'Lexington',
    'KY',
    'Charles Clark',
    '859-789-0126',
    169,
    'N',
    'Cha150@gmail.com'
  ),
  (
    119,
    '343 Walnut Court',
    '40520',
    'Lexington',
    'KY',
    'Charles Clark',
    '859-789-0126',
    112,
    'N',
    'Cha851@uky.edu'
  ),
  (
    121,
    '547 Euclid Ave Ste. 120',
    '40504',
    'Lexington',
    'KY',
    'Jimmy John\'s',
    NULL,
    85,
    'N',
    'Jim927@uky.edu'
  );

/*!40000 ALTER TABLE `Entity_Table` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `Receipt_Table`
--
DROP TABLE IF EXISTS `Receipt_Table`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE
  `Receipt_Table` (
    `Transaction_Number` int (11) NOT NULL AUTO_INCREMENT,
    `Seller_Key` int (11) NOT NULL,
    `Buyer_Key` int (11) NOT NULL,
    `Picture` blob,
    `Zip` varchar(5) NOT NULL,
    `StateName` char(2) NOT NULL,
    `Number_Of_Items` int (11) NOT NULL,
    `Total_Sales` decimal(15, 2) NOT NULL,
    `Highest_Price` decimal(15, 2) NOT NULL,
    `Lowest_Price` decimal(15, 2) NOT NULL,
    PRIMARY KEY (`Transaction_Number`),
    KEY `Seller_Key` (`Seller_Key`),
    KEY `Buyer_Key` (`Buyer_Key`),
    CONSTRAINT `Receipt_Table_ibfk_1` FOREIGN KEY (`Seller_Key`) REFERENCES `Entity_Table` (`Entity_ID`),
    CONSTRAINT `Receipt_Table_ibfk_2` FOREIGN KEY (`Buyer_Key`) REFERENCES `Entity_Table` (`Entity_ID`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receipt_Table`
--
LOCK TABLES `Receipt_Table` WRITE;

/*!40000 ALTER TABLE `Receipt_Table` DISABLE KEYS */;

INSERT INTO
  `Receipt_Table`
VALUES
  (
    1,
    13,
    1,
    NULL,
    '40503',
    'KY',
    5,
    25.00,
    5.00,
    5.00
  ),
  (
    2,
    33,
    31,
    NULL,
    '40504',
    'KY',
    5,
    30.00,
    6.99,
    3.49
  ),
  (
    3,
    11,
    4,
    NULL,
    '40502',
    'KY',
    3,
    29.75,
    13.37,
    6.49
  ),
  (
    4,
    29,
    17,
    NULL,
    '40509',
    'KY',
    5,
    36.04,
    12.00,
    2.89
  ),
  (
    5,
    36,
    3,
    NULL,
    '40504',
    'KY',
    4,
    30.02,
    15.00,
    3.00
  ),
  (
    6,
    13,
    5,
    NULL,
    '40503',
    'KY',
    5,
    22.10,
    6.49,
    0.24
  ),
  (
    7,
    24,
    17,
    NULL,
    '40508',
    'KY',
    1,
    16.53,
    16.53,
    16.53
  ),
  (
    8,
    13,
    2,
    NULL,
    '40503',
    'KY',
    5,
    47.44,
    23.00,
    4.49
  ),
  (
    9,
    14,
    12,
    NULL,
    '40509',
    'KY',
    4,
    25.00,
    9.99,
    4.00
  ),
  (
    10,
    15,
    9,
    NULL,
    '32830',
    'FL',
    6,
    78.25,
    15.99,
    9.99
  ),
  (
    11,
    16,
    8,
    NULL,
    '40511',
    'KY',
    4,
    57.80,
    20.83,
    10.87
  ),
  (
    12,
    29,
    17,
    NULL,
    '40508',
    'KY',
    6,
    80.97,
    30.67,
    5.87
  ),
  (
    13,
    21,
    31,
    NULL,
    '40527',
    'KY',
    4,
    40.28,
    15.60,
    6.00
  ),
  (
    14,
    22,
    31,
    NULL,
    '20500',
    'DC',
    2,
    36217.34,
    36213.35,
    3.99
  ),
  (
    15,
    18,
    19,
    NULL,
    '20301',
    'DC',
    1,
    705392000000.00,
    705392000000.00,
    705392000000.00
  );

/*!40000 ALTER TABLE `Receipt_Table` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `Telephone_Numbers`
--
DROP TABLE IF EXISTS `Telephone_Numbers`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!40101 SET character_set_client = utf8 */;

CREATE TABLE
  `Telephone_Numbers` (
    `Telephone_Number` varchar(32) NOT NULL,
    `Entity_ID` int (11) NOT NULL,
    PRIMARY KEY (`Telephone_Number`, `Entity_ID`),
    KEY `Entity_ID` (`Entity_ID`),
    CONSTRAINT `Telephone_Numbers_ibfk_1` FOREIGN KEY (`Entity_ID`) REFERENCES `Entity_Table` (`Entity_ID`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telephone_Numbers`
--
LOCK TABLES `Telephone_Numbers` WRITE;

/*!40000 ALTER TABLE `Telephone_Numbers` DISABLE KEYS */;

INSERT INTO
  `Telephone_Numbers`
VALUES
  ('555-555-5555', 3),
  ('555-555-3142', 4),
  ('(555)555-4321', 5),
  ('(859)335-9856', 11),
  ('859-257-1701', 12),
  ('(859) 278-6228', 13),
  ('(859)263-7777', 14),
  ('(407)939-5277', 15),
  ('(859)381-9370', 16),
  ('(859)684-8444', 17),
  ('(202)456-1414', 18),
  ('(703)697-1776', 19),
  ('(859) 269-9593', 20),
  ('(859)288-0008', 21),
  ('13143459600', 22),
  ('(502) 584-8088', 24),
  ('(859)469-9098', 25),
  ('(859) 537-7321', 26),
  ('19897322647', 27),
  ('12067622126', 28),
  ('1-800-591-3869', 29),
  ('18592863352', 29),
  ('(541)385-9111', 30),
  ('(859)789-0812', 31),
  ('(808)526-6100', 32),
  ('(859) 373-0594', 33),
  ('(859)260-9404', 33),
  ('(859)260-9410', 33),
  ('14082613555', 34),
  ('(606)947-8040', 35),
  ('(859) 955-0388', 36),
  ('(513)281-4700', 37),
  ('(859)281-1718', 38),
  ('(859) 971-8300', 39),
  ('(859)687-0099', 40);

/*!40000 ALTER TABLE `Telephone_Numbers` ENABLE KEYS */;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01  0:16:58