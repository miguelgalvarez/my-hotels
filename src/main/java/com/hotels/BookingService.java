package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingService {
    /**
     * Method to create a booking and add it to the database
     * This method takes a booking object as its parameter
     * @return List of bookings from database
     * @throws Exception when trying to connect to database
     */

    public boolean createBooking(Booking booking) throws Exception {

        //testing
        System.out.println(booking.getPricePaid());
        System.out.println(booking.getCustomerID());
        System.out.println(booking.getCheckIn());
        System.out.println(booking.getCheckOut());

        //establish connection with DB
        ConnectionDB db = new ConnectionDB();

        // Insert data into the database
        try (Connection connection = db.getConnection()) {
            String sql = "INSERT INTO booking (CustomerID, PricePaid, CheckIn, CheckOut) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, booking.getCustomerID());
                statement.setDouble(2, booking.getPricePaid());
                statement.setDate(3, booking.getCheckInSQL());
                statement.setDate(4, booking.getCheckOutSQL());

                int result = statement.executeUpdate();

                return result > 0; //registration if registration was successful or not
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exceptions
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return false;
    }

    /**
     * Method to get all bookings from the database
     *
     * @return List of bookings from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getBookings(int customerID) throws Exception {

        // sql queries
        String sql = "SELECT * FROM booking";
        String sql1 = "SELECT booking.* FROM booking JOIN customer ON booking.CustomerID = customer.CustomerID WHERE customer.CustomerID = "+customerID+";";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all bookings retrieved from database
        List<Booking> bookings = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);
            // prepare second statement
            PreparedStatement stmt2 = con.prepareStatement(sql1);
            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            ResultSet rs2 = stmt2.executeQuery();


            // iterate through the result set
            while (rs.next()) {
                // create new booking object
                Booking booking = new Booking(
                        rs.getDouble("PricePaid"),
                        rs.getInt("CustomerID"),
                        rs.getDate("CheckIn"),
                        rs.getDate("Checkout")
                );

                // append booking in bookings list
                bookings.add(booking);
            }

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the bookings retrieved from database
            return bookings;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to delete by ID a booking
     *
     * @param BookingID is the ID of the booking to be deleted from database
     * @return string returned that states if the booking has been deleted or not
     * @throws Exception when trying to connect to database
     */
    public String deleteBooking(Integer BookingID) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM booking WHERE id = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, BookingID);

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();

        } catch (Exception e) {
            message = "Error while deleting Booking: " + e.getMessage();
        } finally {
            if (con != null) con.close();
            if (message.equals("")) message = "Booking successfully deleted!";
        }

        return message;
    }
}
