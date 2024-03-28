package com.hotels;

public class Payment {
    private int creditCardNumber;
    private String cvv;
    private String fullName;

    /**
     * Constructor to save payment data
     *
     * @param creditCardNumber unique number of the customer's credit card
     * @param cvv unique cvv number of customer's credit card
     * @param fullName cardholder's full name
     */
    public Payment(int creditCardNumber, String cvv, String fullName) {
        this.creditCardNumber = creditCardNumber;
        this.cvv = cvv;
        this.fullName = fullName;
    }

    /* Getters */
    public int getCreditCardNumber() {return this.creditCardNumber; }
    public String getCvv() {return this.cvv;}
    public String getFullName() {return this.fullName;}

}
