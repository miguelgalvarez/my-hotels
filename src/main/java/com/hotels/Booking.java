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

}
