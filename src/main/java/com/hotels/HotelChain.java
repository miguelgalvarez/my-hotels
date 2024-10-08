package com.hotels;

/**
 * HotelChain class to store HotelChain data
 */

public class HotelChain {

    private int chainID;
    private String hotelChainName;

    private int phoneNumber;

    private int numHotels;

    private String address;

    private String email;

    /**
     * Constructor to save hotel chain's data (with id)
     *
     * @param chainID unique ID of hotel chain
     * @param phoneNumber phone number of hotel chain
     * @param numHotels number of hotels under hotel chain
     * @param address address of hotel chain
     * @param email email of hotel chain
     */
    public HotelChain(int chainID, String hotelChainName, int phoneNumber, int numHotels, String address, String email) {
        this.chainID = chainID;
        this.hotelChainName = hotelChainName;
        this.phoneNumber = phoneNumber;
        this.numHotels = numHotels;
        this.address = address;
        this.email = email;
    }

    /**
     * Constructor to save hotel chain's data (without id)
     *
     * @param phoneNumber phone number of hotel chain
     * @param numHotels number of hotels under hotel chain
     * @param address address of hotel chain
     * @param email email of hotel chain
     */
    public HotelChain(int phoneNumber, String hotelChainName, int numHotels, String address, String email) {
        this.phoneNumber = phoneNumber;
        this.hotelChainName = hotelChainName;
        this.numHotels = numHotels;
        this.address = address;
        this.email = email;
    }

    /* Getters */
    public int getID() {return this.chainID; }
    public String getHotelChainName() {return this.hotelChainName;}
    public int getPhoneNumber() {return this.phoneNumber; }
    public int getNumHotels() {return this.numHotels; }
    public String getAddress() {return this.address; }
    public String getEmail() {return this.email; }

    /* Setters */
    public void setChainID(int chainID) {this.chainID = chainID; }
    public void setPhoneNumber(int phoneNumber) {this.phoneNumber = phoneNumber; }
    public void setNumHotels(int numHotels) {this.numHotels = numHotels ;}
    public void setAddress(String address) {this.address = address; }
    public void setEmail(String email) {this.email = email; }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>phone number = " + phoneNumber + "</li>"
                + "<li>number of hotels = " + numHotels + "</li>"
                + "<li>email= " + email + "</li>"
                + "<li>address= " + address + "</li>";

    }
}
