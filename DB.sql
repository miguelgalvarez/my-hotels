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
	PhoneNumber varchar(45) NOT NULL,
	NumberOfHotels INT NOT NULL,
	HotelChainEmail varchar(100) NOT NULL CHECK (HotelChainEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
	HotelID serial PRIMARY KEY,
	RoomID serial REFERENCES room(RoomID),
	HotelChainID serial REFERENCES hotelchain(HotelChainID),
	Address varchar(45) NOT NULL,
	NumberOfRooms INT NOT NULL,
	Surname varchar(45) NOT NULL,
	HotelEmail varchar(100) NOT NULL CHECK (HotelEmail LIKE '_%@_%._%'),
	Rating double precision NOT NULL
);

DROP TABLE IF EXISTS room;
CREATE TABLE room (
	RoomID serial PRIMARY KEY,
	Address varchar(45) NOT NULL,
	RoomView varchar(45) NOT NULL,
	Price varchar(45) NOT NULL,
	Capacity INT NOT NULL,
	NumberOfRooms INT NOT NULL,
	Surname varchar(45) NOT NULL,
	Damages TEXT,
	RoomExtension varchar(45),
	CustomerEmail varchar(100) NOT NULL CHECK (CustomerEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS amenity;
CREATE TABLE amenity (
	RoomAmenityID serial PRIMARY KEY,
	RoomAmenityName varchar(50) NOT NULL
)

DROP TABLE IF EXISTS room_amenity;
CREATE TABLE room_amenity (
	RoomID INT,
	RoomAmenityID INT, 
  	PRIMARY KEY (RoomID, RoomAmenityID),
  	FOREIGN KEY (RoomID) REFERENCES room(RoomID),
  	FOREIGN KEY (RoomAmenityID) REFERENCES amenity(RoomAmenityID)
)

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	CustomerID serial PRIMARY KEY,
	Address varchar(45) NOT NULL,
	FullName varchar(45) NOT NULL,
	IDPresented varchar(45) NOT NULL,
	Capacity INT NOT NULL,
	NumberOfRooms INT NOT NULL,
	Surname varchar(45) NOT NULL,
	CustomerEmail varchar(100) NOT NULL CHECK (CustomerEmail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	EmployeeID serial PRIMARY KEY,
	HotelID serial REFERENCES hotel(HotelID),
	Address varchar(45) NOT NULL,
	FullName varchar(45) NOT NULL,
	SSN INT NOT NULL,
	Role varchar(45) NOT NULL,
	NumberOfRooms INT NOT NULL
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
	BookingID serial PRIMARY KEY,
	RentingID serial REFERENCES renting(RentingID),
	CustomerID serial REFERENCES customer(CustomerID),
	PricePaid varchar(45) NOT NULL,
	Period varchar(45) NOT NULL,
	NumberOfRooms INT NOT NULL
);

DROP TABLE IF EXISTS renting;
CREATE TABLE renting (
	RentingID serial PRIMARY KEY,
	CustomerID serial REFERENCES customer(CustomerID),
	RoomID serial REFERENCES room(RoomID),
	Period varchar(45) NOT NULL,
	CustomerName varchar(45) NOT NULL,
	NumberOfRooms INT NOT NULL
);

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO hotelchain (PhoneNumber, NumberOfHotels, HotelChainEmail, HotelChainAddress)
VALUES
    ('1234567890', 8, 'chain1@gmail.com','33 Palisade St'),
    ('2345678901', 9, 'chain1@gmail.com','33 Palisade St'),
    ('3456789012', 10, 'chain1@gmail.com','33 Palisade St'),
    ('4567890123', 11, 'chain1@gmail.com','33 Palisade St'),
    ('5678901234', 12, 'chain1@gmail.com','33 Palisade St');

