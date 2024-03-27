package com.hotels;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Booking class to store Booking data
 */
public class Booking {

    private int BookingID;
    private BigDecimal hotelID;
    private double pricePaid;
    private int customerID;
    private Date checkIn;
    private Date checkOut;

    /**
     * Constructor to save booking's data (with id)
     *
     * @param pricePaid price paid for the booking
     * @param checkIn the date that the customer is checking in
     * @param checkOut the date that customer is checking out
     */
    public Booking(int BookingID, BigDecimal hotelID, double pricePaid, int customerID, Date checkIn, Date checkOut) {
        this.BookingID = BookingID;
        this.hotelID = hotelID;
        this.pricePaid = pricePaid;
        this.customerID = customerID;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    /**
     * Constructor to save booking's data (without id)
     *
     * @param pricePaid price paid for the booking
     * @param hotelID associated hotel for the booking
     * @param customerID id of the customer associated to the booking
     * @param checkIn the date that the customer is checking in
     * @param checkOut the date that customer is checking out
     */
    public Booking(BigDecimal hotelID, double pricePaid, int customerID, Date checkIn, Date checkOut) {
        this.hotelID = hotelID;
        this.pricePaid = pricePaid;
        this.customerID = customerID;
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
    public BigDecimal getHotelID() {return hotelID;}

    public int getCustomerID() {return customerID;}
    public Date getCheckIn() {
        return checkIn;
    }

    public java.sql.Date getCheckInSQL() {
        return (java.sql.Date) checkIn;
    }

    public Date getCheckOut() {return checkOut;}
    public java.sql.Date getCheckOutSQL() {return (java.sql.Date) checkOut;}

    // Setters
    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public void setPricePaid(int pricePaid) {
        this.pricePaid = pricePaid;
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
                + "<li>checkIn = " + checkIn + "</li>"
                + "<li>checkOut = " + checkOut + "</li>"
                ;
    }
}
