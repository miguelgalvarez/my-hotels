package com.hotels;

import java.util.Date;

public class Booking {


    private String bookingID;
    private int pricePaid;
    private int numberOfRooms;
    private String period;


    public Booking(String bookingID, int pricePaid, int numberOfRooms, String period) {
        this.bookingID = bookingID;
        this.pricePaid = pricePaid;
        this.numberOfRooms = numberOfRooms;
        this.period = period;

    }


    // Getters
    public String getBookingID() {
        return bookingID;
    }

    public int getPricePaid() {
        return pricePaid;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public String getPeriod() {
        return period;
    }

    // Setters
    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public void setPricePaid(int pricePaid) {
        this.pricePaid = pricePaid;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
}
