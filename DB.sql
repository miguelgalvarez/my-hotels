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
	SSN BIGINT NOT NULL,
	Role varchar(45) NOT NULL,
	NumberOfRooms BIGINT NOT NULL
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
	BookingID serial PRIMARY KEY,
	CustomerID BIGINT REFERENCES customer(CustomerID),
	HotelID BIGINT REFERENCES hotel(HotelID),
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
INSERT INTO Hotel (HotelChainID, HotelEmail, HotelArea, HotelCategory, HotelName, HotelPhoneNumber, Rating, NumberOfRooms, Address)
VALUES
    (1,'hotel1@gmail.com', 'Montreal', 'Luxury','Holiday Inn', '1234567890', 4, 10, 'Hotel 1 Address'),
    (1,'hotel2@gmail.com', 'Montreal', 'Budget','Holiday Inn', '2345678901', 3, 15, 'Hotel 2 Address'),
    (2,'hotel3@gmail.com', 'Montreal', 'Luxury','Holiday Inn', '3456789012', 5, 12, 'Hotel 3 Address'),
    (2,'hotel4@gmail.com', 'Montreal', 'Budget','Holiday Inn', '4567890123', 4, 20, 'Hotel 4 Address'),
    (3,'hotel5@gmail.com', 'Montreal', 'Luxury','Holiday Inn', '5678901234', 3, 8, 'Hotel 5 Address'),
    (3,'hotel6@gmail.com', 'Toronto', 'Luxury','Holiday Inn', '6789012345', 4, 18, 'Hotel 6 Address'),
    (4,'hotel7@gmail.com', 'Toronto', 'Budget','Holiday Inn', '7890123456', 5, 10, 'Hotel 7 Address'),
    (4,'hotel8@gmail.com', 'Toronto', 'Luxury','Holiday Inn', '8901234567', 4, 25, 'Hotel 8 Address'),
    (5,'hotel9@gmail.com', 'Toronto', 'Budget','Holiday Inn', '9012345678', 3, 12, 'Hotel 9 Address'),
    (5,'hotel10@gmail.com', 'Toronto', 'Luxury','Holiday Inn', '0123456789', 4, 22, 'Hotel 10 Address');

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
INSERT INTO booking (CustomerID, HotelID, PricePaid, CheckIn, CheckOut)
VALUES
    (1, 1, 150.00, '2024-04-01', '2024-04-05'),
    (2, 2, 200.00, '2024-05-10', '2024-05-15'),
    (3, 3, 180.00, '2024-06-20', '2024-06-25'),
    (3, 4, 250.00, '2024-07-15', '2024-07-20'),
    (3, 5, 300.00, '2024-08-10', '2024-08-15');

-- ----------------------------
-- Test queries
-- ----------------------------
SELECT booking.* FROM booking JOIN customer ON booking.CustomerID = customer.CustomerID WHERE customer.CustomerID = 3;
SELECT EXISTS (SELECT 1 FROM customer WHERE CustomerUsername = 'john_doe') AS username_exists;
SELECT CustomerID FROM customer WHERE CustomerUsername = 'john_doe';
SELECT * FROM hotel
SELECT EXISTS (SELECT 1 FROM customer WHERE customerusername = 'john') AS username_exists;
SELECT hotel.HotelName FROM hotel JOIN hotelchain ON hotel.HotelChainID = hotelchain.HotelChainID WHERE hotel.HotelID = 2;

