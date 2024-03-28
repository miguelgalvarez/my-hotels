package com.hotels;

import java.util.Date;

/**
 * Renting class to store Renting data.
 */
public class Renting {

    private int rentingID;
    private int customerID;
    private int roomID;
    private Date checkIn;
    private Date checkOut;

    /**
     * Constructor to save renting's data.
     *
     * @param rentingID the ID of the renting
     * @param customerID the ID of the customer who is renting
     * @param roomID the room being rented
     * @param checkIn the check-in date of the renting instance
     * @param checkOut the check-out date of the renting instance
     */
    public Renting(int rentingID, int customerID, int roomID, Date checkIn, Date checkOut) {
        this.rentingID = rentingID;
        this.customerID = customerID;
        this.roomID = roomID;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    // Getters
    public int getRentingID() { return rentingID; }
    public int getCustomerID() { return customerID; }
    public int getRoomID() { return roomID; }
    public Date getCheckIn() { return checkIn; }
    public Date getCheckOut() { return checkOut; }

    // Assuming you need to convert java.util.Date to java.sql.Date for database operations
    public java.sql.Date getCheckInSQL() {
        return new java.sql.Date(checkIn.getTime());
    }

    public java.sql.Date getCheckOutSQL() {
        return new java.sql.Date(checkOut.getTime());
    }

    // Setters
    public void setRentingID(int rentingID) { this.rentingID = rentingID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }
    public void setRoomID(int roomID) { this.roomID = roomID; }
    public void setCheckIn(Date checkIn) { this.checkIn = checkIn; }
    public void setCheckOut(Date checkOut) { this.checkOut = checkOut; }
}
