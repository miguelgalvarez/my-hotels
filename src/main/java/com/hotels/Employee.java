package com.hotels;

/**
 * Employee class to store Employee data
 */

public class Employee {

    private String SSN;

    private String fullName;

    private String address;

    private String role;

    private int employeeNumber;


    /**
     * Constructor to save employee's data (without id)
     *
     * @param SSN SSN of employee
     * @param fullName full name of employee
     * @param address address of employee
     * @param role the employee's role
     *
     */
    public Employee(String SSN, String fullName, String address, String role, int employeeNumber) {
        this.SSN = SSN;
        this.fullName = fullName;
        this.address = address;
        this.role = role;
        this.employeeNumber = employeeNumber;
    }

    public Employee(String fullName, int employeeNumber) {
        this.fullName = fullName;
        this.employeeNumber = employeeNumber;
    }

    // Getters
    public String getSSN() {
        return SSN;
    }

    public String getFullName() {
        return fullName;
    }

    public String getAddress() {
        return address;
    }

    public String getRole() {
        return role;
    }

    public int getEmployeeNumber(){return employeeNumber;}

    // Setters
    public void setSSN(String SSN) {
        this.SSN = SSN;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setEmployeeNumber(int employeeNumber) {this.employeeNumber = employeeNumber; }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>full name = " + fullName + "</li>"
                + "<li>address = " + address + "</li>"
                + "<li>role= " + role + "</li>";
    }

}
