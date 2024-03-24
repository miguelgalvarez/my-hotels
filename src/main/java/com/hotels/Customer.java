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

}
