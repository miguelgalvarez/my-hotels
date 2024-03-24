package com.hotels;

public class Renting {
    private String rentingID;
    private String period;
    private int numberOfRooms;


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
}
