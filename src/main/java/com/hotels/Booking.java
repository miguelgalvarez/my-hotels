package com.hotels;

import java.util.Date;

/**
 * Booking class to store Booking data
 */
public class Booking {

    private String bookingID;
    private int pricePaid;
    private int numberOfRooms;
    private String period;

    /**
     * Constructor to save booking's data (without id)
     *
     * @param pricePaid price paid for the booking
     * @param numberOfRooms number of rooms for the booking
     * @param period the period that the hotel is booked for
     */
    public Booking(int pricePaid, int numberOfRooms, String period) {
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

    @Override
    public String toString() {

        return "<ul>"
                + "<li>price paid = " + pricePaid + "</li>"
                + "<li>number of rooms = " + numberOfRooms + "</li>"
                + "<li>period = " + period + "</li>";
    }
}
