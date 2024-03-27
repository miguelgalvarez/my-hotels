package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    /**
     * Method to create a customer profile in the database
     *
     * @return String that lets the user know if it worked
     * @throws Exception when trying to connect to database
     */
    public String createCustomer(Customer customer) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();
        System.out.println(customer.getFullName());
        System.out.println(customer.getCustomerUsername());
        System.out.println(customer.getCustomerPassword());
        System.out.println(customer.getDateOfRegistration());
        System.out.println(customer.getAddress());

        // sql query
        String insertStudentQuery = "INSERT INTO customer (FullName, CustomerUsername, CustomerPassword, Address, IDPresented, CustomerEmail) VALUES (?, ?, ?, ?, ?, ?);";
        // "INSERT INTO students (name, surname, email) VALUES (" + student.getName().toString() +
//        ", " + student.getSurname() ...."

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertStudentQuery);

            // set every ? of statement
            stmt.setString(1, customer.getFullName());
            stmt.setString(2, customer.getCustomerUsername());
            stmt.setString(3, customer.getCustomerPassword());
            stmt.setString(4, customer.getAddress());
            stmt.setString(5, customer.getIDPresented());
            stmt.setDate(6, customer.getDateOfRegistration());

            // execute the query
            int output = stmt.executeUpdate();
            System.out.println(output);

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting customer: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.equals("")) message = "Student successfully inserted!";

        }

        // return respective message
        return message;
    }
    /**
     * Method to get all customers from the database
     *
     * @return List of customers from database
     * @throws Exception when trying to connect to database
     */
    public List<Customer> getCustomers() throws Exception {

        // sql query
        String sql = "SELECT * FROM customer";
        // connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all students retrieved from database
        List<Customer> customers = new ArrayList<Customer>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                // create new student object
                Customer customer = new Customer(
                        rs.getString("FullName"),
                        rs.getString("CustomerUsername"),
                        rs.getString("CustomerPassword"),
                        rs.getDate("DateOfRegistration"),
                        rs.getString("Address"),
                        rs.getString("IDPresented"),
                        rs.getString("CustomerEmail")
                );

                // append student in students list
                customers.add(customer);
            }

            // close result set
            rs.close();
            // close statement
            stmt.close();
            con.close();
            db.close();

            // return result
            return customers;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to delete by ID a customer
     *
     * @param CustomerID is the ID of the customer to be deleted from database
     * @return string returned that states if the customer deleted or not
     * @throws Exception when trying to connect to database
     */
    public String deleteCustomer(Integer CustomerID) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM room WHERE id = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, CustomerID);

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();

        } catch (Exception e) {
            message = "Error while deleting Room: " + e.getMessage();
        } finally {
            if (con != null) con.close();
            if (message.equals("")) message = "Room successfully deleted!";
        }

        return message;
    }
}


