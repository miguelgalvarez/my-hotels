package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

public class CustomerService {
    /**
     * Method to create a customer profile in the database
     *
     * @return String that lets the user know if it worked
     * @throws Exception when trying to connect to database
     */
    public Boolean createCustomer(Customer customer) throws Exception {

       //retrieving attributes from customer object
       String fullName = customer.getFullName();
       String username = customer.getCustomerUsername();
       String password = customer.getCustomerPassword();
       java.sql.Date dateOfRegistration = customer.getDateOfRegistration();
       String address = customer.getAddress();
       String email = customer.getCustomerEmail();
       String IDPresented = customer.getIDPresented();

        //verifying that a username does not already exist
        RegisterService registerService = new RegisterService();
        if (registerService.usernameExists(username)) {
            return false;
        }

        //turn password into hash code to store securely
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        //establish connection with DB
        ConnectionDB db = new ConnectionDB();

        // Insert data into the database
        try (Connection connection = db.getConnection()) {
            String sql = "INSERT INTO customer (FullName, customerusername, customerpassword, dateofregistration, CustomerEmail, Address, IDPresented) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, fullName);
                statement.setString(2, username);
                statement.setString(3, hashedPassword);
                statement.setDate(4, dateOfRegistration);
                statement.setString(5, email);
                statement.setString(6, address);
                statement.setString(7, IDPresented);

                int result = statement.executeUpdate();

                return result > 0; //registration if registration was successful or not
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exceptions
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return false; //default case
    }

    public boolean validateCustomer(Customer customer) throws Exception{

        ConnectionDB db = new ConnectionDB();

        String username = customer.getCustomerUsername();
        String password = customer.getCustomerPassword();

        try (Connection connection = db.getConnection()) {
            String sql = "SELECT customerpassword FROM customer WHERE customerusername = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);

                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    String storedHash = rs.getString("customerpassword");
                    if (BCrypt.checkpw(password, storedHash)) {
                        return true;
                    } else {
                        // Password incorrect
                        return false;
                    }
                } else {
                    // Username does not exist
                    return false;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

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
    public String deleteCustomer(int CustomerID) throws Exception {
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

    public Integer fetchCustomerID(String username) {
        Integer customerID = null; // Default to null if not found
        String sql = "SELECT CustomerID FROM customer WHERE CustomerUsername = ?;";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) { // If there is a result, get the first (and should be the only) CustomerID
                    customerID = rs.getInt("CustomerID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return customerID; // Return the found CustomerID or null
    }

    public static Integer fetchHotelID(int employeeNumber) {
        Integer hotelID = null; // Default to null if not found
        String sql = "SELECT hotelid FROM employee WHERE employeenumber = ?;";

        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, employeeNumber);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) { // If there is a result, get the first (and should be the only) CustomerID
                    hotelID = rs.getInt("hotelid");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return hotelID;
    }

}


