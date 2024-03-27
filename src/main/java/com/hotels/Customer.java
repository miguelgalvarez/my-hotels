package com.hotels;

import java.util.Date;

/**
 * Customer class to store Customer data
 */
public class Customer {

    private int customerID;
    private String customerusername;
    private String customerpassword;
    private String fullName;
    private Date dateOfRegistration;
    private String address;
    private String IDPresented;
    private String customeremail;

    /**
     * Constructor to save customer's data (with id)
     *
     * @param fullName full name of customer
     * @param dateOfRegistration date of registering their account
     * @param address the customer's address
     * @param IDPresented the customer's ID presented
     *
     */
    public Customer(int customerID, String fullName, String customerusername, String customerpassword, Date dateOfRegistration, String address, String IDPresented, String customeremail) {
        this.customerID = customerID;
        this.fullName = fullName;
        this.customerusername = customerusername;
        this.customerpassword = customerpassword;
        this.dateOfRegistration = dateOfRegistration;
        this.address = address;
        this.IDPresented = IDPresented;
        this.customeremail = customeremail;

    }

    /**
     * Constructor to save customer's data (without id)
     *
     * @param fullName full name of customer
     * @param dateOfRegistration date of registering their account
     * @param address the customer's address
     * @param IDPresented the customer's ID presented
     *
     */
    public Customer(String fullName, String customerusername, String customerpassword, Date dateOfRegistration, String address, String IDPresented, String customeremail) {
        this.fullName = fullName;
        this.customerusername = customerusername;
        this.customerpassword = customerpassword;
        this.dateOfRegistration = dateOfRegistration;
        this.address = address;
        this.IDPresented = IDPresented;
        this.customeremail = customeremail;

    }
    // Getters
    public int getCustomerID() {
        return customerID;
    }
    public String getCustomerUsername() {return customerusername;}
    public String getCustomerPassword() {return customerpassword;}

    public String getFullName() {return fullName;}
    public String getCustomerEmail() {return customeremail;}
    // java.sql.date for the query to work in customerservice
    public java.sql.Date getDateOfRegistration() {
        return (java.sql.Date) dateOfRegistration;
    }

    public String getAddress() {
        return address;
    }

    public String getIDPresented() {
        return IDPresented;
    }

    // Setters
    public void setCustomerID(int customerID) {
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
