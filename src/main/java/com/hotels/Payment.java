package com.hotels;

public class Payment {
    private int creditCardNumber;
    private int cvv;
    private String expDate;
    private String fullName;

    /**
     * Constructor to save payment data
     *
     * @param creditCardNumber unique number of the customer's credit card
     * @param cvv unique cvv number of customer's credit card
     * @param fullName cardholder's full name
     */
    public Payment(int creditCardNumber, int cvv, String expDate, String fullName) {
        this.creditCardNumber = creditCardNumber;
        this.cvv = cvv;
        this.expDate = expDate;
        this.fullName = fullName;
    }

    /* Getters */
    public int getCreditCardNumber() {return this.creditCardNumber; }
    public int getCvv() {return this.cvv;}
    public String getExpDate(){return this.expDate;}
    public String getFullName() {return this.fullName;}

}
