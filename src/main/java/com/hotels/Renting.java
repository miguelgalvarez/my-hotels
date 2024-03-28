package com.hotels;

import java.util.Date;

/**
 * Renting class to store Renting data
 */

public class Renting {
    private int roomID;
    private Date checkIn;
    private Date checkOut;


    /**
     * Constructor to save renting's data
     *
     * @param roomID the room being rented
     * @param checkIn the check-in date of the renting instance
     * @param checkOut the check-out date of the renting instance
     *
     */
    public Renting(int roomID, Date checkIn, Date checkOut) {
        this.roomID = roomID;
        this.checkIn = checkIn;
        this.checkOut = checkOut;

    }

    // Getters
    public int getRoomID() {
        return roomID;
    }
    public Date getCheckIn() {return checkIn;}
    public Date getCheckOut() {return checkOut;}

    public java.sql.Date getCheckInSQL() {
        return (java.sql.Date) checkIn;
    }
    public java.sql.Date getCheckOutSQL(){return (java.sql.Date) checkOut;}

    // Setters
    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public void checkIn(Date checkIn) {this.checkIn = checkIn;}
    public void checkOut(Date checkOut) {this.checkOut = checkOut;}

}
