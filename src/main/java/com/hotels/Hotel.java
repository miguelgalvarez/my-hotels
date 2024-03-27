package com.hotels;

import java.math.BigDecimal;

/**
 * Hotel class to store Hotel data
 */

public class Hotel {
    private int hotelID;
    private int hotelChainID;
    private String hotelCategory;
    private String hotelArea;
    private double rating;

    private BigDecimal phoneNumber;

    private int numRooms;

    private String address;

    private String email;

    private String hotelName;

    /**
     * Constructor to save hotel's data (with id)
     *
     * @param hotelID unique ID of hotel
     * @param rating rating for the hotel
     * @param phoneNumber phone number of hotel
     * @param numRooms number of rooms in a hotel
     * @param address address of hotel
     * @param email email of hotel
     * @param hotelName name of the hotel
     */
    public Hotel(int hotelID, int hotelChainID, double rating, BigDecimal phoneNumber, int numRooms, String address, String email, String hotelName) {
        this.hotelID = hotelID;
        this.hotelChainID = hotelChainID;
        this.rating = rating;
        this.phoneNumber = phoneNumber;
        this.numRooms = numRooms;
        this.address = address;
        this.email = email;
        this.hotelName = hotelName;
    }

    /**
     * Constructor to save hotel's data (without id)
     *
     * @param rating rating for the hotel
     * @param phoneNumber phone number of hotel
     * @param numRooms number of rooms in a hotel
     * @param address address of hotel
     * @param email email of hotel
     */
    public Hotel(double rating, int hotelChainID, String hotelArea, String hotelCategory, BigDecimal phoneNumber, int numRooms, String address, String email, String hotelName) {
        this.rating = rating;
        this.hotelChainID = hotelChainID;
        this.hotelArea = hotelArea;
        this.hotelCategory = hotelCategory;
        this.phoneNumber = phoneNumber;
        this.numRooms = numRooms;
        this.address = address;
        this.email = email;
        this.hotelName = hotelName;
    }

    /* Getters */
    public int getID() {return this.hotelID; }
    public String getHotelArea() {return this.hotelArea;}
    public String getHotelCategory() {return this.hotelCategory;}

    public int getHotelChainID() {return this.hotelChainID;}
    public double getRating() {return this.rating; }
    public BigDecimal getPhoneNumber() {return this.phoneNumber; }
    public int getNumRooms() {return this.numRooms; }
    public String getAddress() {return this.address; }
    public String getEmail() {return this.email; }

    public String getHotelName() {return this.hotelName;}

    /* Setters */
    public void setHotelID(int hotelID) {this.hotelID = hotelID; }
    public void setRating(int rating) {this.rating = rating; }
    public void setPhoneNumber(BigDecimal phoneNumber) {this.phoneNumber = phoneNumber; }
    public void setNumRooms(int numRooms) {this.numRooms = numRooms; }
    public void setAddress(String address) {this.address = address; }
    public void setEmail(String email) {this.email = email;}

    @Override
    public String toString() {

        return "<ul>"
                + "<li>rating = " + rating + "</li>"
                + "<li>phone number = " + phoneNumber + "</li>"
                + "<li>number of rooms= " + numRooms + "</li>"
                + "<li>address= " + address + "</li>"
                + "<li>email= " + email + "</li>";

    }
}
