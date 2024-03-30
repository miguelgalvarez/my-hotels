-- ----------------------------
-- Table structure for entities
-- ----------------------------
DROP TABLE IF EXISTS hotelchain;
CREATE TABLE hotelchain (
	HotelChainID serial PRIMARY KEY,
	HotelChainName varchar(45) NOT NULL,
	HotelChainAddress varchar(45) NOT NULL,
	PhoneNumber BIGINT NOT NULL,
	NumberOfHotels INT NOT NULL,
	HotelChainEmail varchar(100) NOT NULL CHECK (HotelChainEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
	HotelID serial PRIMARY KEY,
	HotelChainID INT REFERENCES hotelchain(HotelChainID),
	HotelPhoneNumber BIGINT NOT NULL,
	Address varchar(45) NOT NULL,
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
	Address varchar(45) NOT NULL,
	FullName varchar(45) NOT NULL,
	IDPresented varchar(45) NOT NULL,
	CustomerEmail varchar(100) NOT NULL CHECK (CustomerEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	EmployeeID serial PRIMARY KEY,
	HotelID serial REFERENCES hotel(HotelID),
	Address varchar(45) NOT NULL,
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
    ('White Lotus', '1234567890', 8, 'chain1@gmail.com','33 Palisade St'),
    ('HolidayInn', '1234567890', 9, 'chain1@gmail.com','34 Palisade St'),
    ('HolidayInn', '1234567890', 10, 'chain1@gmail.com','35 Palisade St'),
    ('HolidayInn', '1234567890', 11, 'chain1@gmail.com','36 Palisade St'),
    ('HolidayInn', '1234567890', 12, 'chain1@gmail.com','37 Palisade St');
	
-- ----------------------------
-- Records of hotel rooms
-- ----------------------------
INSERT INTO Room (HotelID, Price, Capacity, Amenities, RoomView, RoomExtension, Damages, RoomNumber)
VALUES
	(1, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (1, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (1, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (1, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (1, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (2, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (2, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (2, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (2, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (2, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (3, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (3, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (3, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (3, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (3, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (4, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (4, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (4, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (4, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (4, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (5, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (5, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (5, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (5, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (5, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),
	
	(6, 105.00, 2, 'Amenities 6', 'Garden view', FALSE, 'No damages', 101),
	(6, 125.00, 4, 'Amenities 7', 'Street view', TRUE, 'No damages', 102),
	(6, 85.00, 1, 'Amenities 8', 'Courtyard view', FALSE, 'No damages', 201),
	(6, 155.00, 3, 'Amenities 9', 'Skyline view', TRUE, 'Minor damages', 202),
	(6, 205.00, 2, 'Amenities 10', 'Lake view', FALSE, 'No damages', 301),
	
	(7, 110.00, 2, 'Amenities 6', 'Park view', FALSE, 'No damages', 101),
	(7, 130.00, 4, 'Amenities 7', 'River view', TRUE, 'No damages', 102),
	(7, 90.00, 1, 'Amenities 8', 'City skyline', FALSE, 'No damages', 201),
	(7, 160.00, 3, 'Amenities 9', 'Beach view', TRUE, 'Minor damages', 202),
	(7, 210.00, 2, 'Amenities 10', 'Forest view', FALSE, 'No damages', 301),
	
	(8, 115.00, 2, 'Amenities 11', 'Plaza view', FALSE, 'No damages', 101),
	(8, 135.00, 4, 'Amenities 12', 'Canyon view', TRUE, 'No damages', 102),
	(8, 95.00, 1, 'Amenities 13', 'Vineyard view', FALSE, 'No damages', 201),
	(8, 165.00, 3, 'Amenities 14', 'Historic site view', TRUE, 'Minor damages', 202),
	(8, 215.00, 2, 'Amenities 15', 'Waterfront view', FALSE, 'No damages', 301),
	
	(9, 120.00, 2, 'Amenities 11', 'Rooftop view', FALSE, 'No damages', 101),
	(9, 140.00, 4, 'Amenities 12', 'Alley view', TRUE, 'No damages', 102),
	(9, 100.00, 1, 'Amenities 13', 'Monument view', FALSE, 'No damages', 201),
	(9, 170.00, 3, 'Amenities 14', 'Harbor view', TRUE, 'Minor damages', 202),
	(9, 220.00, 2, 'Amenities 15', 'Island view', FALSE, 'No damages', 301),
	
	(10, 125.00, 2, 'Amenities 16', 'Desert view', FALSE, 'No damages', 101),
	(10, 145.00, 4, 'Amenities 17', 'Jungle view', TRUE, 'No damages', 102),
	(10, 105.00, 1, 'Amenities 18', 'Arena view', FALSE, 'No damages', 201),
	(10, 175.00, 3, 'Amenities 19', 'Stadium view', TRUE, 'Minor damages', 202),
	(10, 225.00, 2, 'Amenities 20', 'Boardwalk view', FALSE, 'No damages', 301),

    (11, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (11, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (11, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (11, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (11, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (12, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (12, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (12, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (12, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (12, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (13, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (13, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (13, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (13, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (13, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (14, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (14, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (14, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (14, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (14, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (15, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (15, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (15, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (15, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (15, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),
	
	(16, 105.00, 2, 'Amenities 6', 'Garden view', FALSE, 'No damages', 101),
	(16, 125.00, 4, 'Amenities 7', 'Street view', TRUE, 'No damages', 102),
	(16, 85.00, 1, 'Amenities 8', 'Courtyard view', FALSE, 'No damages', 201),
	(16, 155.00, 3, 'Amenities 9', 'Skyline view', TRUE, 'Minor damages', 202),
	(16, 205.00, 2, 'Amenities 10', 'Lake view', FALSE, 'No damages', 301),
	
	(17, 110.00, 2, 'Amenities 6', 'Park view', FALSE, 'No damages', 101),
	(17, 130.00, 4, 'Amenities 7', 'River view', TRUE, 'No damages', 102),
	(17, 90.00, 1, 'Amenities 8', 'City skyline', FALSE, 'No damages', 201),
	(17, 160.00, 3, 'Amenities 9', 'Beach view', TRUE, 'Minor damages', 202),
	(17, 210.00, 2, 'Amenities 10', 'Forest view', FALSE, 'No damages', 301),
	
	(18, 115.00, 2, 'Amenities 11', 'Plaza view', FALSE, 'No damages', 101),
	(18, 135.00, 4, 'Amenities 12', 'Canyon view', TRUE, 'No damages', 102),
	(18, 95.00, 1, 'Amenities 13', 'Vineyard view', FALSE, 'No damages', 201),
	(18, 165.00, 3, 'Amenities 14', 'Historic site view', TRUE, 'Minor damages', 202),
	(18, 215.00, 2, 'Amenities 15', 'Waterfront view', FALSE, 'No damages', 301),
	
	(19, 120.00, 2, 'Amenities 11', 'Rooftop view', FALSE, 'No damages', 101),
	(19, 140.00, 4, 'Amenities 12', 'Alley view', TRUE, 'No damages', 102),
	(19, 100.00, 1, 'Amenities 13', 'Monument view', FALSE, 'No damages', 201),
	(19, 170.00, 3, 'Amenities 14', 'Harbor view', TRUE, 'Minor damages', 202),
	(19, 220.00, 2, 'Amenities 15', 'Island view', FALSE, 'No damages', 301),
	
	(20, 125.00, 2, 'Amenities 16', 'Desert view', FALSE, 'No damages', 101),
	(20, 145.00, 4, 'Amenities 17', 'Jungle view', TRUE, 'No damages', 102),
	(20, 105.00, 1, 'Amenities 18', 'Arena view', FALSE, 'No damages', 201),
	(20, 175.00, 3, 'Amenities 19', 'Stadium view', TRUE, 'Minor damages', 202),
	(20, 225.00, 2, 'Amenities 20', 'Boardwalk view', FALSE, 'No damages', 301),

    (21, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (21, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (21, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (21, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (21, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (22, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (22, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (22, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (22, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (22, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (23, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (23, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (23, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (23, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (23, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (24, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (24, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (24, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (24, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (24, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (25, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (25, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (25, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (25, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (25, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),
	
	(26, 105.00, 2, 'Amenities 6', 'Garden view', FALSE, 'No damages', 101),
	(26, 125.00, 4, 'Amenities 7', 'Street view', TRUE, 'No damages', 102),
	(26, 85.00, 1, 'Amenities 8', 'Courtyard view', FALSE, 'No damages', 201),
	(26, 155.00, 3, 'Amenities 9', 'Skyline view', TRUE, 'Minor damages', 202),
	(26, 205.00, 2, 'Amenities 10', 'Lake view', FALSE, 'No damages', 301),
	
	(27, 110.00, 2, 'Amenities 6', 'Park view', FALSE, 'No damages', 101),
	(27, 130.00, 4, 'Amenities 7', 'River view', TRUE, 'No damages', 102),
	(27, 90.00, 1, 'Amenities 8', 'City skyline', FALSE, 'No damages', 201),
	(27, 160.00, 3, 'Amenities 9', 'Beach view', TRUE, 'Minor damages', 202),
	(27, 210.00, 2, 'Amenities 10', 'Forest view', FALSE, 'No damages', 301),
	
	(28, 115.00, 2, 'Amenities 11', 'Plaza view', FALSE, 'No damages', 101),
	(28, 135.00, 4, 'Amenities 12', 'Canyon view', TRUE, 'No damages', 102),
	(28, 95.00, 1, 'Amenities 13', 'Vineyard view', FALSE, 'No damages', 201),
	(28, 165.00, 3, 'Amenities 14', 'Historic site view', TRUE, 'Minor damages', 202),
	(28, 215.00, 2, 'Amenities 15', 'Waterfront view', FALSE, 'No damages', 301),
	
	(29, 120.00, 2, 'Amenities 11', 'Rooftop view', FALSE, 'No damages', 101),
	(29, 140.00, 4, 'Amenities 12', 'Alley view', TRUE, 'No damages', 102),
	(29, 100.00, 1, 'Amenities 13', 'Monument view', FALSE, 'No damages', 201),
	(29, 170.00, 3, 'Amenities 14', 'Harbor view', TRUE, 'Minor damages', 202),
	(29, 220.00, 2, 'Amenities 15', 'Island view', FALSE, 'No damages', 301),
	
	(30, 125.00, 2, 'Amenities 16', 'Desert view', FALSE, 'No damages', 101),
	(30, 145.00, 4, 'Amenities 17', 'Jungle view', TRUE, 'No damages', 102),
	(30, 105.00, 1, 'Amenities 18', 'Arena view', FALSE, 'No damages', 201),
	(30, 175.00, 3, 'Amenities 19', 'Stadium view', TRUE, 'Minor damages', 202),
	(30, 225.00, 2, 'Amenities 20', 'Boardwalk view', FALSE, 'No damages', 301),

	(31, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (31, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (31, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (31, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (31, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (32, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (32, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (32, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (32, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (32, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (33, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (33, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (33, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (33, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (33, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (34, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (34, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (34, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (34, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (34, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),

    (35, 100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (35, 120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),
    (35, 80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (35, 150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),
    (35, 200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),
	
	(36, 105.00, 2, 'Amenities 6', 'Garden view', FALSE, 'No damages', 101),
	(36, 125.00, 4, 'Amenities 7', 'Street view', TRUE, 'No damages', 102),
	(36, 85.00, 1, 'Amenities 8', 'Courtyard view', FALSE, 'No damages', 201),
	(36, 155.00, 3, 'Amenities 9', 'Skyline view', TRUE, 'Minor damages', 202),
	(36, 205.00, 2, 'Amenities 10', 'Lake view', FALSE, 'No damages', 301),
	
	(37, 110.00, 2, 'Amenities 6', 'Park view', FALSE, 'No damages', 101),
	(37, 130.00, 4, 'Amenities 7', 'River view', TRUE, 'No damages', 102),
	(37, 90.00, 1, 'Amenities 8', 'City skyline', FALSE, 'No damages', 201),
	(37, 160.00, 3, 'Amenities 9', 'Beach view', TRUE, 'Minor damages', 202),
	(37, 210.00, 2, 'Amenities 10', 'Forest view', FALSE, 'No damages', 301),
	
	(38, 115.00, 2, 'Amenities 11', 'Plaza view', FALSE, 'No damages', 101),
	(38, 135.00, 4, 'Amenities 12', 'Canyon view', TRUE, 'No damages', 102),
	(38, 95.00, 1, 'Amenities 13', 'Vineyard view', FALSE, 'No damages', 201),
	(38, 165.00, 3, 'Amenities 14', 'Historic site view', TRUE, 'Minor damages', 202),
	(38, 215.00, 2, 'Amenities 15', 'Waterfront view', FALSE, 'No damages', 301),
	
	(39, 120.00, 2, 'Amenities 11', 'Rooftop view', FALSE, 'No damages', 101),
	(39, 140.00, 4, 'Amenities 12', 'Alley view', TRUE, 'No damages', 102),
	(39, 100.00, 1, 'Amenities 13', 'Monument view', FALSE, 'No damages', 201),
	(39, 170.00, 3, 'Amenities 14', 'Harbor view', TRUE, 'Minor damages', 202),
	(39, 220.00, 2, 'Amenities 15', 'Island view', FALSE, 'No damages', 301),
	
	(40, 125.00, 2, 'Amenities 16', 'Desert view', FALSE, 'No damages', 101),
	(40, 145.00, 4, 'Amenities 17', 'Jungle view', TRUE, 'No damages', 102),
	(40, 105.00, 1, 'Amenities 18', 'Arena view', FALSE, 'No damages', 201),
	(40, 175.00, 3, 'Amenities 19', 'Stadium view', TRUE, 'Minor damages', 202),
	(40, 225.00, 2, 'Amenities 20', 'Boardwalk view', FALSE, 'No damages', 301);

-- ----------------------------
-- Records of hotels
-- ----------------------------	
INSERT INTO Hotel (HotelChainID, HotelEmail, HotelArea, HotelCategory, HotelName, HotelPhoneNumber, Rating, NumberOfRooms, Address)
VALUES
	-- Hotels for Chain 1
    (1,'hotel1@gmail.com', 'Montreal', 'Luxury','White Lotus Deluxe', '1234567890', 4, 10, 'Hotel 1 Address'),
    (1,'hotel2@gmail.com', 'Montreal', 'Budget','White Lotus Budget', '2345678901', 3, 15, 'Hotel 2 Address'),
    (1,'hotel3@gmail.com', 'Montreal', 'Luxury','White Lotus Deluxe', '3456789012', 5, 12, 'Hotel 3 Address'),
    (1,'hotel4@gmail.com', 'Montreal', 'Budget','White Lotus Budget', '4567890123', 4, 20, 'Hotel 4 Address'),
    (1,'hotel5@gmail.com', 'Montreal', 'Luxury','White Lotus Luxury', '5678901234', 3, 8, 'Hotel 5 Address'),
    (1,'hotel6@gmail.com', 'Toronto', 'Luxury','White Lotus Luxury', '6789012345', 4, 18, 'Hotel 6 Address'),
    (1,'hotel7@gmail.com', 'Toronto', 'Budget','White Lotus Budget', '7890123456', 5, 10, 'Hotel 7 Address'),
    (1,'hotel8@gmail.com', 'Toronto', 'Luxury','White Lotus Budget', '8901234567', 4, 25, 'Hotel 8 Address'),

    -- Hotels for Chain 2
    (2,'hotel9@gmail.com', 'Toronto', 'Budget','Holiday Inn Budget', '9012345678', 3, 12, 'Hotel 9 Address'),
    (2,'hotel10@gmail.com', 'Vancouver', 'Luxury','Holiday Inn Budget', '0123456789', 4, 22, 'Hotel 10 Address'),
    (2,'hotel11@gmail.com', 'Montreal', 'Luxury','Holiday Inn Deluxe', '1234567890', 4, 10, 'Hotel 11 Address'),
    (2,'hotel12@gmail.com', 'Montreal', 'Budget','Holiday Inn Budget', '2345678901', 3, 15, 'Hotel 12 Address'),
    (2,'hotel13@gmail.com', 'Montreal', 'Luxury','Holiday Inn Deluxe', '3456789012', 5, 12, 'Hotel 13 Address'),
    (2,'hotel14@gmail.com', 'Montreal', 'Budget','Holiday Inn Budget', '4567890123', 4, 20, 'Hotel 14 Address'),
    (2,'hotel15@gmail.com', 'Montreal', 'Luxury','Holiday Inn Luxury', '5678901234', 3, 8, 'Hotel 15 Address'),
    (2,'hotel16@gmail.com', 'Toronto', 'Luxury','Holiday Inn Luxury', '6789012345', 4, 18, 'Hotel 16 Address'),

    -- Hotels for Chain 3
    (3,'hotel17@gmail.com', 'Toronto', 'Budget','Chain 3 Budget', '1234567890', 3, 12, 'Hotel 17 Address'),
    (3,'hotel18@gmail.com', 'Vancouver', 'Luxury','Chain 3 Luxury', '2345678901', 4, 22, 'Hotel 18 Address'),
    (3,'hotel19@gmail.com', 'Montreal', 'Luxury','Chain 3 Deluxe', '3456789012', 4, 10, 'Hotel 19 Address'),
    (3,'hotel20@gmail.com', 'Montreal', 'Budget','Chain 3 Budget', '4567890123', 3, 15, 'Hotel 20 Address'),
    (3,'hotel21@gmail.com', 'Toronto', 'Luxury','Chain 3 Luxury', '5678901234', 5, 12, 'Hotel 21 Address'),
    (3,'hotel22@gmail.com', 'Toronto', 'Budget','Chain 3 Budget', '6789012345', 4, 20, 'Hotel 22 Address'),
    (3,'hotel23@gmail.com', 'Toronto', 'Luxury','Chain 3 Luxury', '7890123456', 3, 8, 'Hotel 23 Address'),
    (3,'hotel24@gmail.com', 'Vancouver', 'Luxury','Chain 3 Luxury', '8901234567', 4, 18, 'Hotel 24 Address'),

    -- Hotels for Chain 4
    (4,'hotel25@gmail.com', 'Vancouver', 'Budget','Chain 4 Budget', '9012345678', 3, 12, 'Hotel 25 Address'),
    (4,'hotel26@gmail.com', 'Vancouver', 'Luxury','Chain 4 Luxury', '0123456789', 4, 22, 'Hotel 26 Address'),
    (4,'hotel27@gmail.com', 'Montreal', 'Luxury','Chain 4 Deluxe', '1234567890', 4, 10, 'Hotel 27 Address'),
    (4,'hotel28@gmail.com', 'Montreal', 'Budget','Chain 4 Budget', '2345678901', 3, 15, 'Hotel 28 Address'),
    (4,'hotel29@gmail.com', 'Toronto', 'Luxury','Chain 4 Luxury', '3456789012', 5, 12, 'Hotel 29 Address'),
    (4,'hotel30@gmail.com', 'Toronto', 'Budget','Chain 4 Budget', '4567890123', 4, 20, 'Hotel 30 Address'),
    (4,'hotel31@gmail.com', 'Toronto', 'Luxury','Chain 4 Luxury', '5678901234', 3, 8, 'Hotel 31 Address'),
    (4,'hotel32@gmail.com', 'Vancouver', 'Luxury','Chain 4 Luxury', '6789012345', 4, 18, 'Hotel 32 Address'),

    -- Hotels for Chain 5
    (5,'hotel33@gmail.com', 'Montreal', 'Budget','Chain 5 Budget', '7890123456', 3, 12, 'Hotel 33 Address'),
    (5,'hotel34@gmail.com', 'Vancouver', 'Luxury','Chain 5 Luxury', '8901234567', 4, 22, 'Hotel 34 Address'),
    (5,'hotel35@gmail.com', 'Toronto', 'Luxury','Chain 5 Deluxe', '9012345678', 4, 10, 'Hotel 35 Address'),
    (5,'hotel36@gmail.com', 'Toronto', 'Budget','Chain 5 Budget', '0123456789', 3, 15, 'Hotel 36 Address'),
    (5,'hotel37@gmail.com', 'Montreal', 'Luxury','Chain 5 Luxury', '1234567890', 5, 12, 'Hotel 37 Address'),
    (5,'hotel38@gmail.com', 'Montreal', 'Budget','Chain 5 Budget', '2345678901', 4, 20, 'Hotel 38 Address'),
    (5,'hotel39@gmail.com', 'Montreal', 'Luxury','Chain 5 Luxury', '3456789012', 3, 8, 'Hotel 39 Address'),
    (5,'hotel40@gmail.com', 'Toronto', 'Luxury','Chain 5 Luxury', '4567890123', 4, 18, 'Hotel 40 Address');

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
    (3, 5, 5, 0, '2024-08-10', '2024-08-15');
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
CREATE INDEX idx_hotel_category ON hotel (HotelCategory);

---> Creating an multi column index on the Hotel to make my join sql statements more efficient
CREATE INDEX idx_hotelchainid_hotelid ON hotel (HotelChainID, HotelID);

---> Creating a single column index on the booking table for the roomid column. 
---> I have many queries that search for RoomID therefore having this index will make searching more efficient. 
CREATE INDEX idx_booking_room_id ON booking (RoomID);
