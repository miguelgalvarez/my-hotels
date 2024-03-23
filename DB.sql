-- ----------------------------
-- Table structure for entities
-- ----------------------------
DROP TABLE IF EXISTS hotelchain;
CREATE TABLE hotelchain (
  ChainID serial PRIMARY KEY,
  PhoneNumber varchar(45) NOT NULL,
  NumberOfHotels INT NOT NULL,
  hotelemail varchar(100) NOT NULL CHECK (hotelemail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS hotel;
CREATE TABLE hotel (
  hotelid serial PRIMARY KEY,
  address varchar(45) NOT NULL,
  NumberOfRooms INT NOT NULL,
  surname varchar(45) NOT NULL,
  hotelemail varchar(100) NOT NULL CHECK (hotelemail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS room;
CREATE TABLE room (
  roomID serial PRIMARY KEY,
  address varchar(45) NOT NULL,
  roomView varchar(45) NOT NULL,
  price varchar(45) NOT NULL,
  capacity INT NOT NULL,
  numberOfRooms INT NOT NULL,
  surname varchar(45) NOT NULL,
  customeremail varchar(100) NOT NULL CHECK (customeremail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
  customerID serial PRIMARY KEY,
  address varchar(45) NOT NULL,
  FullName varchar(45) NOT NULL,
  IDpresented varchar(45) NOT NULL,
  capacity INT NOT NULL,
  NumberOfRooms INT NOT NULL,
  surname varchar(45) NOT NULL,
  customeremail varchar(100) NOT NULL CHECK (customeremail LIKE '_%@_%._%')
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  employeeID serial PRIMARY KEY,
  address varchar(45) NOT NULL,
  FullName varchar(45) NOT NULL,
  SSN INT NOT NULL,
  role varchar(45) NOT NULL,
  NumberOfRooms INT NOT NULL
);

DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
  BookingID serial PRIMARY KEY,
  PricePaid varchar(45) NOT NULL,
  period varchar(45) NOT NULL,
  NumberOfRooms INT NOT NULL
);

DROP TABLE IF EXISTS renting;
CREATE TABLE renting (
  RentingID serial PRIMARY KEY,
  period varchar(45) NOT NULL,
  CustomerName varchar(45) NOT NULL,
  NumberOfRooms INT NOT NULL
);

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO hotelchain (PhoneNumber, NumberOfHotels, hotelemail)
VALUES
    ('1234567890', 8, 'chain1@gmail.com'),
    ('2345678901', 9, 'chain1@gmail.com'),
    ('3456789012', 10, 'chain1@gmail.com'),
    ('4567890123', 11, 'chain1@gmail.com'),
    ('5678901234', 12, 'chain1@gmail.com');

