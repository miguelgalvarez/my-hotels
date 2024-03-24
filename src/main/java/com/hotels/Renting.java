package com.hotels;

/**
 * Renting class to store Renting data
 */

public class Renting {
    private String rentingID;
    private String period;
    private int numberOfRooms;


    /**
     * Constructor to save renting's data (without id)
     *
     * @param numberOfRooms the number of rooms in a renting
     * @param period the period that the customer is staying
     *
     */
    public Renting(String rentingID, String period, int numberOfRooms) {
        this.rentingID = rentingID;
        this.numberOfRooms = numberOfRooms;
        this.period = period;

    }

    // Getters
    public String getRentingID() {
        return rentingID;
    }

    public String getPeriod() {
        return period;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    // Setters
    public void setRentingID(String rentingID) {
        this.rentingID = rentingID;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>period = " + period + "</li>"
                + "<li>number of rooms = " + numberOfRooms + "</li>";
    }
}
