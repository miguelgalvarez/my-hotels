package com.hotels;

import java.util.Date;

/**
 * Booking class to store Booking data
 */
public class Booking {

    private int BookingID;
    private double pricePaid;
    private int numberOfRooms;
    private String customerName;
    private Date checkIn;
    private Date checkOut;

    /**
     * Constructor to save booking's data (with id)
     *
     * @param pricePaid price paid for the booking
     * @param numberOfRooms number of rooms for the booking
     * @param checkIn the date that the customer is checking in
     * @param checkOut the date that customer is checking out
     */
    public Booking(int BookingID, double pricePaid, int numberOfRooms, String customerName, Date checkIn, Date checkOut) {
        this.BookingID = BookingID;
        this.pricePaid = pricePaid;
        this.customerName = customerName;
        this.numberOfRooms = numberOfRooms;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    /**
     * Constructor to save booking's data (without id)
     *
     * @param pricePaid price paid for the booking
     * @param numberOfRooms number of rooms for the booking
     * @param customerName name of the customer associated to the booking
     * @param checkIn the date that the customer is checking in
     * @param checkOut the date that customer is checking out
     */
    public Booking(double pricePaid, int numberOfRooms, String customerName, Date checkIn, Date checkOut) {
        this.pricePaid = pricePaid;
        this.numberOfRooms = numberOfRooms;
        this.customerName = customerName;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }


    // Getters
    public int getBookingID() {
        return BookingID;
    }

    public double getPricePaid() {
        return pricePaid;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public String getCustomerName() {return customerName;}

    public Date getCheckIn() {
        return checkIn;
    }

    public Date getCheckOut() {return checkOut;}

    // Setters
    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public void setPricePaid(int pricePaid) {
        this.pricePaid = pricePaid;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }
    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>price paid = " + pricePaid + "</li>"
                + "<li>number of rooms = " + numberOfRooms + "</li>"
                + "<li>checkIn = " + checkIn + "</li>"
                + "<li>checkOut = " + checkOut + "</li>"
                ;
    }
}
