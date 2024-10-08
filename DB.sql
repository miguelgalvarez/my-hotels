-- ----------------------------
-- Table structure for entities
-- ----------------------------
DROP TABLE IF EXISTS hotelchain;
CREATE TABLE hotelchain (
	HotelChainID serial PRIMARY KEY,
	HotelChainName varchar(45) NOT NULL,
	HotelChainAddress varchar(100) NOT NULL,
	PhoneNumber BIGINT NOT NULL,
	NumberOfHotels INT NOT NULL,
	HotelChainEmail varchar(100) NOT NULL CHECK (HotelChainEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
	HotelID serial PRIMARY KEY,
	HotelChainID INT REFERENCES hotelchain(HotelChainID),
	HotelPhoneNumber BIGINT NOT NULL,
	Address varchar(100) NOT NULL,
	NumberOfRooms INT NOT NULL,
	HotelCategory varchar(45) NOT NULL,
	HotelArea varchar(45) NOT NULL,
	HotelName varchar(45) NOT NULL,
	HotelEmail varchar(100) NOT NULL CHECK (HotelEmail LIKE '_%@_%._%'),
	Rating double precision NOT NULL
);

DROP TABLE IF EXISTS room;
CREATE TABLE room (
	RoomID serial PRIMARY KEY,
	HotelID BIGINT REFERENCES hotel(HotelID),
	RoomView varchar(45) NOT NULL,
	Price double precision NOT NULL,
	Capacity INT NOT NULL,
	Amenities TEXT NOT NULL,
	RoomNumber INT NOT NULL,
	Damages TEXT,
	RoomExtension boolean NOT NULL
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	CustomerID serial PRIMARY KEY,
	CustomerUsername varchar(45) NOT NULL,
	CustomerPassword varchar(255) NOT NULL,
	DateOfRegistration date NOT NULL,
	Address varchar(100) NOT NULL,
	FullName varchar(45) NOT NULL,
	IDPresented varchar(45) NOT NULL,
	CustomerEmail varchar(100) NOT NULL CHECK (CustomerEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	EmployeeID serial PRIMARY KEY,
	HotelID serial REFERENCES hotel(HotelID),
	Address varchar(100) NOT NULL,
	FullName varchar(45) NOT NULL,
	EmployeeNumber INT NOT NULL,
	Role varchar(45) NOT NULL
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
	BookingID serial PRIMARY KEY,
	CustomerID BIGINT REFERENCES customer(CustomerID),
	HotelID BIGINT REFERENCES hotel(HotelID),
	RoomID BIGINT REFERENCES room(RoomID),
	Payment boolean DEFAULT false,
	PricePaid double precision NOT NULL,
	CheckIn date NOT NULL,
	CheckOut date NOT NULL
);

DROP TABLE IF EXISTS renting;
CREATE TABLE renting (
	RentingID serial PRIMARY KEY,
	CustomerID BIGINT REFERENCES customer(CustomerID),
	RoomID INT REFERENCES room(RoomID),
	CheckIn date NOT NULL,
	CheckOut date NOT NULL
);

DROP TABLE IF EXISTS booking_archive;
CREATE TABLE booking_archive (
    BookingID INT,
    CustomerID INT,
    HotelID INT,
	RoomID INT,
	Payment boolean,
    PricePaid DOUBLE PRECISION NOT NULL,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL,
    ArchivalTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ArchivalReason TEXT,
    PRIMARY KEY (BookingID, ArchivalTimestamp)
);

DROP TABLE IF EXISTS renting_archive;
CREATE TABLE renting_archive (
    RentingID INT,
    CustomerID INT,
    RoomID INT,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL,
    ArchivalTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ArchivalReason TEXT,
    PRIMARY KEY (RentingID, ArchivalTimestamp)
);


-- ----------------------------
-- Records of hotel chains
-- ----------------------------
INSERT INTO hotelchain (HotelChainName, PhoneNumber, NumberOfHotels, HotelChainEmail, HotelChainAddress)
VALUES
    ('Hilton', '18007741500', 8, 'HiltonHonors@hilton.com','7930 Jones Branch Dr, McLean, VA 22102, United States'),
    ('Hyatt', '18003237249', 8, 'consumeraffairs@hyatt.com','150 North Riverside Plaza Chicago, IL 6060, United States'),
    ('Wyndam', '18009378461', 8, 'wyndhamupport@westin.com','1900 5th Avenue Seattle, WA 98101, United States'),
    ('Marriott', '18882362427', 8, 'customer.care@marriott.com','7750 Wisconsin Avenue Bethesda, Maryland 20814, United States'),
    ('IHG Hotels', '18884654329', 8, 'customer@IHG.com','3 Ravinia DriveSuite Atlanta, Georgia 30346-2149, United States');


-- ----------------------------
-- Records of hotels
-- ----------------------------	
INSERT INTO Hotel (HotelChainID, HotelEmail, HotelArea, HotelCategory, HotelName, HotelPhoneNumber, Rating, NumberOfRooms, Address)
VALUES
	-- Hotels for Hilton
    (1,'hotel1@gmail.com', 'Montreal', 'Luxury','Homewood Suites', '1234567890', 4, 5, '6939 Decarie, H3W3E5 Montreal, Canada'),
    (1,'hotel2@gmail.com', 'Montreal', 'Mid-Range','Hampton Inn', '2345678901', 3, 5, '1444 Drummond, H3G 1V9 Montreal, Canada'),
    (1,'hotel3@gmail.com', 'Montreal', 'Luxury','Embassy Suites', '3456789012', 5, 5, '5225 Côte-des-Neiges, H3T 1Y1 Montreal, Canada'),
    (1,'hotel4@gmail.com', 'Montreal', 'Mid-Range','DoubleTree', '4567890123', 4, 5, '395 7e Avenue, Lachine, H8S 2Z5 Montreal, Canada'),
    (1,'hotel5@gmail.com', 'Montreal', 'Luxury','Garden Inn', '5678901234', 3, 5, '5283 Avenue du Parc, Plateau Mont Royal, H2V 4G9 Montreal, Canada'),
    (1,'hotel6@gmail.com', 'Toronto', 'Mid-Range','Vogue Hotel', '6789012345', 4, 5, '560 Evans Avenue, Etobicoke, M8W2W1 Toronto, Canada'),
    (1,'hotel7@gmail.com', 'Toronto', 'Budget','Garden Inn Airport', '7890123456', 5, 5, '55 Evelyn Avenue, M6P 2Z2 Toronto, Canada'),
    (1,'hotel8@gmail.com', 'Toronto', 'Luxury','Home2 Suites', '8901234567', 4, 5, '9 Old Mill Road, Etobicoke, M8X 1G5 Toronto, Canada'),

    -- Hotels for Hyatt
    (2,'hotel9@gmail.com', 'Toronto', 'Budget','Hyatt Centric', '9012345678', 3, 5, '111 Princes Boulevard, M6K 3C3 Toronto, Canada'),
    (2,'hotel10@gmail.com', 'Vancouver', 'Luxury','Grand Hyatt', '0123456789', 4, 5, '1253 Johnston St, V6H3R9 Vancouver, BC, Canada'),
    (2,'hotel11@gmail.com', 'Montreal', 'Mid-Range','Park Hyatt', '1234567890', 4, 5, '206 Rue Sainte-Marie, J5R 1G2 Laprairie, Canada'),
    (2,'hotel12@gmail.com', 'Montreal', 'Budget','Hyatt House', '2345678901', 3, 5, '2521 Rue du Centre, H3K 1J9 Montreal, Canada'),
    (2,'hotel13@gmail.com', 'Montreal', 'Luxury','Hyatt Regency', '3456789012', 5, 5, '400 Rue Richmond, H3J 1V1 Montreal, Canada'),
    (2,'hotel14@gmail.com', 'Montreal', 'Mid-Range','Hyatt Andaz', '4567890123', 4, 5, '210 Rue De La Gauchetière Ouest, H2Z 2A2 Montreal, Canada'),
    (2,'hotel15@gmail.com', 'Montreal', 'Luxury','Hyatt Place', '5678901234', 3, 5, '1155 Sherbrooke Ouest, Montreal, QC, H3A2N3'),
    (2,'hotel16@gmail.com', 'Toronto', 'Mid-Range','Hyatt Studios', '6789012345', 4, 5, '1214 Queen Street West, M6J 1J6 Toronto, Canada'),

    -- Hotels for Wyndham
    (3,'hotel25@gmail.com', 'Vancouver', 'Budget','Days Inn', '9012345678', 3, 5, '1133 Hastings St W, Vancouver, BC, V6E3T3'),
    (3,'hotel26@gmail.com', 'Vancouver', 'Luxury','Wyndham Grand', '0123456789', 4, 5, '2030 Barclay St, Vancouver, BC, V6G 1L5'),
    (3,'hotel27@gmail.com', 'Montreal', 'Luxury','Ramada', '1234567890', 4, 5, '7200 Rue Sherbrooke East, H1N 1E7 Montreal, Canada'),
    (3,'hotel28@gmail.com', 'Montreal', 'Budget','Super 8', '2345678901', 3, 5, '96 Boulevard Mortagne, J4B 5M7 Boucherville, Canada'),
    (3,'hotel29@gmail.com', 'Toronto', 'Luxury','Ramada Encore', '3456789012', 5, 5, '80 Blue Jays Way, M5V 2G3 Toronto, Canada '),
    (3,'hotel30@gmail.com', 'Toronto', 'Mid-Range','Travelodge', '4567890123', 4, 5, '80 Cooperage Street - George Brown College, M5A 0J3 Toronto, Canada'),
    (3,'hotel31@gmail.com', 'Toronto', 'Luxury','Wingate', '5678901234', 3, 5, '220 Bloor Street West, M5S 1T8 Toronto, Canada'),
    (3,'hotel32@gmail.com', 'Vancouver', 'Luxury','Dolce Hotel and Resort', '6789012345', 4, 5, '1111 Burnaby St, Vancouver, BC, V6E 1P4'),

    -- Hotels for Marriott
    (4,'hotel17@gmail.com', 'Toronto', 'Budget','SpringHill Suites', '1234567890', 3, 5, '387 Bloor Street East, ON M4W 1H7 Toronto, Canada'),
    (4,'hotel18@gmail.com', 'Vancouver', 'Mid-Range','Ritz Carleton', '2345678901', 4, 5, '1128 West Hastings Street, Vancouver, BC, V6B4R5'),
    (4,'hotel19@gmail.com', 'Montreal', 'Luxury','W Hotel', '3456789012', 4, 5, '7365 boulevard Marie-Victorin, J4W 1A6 Brossard, Canada'),
    (4,'hotel20@gmail.com', 'Montreal', 'Mid-Range','Sheraton', '4567890123', 3, 5, '10888 Cote De Liesse, Montreal, QC H8T 1A6, Canada, H8T 1A6 Dorval, Canada'),
    (4,'hotel21@gmail.com', 'Toronto', 'Mid-Range','TownPlace Suites', '5678901234', 5, 5, '1364 Queen Street East, M4L 1C8 Toronto, Canada'),
    (4,'hotel22@gmail.com', 'Toronto', 'Budget','Residence Inn', '6789012345', 4, 5, '29 Waverley Road, M4L 3T2 Toronto, Canada'),
    (4,'hotel23@gmail.com', 'Toronto', 'Luxury','Element Hotel', '7890123456', 3, 5, '98 Lillian Street, M4S 0A5 Toronto, Canada'),
    (4,'hotel24@gmail.com', 'Vancouver', 'Luxury','St. Regis', '8901234567', 4, 5, '999 Canada Pl, Vancouver, BC, V6C3B5'),

    -- Hotels for IHG Hotels
    (5,'hotel33@gmail.com', 'Montreal', 'Budget','Intercontinental', '7890123456', 3, 5, '1390, boulevard René-Lévesque Ouest, H3G 0E3 Montreal, Canada'),
    (5,'hotel34@gmail.com', 'Vancouver', 'Luxury','Regent', '8901234567', 4, 5, '1300 Robson St, Vancouver, BC, V6E1C5'),
    (5,'hotel35@gmail.com', 'Toronto', 'Mid-Range','Six Senses', '9012345678', 4, 5, '3 Park Home Avenue, North York, M2N 6L3 Toronto, Canada'),
    (5,'hotel36@gmail.com', 'Toronto', 'Budget','Hotel Inn', '0123456789', 3, 5, '291 Glenforest Road, North York, M4N 2A5 Toronto, Canada'),
    (5,'hotel37@gmail.com', 'Montreal', 'Luxury','Hotel Indigo', '1234567890', 5, 5, '110 Rue Sainte-Thérèse Floor 2, H2Y 1E6 Montreal, Canada'),
    (5,'hotel38@gmail.com', 'Montreal', 'Budget','Hotel Inne Express', '2345678901', 4, 5, 'Avenue Cedar 1725, H3G 1A5 Montreal, Canada'),
    (5,'hotel39@gmail.com', 'Montreal', 'Mid-Range','Vignette', '3456789012', 3, 5, '1240 Place Phillips, H3B 3H4 Montreal, Canada'),
    (5,'hotel40@gmail.com', 'Toronto', 'Mid-Range','Crowne Plaza', '4567890123', 4, 5, '3 Park Home Avenue, North York, M2N 6L3 Toronto, Canada');

-- ----------------------------
-- Records of hotel rooms
-- ----------------------------
INSERT INTO Room (HotelID, Price, Capacity, Amenities, RoomView, RoomExtension, Damages, RoomNumber)
VALUES
	(1, 100.00, 2, 'Free Wi-Fi, Ensuite Bathroom, Air Conditioning', 'Sea view', FALSE, 'No damages', 101),
    (1, 120.00, 4, 'Room Service, City View Balcony, Minibar', 'City view', TRUE, 'Minor damages', 102),
    (1, 80.00, 1, 'Mountain Access, Heating, Daily Housekeeping', 'Mountain view', FALSE, 'No damages', 201),
    (1, 150.00, 3, 'Oceanfront Balcony, Hot Tub, Premium Bedding', 'Ocean view', TRUE, 'Minor damages', 202),
    (1, 200.00, 2, 'Private Pool, Sun Loungers, Pool Bar', 'Pool view', FALSE, 'No damages', 301),
    (2, 100.00, 2, 'Wifi, Breakfast', 'Sea view', FALSE, 'No damages', 101),
    (2, 120.00, 4, 'In-room Safe, Wifi', 'City view', TRUE, 'Minor damages', 102),
    (2, 80.00, 1, 'Breakfast, Sun Deck', 'Mountain view', FALSE, 'No damages', 201),
    (2, 150.00, 3, 'Pool, Sun Deck', 'Ocean view', TRUE, 'Minor damages', 202),
    (2, 200.00, 2, 'Pool, Gym, Wifi', 'Pool view', FALSE, 'No damages', 301),

    (3, 100.00, 2, 'Wifi, Breakfast', 'Sea view', FALSE, 'No damages', 101),
    (3, 120.00, 4, 'In-room Safe, Pool', 'City view', TRUE, 'Minor damages', 102),
    (3, 80.00, 1, 'Gym, Wifi', 'Mountain view', FALSE, 'No damages', 201),
    (3, 150.00, 3, 'Sun Deck, Breakfast', 'Ocean view', TRUE, 'Minor damages', 202),
    (3, 200.00, 2, 'Pool, In-room Safe', 'Pool view', FALSE, 'No damages', 301),

    (4, 100.00, 2, 'Wifi, Sun Deck', 'Sea view', FALSE, 'No damages', 101),
    (4, 120.00, 4, 'Breakfast, Gym', 'City view', TRUE, 'Minor damages', 102),
    (4, 80.00, 1, 'In-room Safe, Pool', 'Mountain view', FALSE, 'No damages', 201),
    (4, 150.00, 3, 'Wifi, Breakfast', 'Ocean view', TRUE, 'Minor damages', 202),
    (4, 200.00, 2, 'Gym, Sun Deck', 'Pool view', FALSE, 'No damages', 301),

    (5, 100.00, 2, 'Breakfast, Wifi', 'Sea view', FALSE, 'No damages', 101),
    (5, 120.00, 4, 'In-room Safe, Sun Deck', 'City view', TRUE, 'Minor damages', 102),
    (5, 80.00, 1, 'Pool, Gym', 'Mountain view', FALSE, 'No damages', 201),
    (5, 150.00, 3, 'Breakfast, Wifi', 'Ocean view', TRUE, 'Minor damages', 202),
    (5, 200.00, 2, 'Pool, In-room Safe', 'Pool view', FALSE, 'No damages', 301),

    (6, 105.00, 2, 'Sun Deck, Wifi', 'Garden view', FALSE, 'No damages', 101),
    (6, 125.00, 4, 'Gym, Breakfast', 'Street view', TRUE, 'No damages', 102),
    (6, 85.00, 1, 'In-room Safe, Pool', 'Courtyard view', FALSE, 'No damages', 201),
    (6, 155.00, 3, 'Wifi, Sun Deck', 'Skyline view', TRUE, 'Minor damages', 202),
    (6, 205.00, 2, 'Gym, Breakfast', 'Lake view', FALSE, 'No damages', 301),

    (7, 110.00, 2, 'Pool, Wifi', 'Park view', FALSE, 'No damages', 101),
    (7, 130.00, 4, 'Breakfast, Gym', 'River view', TRUE, 'No damages', 102),
    (7, 90.00, 1, 'In-room Safe, Sun Deck', 'City skyline', FALSE, 'No damages', 201),
    (7, 160.00, 3, 'Wifi, Pool', 'Beach view', TRUE, 'Minor damages', 202),
    (7, 210.00, 2, 'Gym, Breakfast', 'Forest view', FALSE, 'No damages', 301),

    (8, 115.00, 2, 'Sun Deck, In-room Safe', 'Plaza view', FALSE, 'No damages', 101),
    (8, 135.00, 4, 'Gym, Wifi', 'Canyon view', TRUE, 'No damages', 102),
    (8, 95.00, 1, 'Pool, Breakfast', 'Vineyard view', FALSE, 'No damages', 201),
    (8, 165.00, 3, 'Wifi, Gym', 'Historic site view', TRUE, 'Minor damages', 202),
    (8, 215.00, 2, 'Breakfast, Sun Deck', 'Waterfront view', FALSE, 'No damages', 301),
    (9, 120.00, 2, 'Breakfast', 'Rooftop view', FALSE, 'No damages', 101),
    (9, 140.00, 4, 'Wifi, Gym', 'Alley view', TRUE, 'No damages', 102),
    (9, 100.00, 1, 'In-room Safe', 'Monument view', FALSE, 'No damages', 201),
    (9, 170.00, 3, 'Sun Deck, Pool', 'Harbor view', TRUE, 'Minor damages', 202),
    (9, 220.00, 2, 'Gym, Wifi', 'Island view', FALSE, 'No damages', 301),

    (10, 125.00, 2, 'Pool', 'Desert view', FALSE, 'No damages', 101),
    (10, 145.00, 4, 'Breakfast, In-room Safe', 'Jungle view', TRUE, 'No damages', 102),
    (10, 105.00, 1, 'Wifi', 'Arena view', FALSE, 'No damages', 201),
    (10, 175.00, 3, 'Sun Deck', 'Stadium view', TRUE, 'Minor damages', 202),
    (10, 225.00, 2, 'Gym, Pool', 'Boardwalk view', FALSE, 'No damages', 301),

    (11, 100.00, 2, 'In-room Safe, Breakfast', 'Sea view', FALSE, 'No damages', 101),
    (11, 120.00, 4, 'Gym', 'City view', TRUE, 'Minor damages', 102),
    (11, 80.00, 1, 'Sun Deck, Wifi', 'Mountain view', FALSE, 'No damages', 201),
    (11, 150.00, 3, 'Pool', 'Ocean view', TRUE, 'Minor damages', 202),
    (11, 200.00, 2, 'Breakfast, Gym', 'Pool view', FALSE, 'No damages', 301),

    (12, 100.00, 2, 'Wifi, Pool', 'Sea view', FALSE, 'No damages', 101),
    (12, 120.00, 4, 'In-room Safe', 'City view', TRUE, 'Minor damages', 102),
    (12, 80.00, 1, 'Breakfast', 'Mountain view', FALSE, 'No damages', 201),
    (12, 150.00, 3, 'Sun Deck, Gym', 'Ocean view', TRUE, 'Minor damages', 202),
    (12, 200.00, 2, 'Wifi', 'Pool view', FALSE, 'No damages', 301),

    (13, 100.00, 2, 'Gym, Sun Deck', 'Sea view', FALSE, 'No damages', 101),
    (13, 120.00, 4, 'Pool, Breakfast', 'City view', TRUE, 'Minor damages', 102),
    (13, 80.00, 1, 'In-room Safe, Wifi', 'Mountain view', FALSE, 'No damages', 201),
    (13, 150.00, 3, 'Breakfast', 'Ocean view', TRUE, 'Minor damages', 202),
    (13, 200.00, 2, 'Sun Deck, Gym', 'Pool view', FALSE, 'No damages', 301),

    (14, 100.00, 2, 'Pool', 'Sea view', FALSE, 'No damages', 101),
    (14, 120.00, 4, 'Wifi', 'City view', TRUE, 'Minor damages', 102),
    (14, 80.00, 1, 'Breakfast, In-room Safe', 'Mountain view', FALSE, 'No damages', 201),
    (14, 150.00, 3, 'Gym, Sun Deck', 'Ocean view', TRUE, 'Minor damages', 202),
    (14, 200.00, 2, 'Pool, Breakfast', 'Pool view', FALSE, 'No damages', 301),

    (15, 100.00, 2, 'In-room Safe', 'Sea view', FALSE, 'No damages', 101),
    (15, 120.00, 4, 'Sun Deck, Wifi', 'City view', TRUE, 'Minor damages', 102),
    (15, 80.00, 1, 'Gym', 'Mountain view', FALSE, 'No damages', 201),
    (15, 150.00, 3, 'Pool', 'Ocean view', TRUE, 'Minor damages', 202),
    (15, 200.00, 2, 'Breakfast, In-room Safe', 'Pool view', FALSE, 'No damages', 301),

    (16, 105.00, 2, 'Wifi, Gym', 'Garden view', FALSE, 'No damages', 101),
    (16, 125.00, 4, 'Pool, Sun Deck', 'Street view', TRUE, 'No damages', 102),
    (16, 85.00, 1, 'Breakfast', 'Courtyard view', FALSE, 'No damages', 201),
    (16, 155.00, 3, 'In-room Safe', 'Skyline view', TRUE, 'Minor damages', 202),
    (16, 205.00, 2, 'Gym, Wifi', 'Lake view', FALSE, 'No damages', 301),

    (17, 110.00, 2, 'Sun Deck, Pool', 'Park view', FALSE, 'No damages', 101),
    (17, 130.00, 4, 'Wifi', 'River view', TRUE, 'No damages', 102),
    (17, 90.00, 1, 'Gym, Breakfast', 'City skyline', FALSE, 'No damages', 201),
    (17, 160.00, 3, 'In-room Safe', 'Beach view', TRUE, 'Minor damages', 202),
    (17, 210.00, 2, 'Sun Deck, Wifi', 'Forest view', FALSE, 'No damages', 301),

    (18, 115.00, 2, 'Breakfast, Pool', 'Plaza view', FALSE, 'No damages', 101),
    (18, 135.00, 4, 'In-room Safe, Gym', 'Canyon view', TRUE, 'No damages', 102),
    (18, 95.00, 1, 'Sun Deck', 'Vineyard view', FALSE, 'No damages', 201),
    (18, 165.00, 3, 'Wifi, Breakfast', 'Historic site view', TRUE, 'Minor damages', 202),
    (18, 215.00, 2, 'Pool, In-room Safe', 'Waterfront view', FALSE, 'No damages', 301),
    (19, 120.00, 2, 'Gym', 'Rooftop view', FALSE, 'No damages', 101),
    (19, 140.00, 4, 'Wifi, Breakfast', 'Alley view', TRUE, 'No damages', 102),
    (19, 100.00, 1, 'In-room Safe', 'Monument view', FALSE, 'No damages', 201),
    (19, 170.00, 3, 'Pool, Sun Deck', 'Harbor view', TRUE, 'Minor damages', 202),
    (19, 220.00, 2, 'Gym, Wifi', 'Island view', FALSE, 'No damages', 301),

    (20, 125.00, 2, 'Pool', 'Desert view', FALSE, 'No damages', 101),
    (20, 145.00, 4, 'Breakfast, In-room Safe', 'Jungle view', TRUE, 'No damages', 102),
    (20, 105.00, 1, 'Wifi', 'Arena view', FALSE, 'No damages', 201),
    (20, 175.00, 3, 'Sun Deck', 'Stadium view', TRUE, 'Minor damages', 202),
    (20, 225.00, 2, 'Gym, Pool', 'Boardwalk view', FALSE, 'No damages', 301),

    (21, 100.00, 2, 'In-room Safe, Breakfast', 'Sea view', FALSE, 'No damages', 101),
    (21, 120.00, 4, 'Gym', 'City view', TRUE, 'Minor damages', 102),
    (21, 80.00, 1, 'Sun Deck, Wifi', 'Mountain view', FALSE, 'No damages', 201),
    (21, 150.00, 3, 'Pool', 'Ocean view', TRUE, 'Minor damages', 202),
    (21, 200.00, 2, 'Breakfast, Gym', 'Pool view', FALSE, 'No damages', 301),

    (22, 100.00, 2, 'Wifi, Pool', 'Sea view', FALSE, 'No damages', 101),
    (22, 120.00, 4, 'In-room Safe', 'City view', TRUE, 'Minor damages', 102),
    (22, 80.00, 1, 'Breakfast', 'Mountain view', FALSE, 'No damages', 201),
    (22, 150.00, 3, 'Sun Deck, Gym', 'Ocean view', TRUE, 'Minor damages', 202),
    (22, 200.00, 2, 'Wifi', 'Pool view', FALSE, 'No damages', 301),

    (23, 100.00, 2, 'Gym, Sun Deck', 'Sea view', FALSE, 'No damages', 101),
    (23, 120.00, 4, 'Pool, Breakfast', 'City view', TRUE, 'Minor damages', 102),
    (23, 80.00, 1, 'In-room Safe, Wifi', 'Mountain view', FALSE, 'No damages', 201),
    (23, 150.00, 3, 'Breakfast', 'Ocean view', TRUE, 'Minor damages', 202),
    (23, 200.00, 2, 'Sun Deck, Gym', 'Pool view', FALSE, 'No damages', 301),

    (24, 100.00, 2, 'Pool', 'Sea view', FALSE, 'No damages', 101),
    (24, 120.00, 4, 'Wifi', 'City view', TRUE, 'Minor damages', 102),
    (24, 80.00, 1, 'Breakfast, In-room Safe', 'Mountain view', FALSE, 'No damages', 201),
    (24, 150.00, 3, 'Gym, Sun Deck', 'Ocean view', TRUE, 'Minor damages', 202),
    (24, 200.00, 2, 'Pool, Breakfast', 'Pool view', FALSE, 'No damages', 301),

    (25, 100.00, 2, 'In-room Safe', 'Sea view', FALSE, 'No damages', 101),
    (25, 120.00, 4, 'Sun Deck, Wifi', 'City view', TRUE, 'Minor damages', 102),
    (25, 80.00, 1, 'Gym', 'Mountain view', FALSE, 'No damages', 201),
    (25, 150.00, 3, 'Pool', 'Ocean view', TRUE, 'Minor damages', 202),
    (25, 200.00, 2, 'Breakfast, In-room Safe', 'Pool view', FALSE, 'No damages', 301),

    (26, 105.00, 2, 'Wifi, Gym', 'Garden view', FALSE, 'No damages', 101),
    (26, 125.00, 4, 'Pool, Sun Deck', 'Street view', TRUE, 'No damages', 102),
    (26, 85.00, 1, 'Breakfast', 'Courtyard view', FALSE, 'No damages', 201),
    (26, 155.00, 3, 'In-room Safe', 'Skyline view', TRUE, 'Minor damages', 202),
    (26, 205.00, 2, 'Gym, Wifi', 'Lake view', FALSE, 'No damages', 301),

    (27, 110.00, 2, 'Sun Deck, Pool', 'Park view', FALSE, 'No damages', 101),
    (27, 130.00, 4, 'Wifi', 'River view', TRUE, 'No damages', 102),
    (27, 90.00, 1, 'Gym, Breakfast', 'City skyline', FALSE, 'No damages', 201),
    (27, 160.00, 3, 'In-room Safe', 'Beach view', TRUE, 'Minor damages', 202),
    (27, 210.00, 2, 'Sun Deck, Wifi', 'Forest view', FALSE, 'No damages', 301),

    (28, 115.00, 2, 'Breakfast, Pool', 'Plaza view', FALSE, 'No damages', 101),
    (28, 135.00, 4, 'In-room Safe, Gym', 'Canyon view', TRUE, 'No damages', 102),
    (28, 95.00, 1, 'Sun Deck', 'Vineyard view', FALSE, 'No damages', 201),
    (28, 165.00, 3, 'Wifi, Breakfast', 'Historic site view', TRUE, 'Minor damages', 202),
    (28, 215.00, 2, 'Pool, In-room Safe', 'Waterfront view', FALSE, 'No damages', 301),

    (29, 120.00, 2, 'Gym', 'Rooftop view', FALSE, 'No damages', 101),
    (29, 140.00, 4, 'Wifi, Breakfast', 'Alley view', TRUE, 'No damages', 102),
    (29, 100.00, 1, 'In-room Safe', 'Monument view', FALSE, 'No damages', 201),
    (29, 170.00, 3, 'Pool, Sun Deck', 'Harbor view', TRUE, 'Minor damages', 202),
    (29, 220.00, 2, 'Gym, Wifi', 'Island view', FALSE, 'No damages', 301),

    (30, 125.00, 2, 'Pool', 'Desert view', FALSE, 'No damages', 101),
    (30, 145.00, 4, 'Breakfast, In-room Safe', 'Jungle view', TRUE, 'No damages', 102),
    (30, 105.00, 1, 'Wifi', 'Arena view', FALSE, 'No damages', 201),
    (30, 175.00, 3, 'Sun Deck', 'Stadium view', TRUE, 'Minor damages', 202),
    (30, 225.00, 2, 'Gym, Pool', 'Boardwalk view', FALSE, 'No damages', 301),

    (31, 100.00, 2, 'In-room Safe, Breakfast', 'Sea view', FALSE, 'No damages', 101),
    (31, 120.00, 4, 'Gym', 'City view', TRUE, 'Minor damages', 102),
    (31, 80.00, 1, 'Sun Deck, Wifi', 'Mountain view', FALSE, 'No damages', 201),
    (31, 150.00, 3, 'Pool', 'Ocean view', TRUE, 'Minor damages', 202),
    (31, 200.00, 2, 'Breakfast, Gym', 'Pool view', FALSE, 'No damages', 301),

    (32, 100.00, 2, 'Wifi, Pool', 'Sea view', FALSE, 'No damages', 101),
    (32, 120.00, 4, 'In-room Safe', 'City view', TRUE, 'Minor damages', 102),
    (32, 80.00, 1, 'Breakfast', 'Mountain view', FALSE, 'No damages', 201),
    (32, 150.00, 3, 'Sun Deck, Gym', 'Ocean view', TRUE, 'Minor damages', 202),
    (32, 200.00, 2, 'Wifi', 'Pool view', FALSE, 'No damages', 301),

    (33, 100.00, 2, 'Gym, Sun Deck', 'Sea view', FALSE, 'No damages', 101),
    (33, 120.00, 4, 'Pool, Breakfast', 'City view', TRUE, 'Minor damages', 102),
    (33, 80.00, 1, 'In-room Safe, Wifi', 'Mountain view', FALSE, 'No damages', 201),
    (33, 150.00, 3, 'Breakfast', 'Ocean view', TRUE, 'Minor damages', 202),
    (33, 200.00, 2, 'Sun Deck, Gym', 'Pool view', FALSE, 'No damages', 301),

    (34, 100.00, 2, 'Pool', 'Sea view', FALSE, 'No damages', 101),
    (34, 120.00, 4, 'Wifi', 'City view', TRUE, 'Minor damages', 102),
    (34, 80.00, 1, 'Breakfast, In-room Safe', 'Mountain view', FALSE, 'No damages', 201),
    (34, 150.00, 3, 'Gym, Sun Deck', 'Ocean view', TRUE, 'Minor damages', 202),
    (34, 200.00, 2, 'Pool, Breakfast', 'Pool view', FALSE, 'No damages', 301),

    (35, 100.00, 2, 'In-room Safe', 'Sea view', FALSE, 'No damages', 101),
    (35, 120.00, 4, 'Sun Deck, Wifi', 'City view', TRUE, 'Minor damages', 102),
    (35, 80.00, 1, 'Gym', 'Mountain view', FALSE, 'No damages', 201),
    (35, 150.00, 3, 'Pool', 'Ocean view', TRUE, 'Minor damages', 202),
    (35, 200.00, 2, 'Breakfast, In-room Safe', 'Pool view', FALSE, 'No damages', 301),

    (36, 105.00, 2, 'Wifi, Gym', 'Garden view', FALSE, 'No damages', 101),
    (36, 125.00, 4, 'Pool, Sun Deck', 'Street view', TRUE, 'No damages', 102),
    (36, 85.00, 1, 'Breakfast', 'Courtyard view', FALSE, 'No damages', 201),
    (36, 155.00, 3, 'In-room Safe', 'Skyline view', TRUE, 'Minor damages', 202),
    (36, 205.00, 2, 'Gym, Wifi', 'Lake view', FALSE, 'No damages', 301),

    (37, 110.00, 2, 'Sun Deck, Pool', 'Park view', FALSE, 'No damages', 101),
    (37, 130.00, 4, 'Wifi', 'River view', TRUE, 'No damages', 102),
    (37, 90.00, 1, 'Gym, Breakfast', 'City skyline', FALSE, 'No damages', 201),
    (37, 160.00, 3, 'In-room Safe', 'Beach view', TRUE, 'Minor damages', 202),
    (37, 210.00, 2, 'Sun Deck, Wifi', 'Forest view', FALSE, 'No damages', 301),

    (38, 115.00, 2, 'Breakfast, Pool', 'Plaza view', FALSE, 'No damages', 101),
    (38, 135.00, 4, 'In-room Safe, Gym', 'Canyon view', TRUE, 'No damages', 102),
    (38, 95.00, 1, 'Sun Deck', 'Vineyard view', FALSE, 'No damages', 201),
    (38, 165.00, 3, 'Wifi, Breakfast', 'Historic site view', TRUE, 'Minor damages', 202),
    (38, 215.00, 2, 'Pool, In-room Safe', 'Waterfront view', FALSE, 'No damages', 301),

    (39, 120.00, 2, 'Gym', 'Rooftop view', FALSE, 'No damages', 101),
    (39, 140.00, 4, 'Wifi, Breakfast', 'Alley view', TRUE, 'No damages', 102),
    (39, 100.00, 1, 'In-room Safe', 'Monument view', FALSE, 'No damages', 201),
    (39, 170.00, 3, 'Pool, Sun Deck', 'Harbor view', TRUE, 'Minor damages', 202),
    (39, 220.00, 2, 'Gym, Wifi', 'Island view', FALSE, 'No damages', 301),

    (40, 125.00, 2, 'Pool', 'Desert view', FALSE, 'No damages', 101),
    (40, 145.00, 4, 'Breakfast, In-room Safe', 'Jungle view', TRUE, 'No damages', 102),
    (40, 105.00, 1, 'Wifi', 'Arena view', FALSE, 'No damages', 201),
    (40, 175.00, 3, 'Sun Deck', 'Stadium view', TRUE, 'Minor damages', 202),
    (40, 225.00, 2, 'Gym, Pool', 'Boardwalk view', FALSE, 'No damages', 301);
-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO customer (CustomerUsername, CustomerPassword, DateOfRegistration, Address, FullName, IDPresented, CustomerEmail) 
VALUES 
('john_doe', 'password123', '2023-01-15', '123 Main St, Anytown, USA', 'John Doe', '1234567890', 'john.doe@example.com'),
('jane_smith', 'qwerty456', '2023-02-20', '456 Elm St, Othertown, USA', 'Jane Smith', '0987654321', 'jane.smith@example.com'),
('bob_jones', 'pass1234', '2023-03-25', '789 Oak St, Anycity, USA', 'Bob Jones', '2468101214', 'bob.jones@example.com'),
('alice_davis', 'abcd7890', '2023-04-30', '101 Pine St, Somecity, USA', 'Alice Davis', '1357924680', 'alice.davis@example.com');

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO booking (CustomerID, HotelID, RoomID, PricePaid, CheckIn, CheckOut)
VALUES
    (1, 1, 1, 150.00, '2024-04-01', '2024-04-05'),
    (2, 2, 2, 200.00, '2024-05-10', '2024-05-15'),
    (3, 3, 3, 180.00, '2024-06-20', '2024-06-25'),
    (3, 4, 4, 250.00, '2024-07-15', '2024-07-20'),
    (3, 5, 5, 5000.00, '2024-08-10', '2024-08-30'),

    (1, 6, 1, 150.00, '2024-04-01', '2024-04-05'),
    (2, 7, 2, 200.00, '2024-05-10', '2024-05-15'),
    (3, 8, 3, 180.00, '2024-06-20', '2024-06-25'),
    (3, 9, 4, 250.00, '2024-07-15', '2024-07-20'),
    (3, 10, 5, 5000.00, '2024-08-10', '2024-08-30'),

    (1, 11, 1, 150.00, '2024-04-01', '2024-04-05'),
    (2, 12, 2, 200.00, '2024-05-10', '2024-05-15'),
    (3, 13, 3, 180.00, '2024-06-20', '2024-06-25'),
    (3, 14, 4, 250.00, '2024-07-15', '2024-07-20'),
    (3, 15, 5, 5000.00, '2024-08-10', '2024-08-30');
-- ----------------------------
-- Records of renting
-- ----------------------------
INSERT INTO renting (CustomerID, RoomID, CheckIn, CheckOut)
VALUES
    (1, 1, '2024-04-01', '2024-04-07'),
    (2, 2, '2024-04-02', '2024-04-08'),
    (3, 3, '2024-04-03', '2024-04-09');


-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO employee (HotelID, Address, FullName, EmployeeNumber, Role) 
VALUES 
(1,'123 Main St, Anytown, USA', 'John Doe', '12345', 'manager'),
(2, '456 Elm St, Othertown, USA', 'Jane Smith', '54321', 'janitor'),
(3, '789 Oak St, Anycity, USA', 'Bob Jones', '13453', 'receptionist'),
(4, '101 Pine St, Somecity, USA', 'Alice Davis', '14789', 'concierge');

-- ----------------------------
-- Test queries
-- ----------------------------

	
-- -----------------------------------------
-- Queries for TA to use
-- -----------------------------------------

-- ----------------------------
-- Queries to create the views
-- ----------------------------
---> NumberAvailableRooms (view 1)
SELECT hotelarea, sum(numberofrooms) AS totalrooms FROM hotel WHERE hotelarea::text = 'Montreal'::text OR hotelarea::text = 'Toronto'::text OR hotelarea::text = 'Vancouver'::text GROUP BY hotelarea;
---> AggregatedCapacity view (view 2)
SELECT h.hotelid, h.hotelname, sum(r.capacity) AS totalcapacity FROM hotel h JOIN room r ON h.hotelid = r.hotelid GROUP BY h.hotelid, h.hotelname;

-- ----------------------------
-- Indexing queries
-- ----------------------------
---> Creating an single column index on HotelCategory (single-column index)
---> For our web-app, we use frequently query hotelcategory, which is why we created a single column index for it.
CREATE INDEX idx_hotel_category ON hotel (HotelCategory);

---> Creating an multi column index on the Hotel to make my join sql statements found in our java code (method getHotelName() in BookingService class) more efficient.
CREATE INDEX idx_hotelchainid_hotelid ON hotel (HotelChainID, HotelID);

---> Creating a single column index on the booking table for the roomid column. 
---> We have many queries that search for RoomID therefore having this index will make searching more efficient. 
CREATE INDEX idx_booking_room_id ON booking (RoomID);

-- ----------------------------
-- 2 triggers 
-- ----------------------------
CREATE TRIGGER booking_delete_trigger
BEFORE DELETE ON booking
FOR EACH ROW
EXECUTE FUNCTION archive_booking();

CREATE TRIGGER renting_delete_trigger
BEFORE DELETE ON renting
FOR EACH ROW
EXECUTE FUNCTION archive_renting();


