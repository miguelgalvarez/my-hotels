-- ----------------------------
-- Setting search-path
-- ----------------------------
set search_path = "my-hotels"

-- ----------------------------
-- Table structure for entities
-- ----------------------------
DROP TABLE IF EXISTS hotelchain;
CREATE TABLE hotelchain (
	HotelChainID serial PRIMARY KEY,
	HotelChainAddress varchar(45) NOT NULL,
	PhoneNumber BIGINT NOT NULL,
	NumberOfHotels INT NOT NULL,
	HotelChainEmail varchar(100) NOT NULL CHECK (HotelChainEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
	HotelID serial PRIMARY KEY,
	RoomID INT REFERENCES room(RoomID),
	HotelChainID INT REFERENCES hotelchain(HotelChainID),
	HotelPhoneNumber BIGINT NOT NULL,
	Address varchar(45) NOT NULL,
	NumberOfRooms INT NOT NULL,
	HotelName varchar(45) NOT NULL,
	HotelEmail varchar(100) NOT NULL CHECK (HotelEmail LIKE '_%@_%._%'),
	Rating double precision NOT NULL
);

DROP TABLE IF EXISTS room;
CREATE TABLE room (
	RoomID serial PRIMARY KEY,
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
	Address varchar(45) NOT NULL,
	FullName varchar(45) NOT NULL,
	IDPresented varchar(45) NOT NULL,
	Capacity INT NOT NULL,
	NumberOfRooms INT NOT NULL,
	CustomerEmail varchar(100) NOT NULL CHECK (CustomerEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	EmployeeID serial PRIMARY KEY,
	HotelID serial REFERENCES hotel(HotelID),
	Address varchar(45) NOT NULL,
	FullName varchar(45) NOT NULL,
	SSN BIGINT NOT NULL,
	Role varchar(45) NOT NULL,
	NumberOfRooms BIGINT NOT NULL
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
	BookingID serial PRIMARY KEY,
	CustomerID INT REFERENCES customer(CustomerID),
	PricePaid double precision NOT NULL,
	CheckIn date NOT NULL,
	CheckOut date NOT NULL,
	NumberOfRooms INT NOT NULL
);

DROP TABLE IF EXISTS renting;
CREATE TABLE renting (
	RentingID serial PRIMARY KEY,
	CustomerID INT REFERENCES customer(CustomerID),
	RoomID INT REFERENCES room(RoomID),
	Period varchar(45) NOT NULL,
	NumberOfRooms INT NOT NULL
);

-- ----------------------------
-- Records of hotel chains
-- ----------------------------
INSERT INTO hotelchain (PhoneNumber, NumberOfHotels, HotelChainEmail, HotelChainAddress)
VALUES
    ('1234567890', 8, 'chain1@gmail.com','33 Palisade St'),
    ('2345678901', 9, 'chain1@gmail.com','33 Palisade St'),
    ('3456789012', 10, 'chain1@gmail.com','33 Palisade St'),
    ('4567890123', 11, 'chain1@gmail.com','33 Palisade St'),
    ('5678901234', 12, 'chain1@gmail.com','33 Palisade St');
	
-- ----------------------------
-- Records of hotel rooms
-- ----------------------------
INSERT INTO Room (Price, Capacity, Amenities, RoomView, RoomExtension, Damages, RoomNumber)
VALUES
    (100.00, 2, 'Amenities 1', 'Sea view', FALSE, 'No damages', 101),
    (120.00, 4, 'Amenities 2', 'City view', TRUE, 'Minor damages', 102),

    (80.00, 1, 'Amenities 3', 'Mountain view', FALSE, 'No damages', 201),
    (150.00, 3, 'Amenities 4', 'Ocean view', TRUE, 'Minor damages', 202),

    (200.00, 2, 'Amenities 5', 'Pool view', FALSE, 'No damages', 301),
    (180.00, 4, 'Amenities 6', 'Garden view', TRUE, 'No damages', 302);

-- ----------------------------
-- Records of hotels
-- ----------------------------
	
INSERT INTO Hotel (HotelEmail, HotelName, HotelPhoneNumber, Rating, NumberOfRooms, Address)
VALUES
    ('hotel1@gmail.com', 'Holiday Inn', '1234567890', 4, 10, 'Hotel 1 Address'),
    ('hotel2@gmail.com', 'Holiday Inn', '2345678901', 3, 15, 'Hotel 2 Address'),
    ('hotel3@gmail.com', 'Holiday Inn', '3456789012', 5, 12, 'Hotel 3 Address'),
    ('hotel4@gmail.com', 'Holiday Inn', '4567890123', 4, 20, 'Hotel 4 Address'),
    ('hotel5@gmail.com', 'Holiday Inn', '5678901234', 3, 8, 'Hotel 5 Address'),
    ('hotel6@gmail.com', 'Holiday Inn', '6789012345', 4, 18, 'Hotel 6 Address'),
    ('hotel7@gmail.com', 'Holiday Inn', '7890123456', 5, 10, 'Hotel 7 Address'),
    ('hotel8@gmail.com', 'Holiday Inn', '8901234567', 4, 25, 'Hotel 8 Address'),
    ('hotel9@gmail.com', 'Holiday Inn', '9012345678', 3, 12, 'Hotel 9 Address'),
    ('hotel10@gmail.com', 'Holiday Inn', '0123456789', 4, 22, 'Hotel 10 Address');

-- ----------------------------
-- Records of customers
-- ----------------------------

INSERT INTO customer (Address, FullName, IDPresented, Capacity, NumberOfRooms, CustomerEmail)
VALUES
    ('123 Main St', 'John Doe', '123456789', 1, 1, 'john.doe@example.com'),
    ('456 Elm St', 'Jane Smith', '987654321', 2, 2, 'jane.smith@example.com'),
    ('789 Oak St', 'Alice Johnson', '456123789', 1, 1, 'alice.johnson@example.com'),
    ('321 Pine St', 'Bob Brown', '789456123', 2, 2, 'bob.brown@example.com'),
    ('654 Maple St', 'Emily Davis', '159357852', 1, 1, 'emily.davis@example.com');
	
-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO booking (CustomerID, PricePaid, CheckIn, CheckOut, NumberOfRooms)
VALUES
    (1, 150.00, '2024-04-01', '2024-04-05', 2),
    (2, 200.00, '2024-05-10', '2024-05-15', 1),
    (3, 180.00, '2024-06-20', '2024-06-25', 3),
    (4, 250.00, '2024-07-15', '2024-07-20', 2),
    (5, 300.00, '2024-08-10', '2024-08-15', 1);


SELECT c.FullName AS CustomerName
FROM booking b
JOIN customer c ON b.CustomerID = c.CustomerID
WHERE b.BookingID = 5;
