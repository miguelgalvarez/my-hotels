package com.hotels;

import java.util.Date;

public class Customer {

    private String customerID;
    private String fullName;
    private Date dateOfRegistration;
    private String address;
    private String IDPresented;


    public Customer(String customerID, String fullName, Date dateOfRegistration, String address, String IDPresented) {
        this.customerID = customerID;
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
}
