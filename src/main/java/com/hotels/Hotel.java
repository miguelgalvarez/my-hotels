package com.hotels;

/**
 * Hotel class to store Hotel data
 */

public class Hotel {
    private int hotelID;

    private double rating;

    private int phoneNumber;

    private int numRooms;

    private String address;

    private String email;

    private final String surname;

    /**
     * Constructor to save hotel's data (with id)
     *
     * @param hotelID unique ID of hotel
     * @param rating rating for the hotel
     * @param phoneNumber phone number of hotel
     * @param numRooms number of rooms in a hotel
     * @param address address of hotel
     * @param email email of hotel
     */
    public Hotel(int hotelID, double rating, int phoneNumber, int numRooms, String address, String email, String surname) {
        this.hotelID = hotelID;
        this.rating = rating;
        this.phoneNumber = phoneNumber;
        this.numRooms = numRooms;
        this.address = address;
        this.email = email;
        this.surname = surname;
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
    public Hotel(double rating, int phoneNumber, int numRooms, String address, String email, String surname) {
        this.rating = rating;
        this.phoneNumber = phoneNumber;
        this.numRooms = numRooms;
        this.address = address;
        this.email = email;
        this.surname = surname;
    }

    /* Getters */
    public int getID() {return this.hotelID; }
    public double getRating() {return this.rating; }
    public int getPhoneNumber() {return this.phoneNumber; }
    public int getNumRooms() {return this.numRooms; }
    public String getAddress() {return this.address; }
    public String getEmail() {return this.email; }

    public String getSurname() {return this.surname;}

    /* Setters */
    public void setHotelID(int hotelID) {this.hotelID = hotelID; }
    public void setRating(int rating) {this.rating = rating; }
    public void setPhoneNumber(int phoneNumber) {this.phoneNumber = phoneNumber; }
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
