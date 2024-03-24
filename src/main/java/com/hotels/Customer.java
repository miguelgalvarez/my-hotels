package com.hotels;

import java.util.Date;

/**
 * Customer class to store Customer data
 */
public class Customer {

    private String customerID;
    private String fullName;
    private Date dateOfRegistration;
    private String address;
    private String IDPresented;


    /**
     * Constructor to save customer's data (without id)
     *
     * @param fullName full name of customer
     * @param dateOfRegistration date of registering their account
     * @param address the customer's address
     * @param IDPresented the customer's ID presented
     *
     */
    public Customer(String fullName, Date dateOfRegistration, String address, String IDPresented) {
        this.fullName = fullName;
        this.dateOfRegistration = dateOfRegistration;
        this.address = address;
        this.IDPresented = IDPresented;

    }
    // Getters
    public String getCustomerID() {
        return customerID;
    }

    public String getFullName() {
        return fullName;
    }

    public Date getDateOfRegistration() {
        return dateOfRegistration;
    }

    public String getAddress() {
        return address;
    }

    public String getIDPresented() {
        return IDPresented;
    }

    // Setters
    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setDateOfRegistration(Date dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setIDPresented(String IDPresented) {
        this.IDPresented = IDPresented;
    }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>full name = " + fullName + "</li>"
                + "<li>date of registration = " + dateOfRegistration + "</li>"
                + "<li>address= " + address + "</li>"
                + "<li>Id presented = " + IDPresented + "</li>";

    }
}
