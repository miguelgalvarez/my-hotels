package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentingService {
    public boolean bookingToRenting(int bookingID) {
        String sql0 = "SELECT * FROM booking WHERE BookingID = ?";
        String sql1 = "INSERT INTO renting (CustomerID, RoomID, CheckIn, CheckOut) SELECT CustomerID, RoomID, CheckIn, CheckOut FROM booking WHERE BookingID = ?";
        // deleting booking after converting it to renting
        String sql2 = "DELETE FROM booking WHERE BookingID = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {
            // Start a transaction
            con.setAutoCommit(false);

            // Prepare the statements
            PreparedStatement stmt0 = con.prepareStatement(sql0);
            stmt0.setInt(1, bookingID);
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            stmt1.setInt(1, bookingID);
            // deleting booking statement
            PreparedStatement stmt2 = con.prepareStatement(sql2);
            stmt2.setInt(1, bookingID);

            // Execute query to retrieve booking info
            ResultSet rs = stmt0.executeQuery();
            if (rs.next()) {
                // Insert into renting table
                stmt1.executeUpdate();
                // Delete from booking table
                stmt2.executeUpdate();

                // Commit transaction
                con.commit();

                // Return true to indicate successful transfer
                return true;
            } else {
                // No booking found for the specified room
                // Rollback transaction
                con.rollback();

                // Return false to indicate failure
                return false;
            }
        } catch (Exception e) {
            // Rollback transaction
            // Handle exception
            throw new RuntimeException(e.getMessage());
        }
    }

    /**
     * Method to create a renting and add it to the database
     * This method takes a renting object as its parameter
     * @return true if the renting was successfully added to the database
     * @throws Exception when trying to connect to database
     */
    public boolean createRenting(Renting renting){
        //testing
        System.out.println(renting.getRoomID());
        System.out.println(renting.getCheckIn());
        System.out.println(renting.getCheckOut());

        //establish connection with DB
        ConnectionDB db = new ConnectionDB();

        // Insert data into the database
        try (Connection connection = db.getConnection()) {
            String sql = "INSERT INTO renting (RoomID, CheckIn, CheckOut) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, renting.getRoomID());
                statement.setDate(2, renting.getCheckInSQL());
                statement.setDate(3, renting.getCheckOutSQL());

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
     * Method to get all rentings from the database.
     *
     * @return List of all rentings from the database.
     * @throws Exception when trying to connect to database or query execution fails.
     */
    public List<Renting> getAllRentings() throws Exception {
        List<Renting> rentings = new ArrayList<>();
        String sql = "SELECT * FROM renting";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    Renting renting = new Renting(
                            rs.getInt("RentingID"),
                            rs.getInt("CustomerID"),
                            rs.getInt("RoomID"),
                            rs.getDate("CheckIn"),
                            rs.getDate("CheckOut")
                    );
                    rentings.add(renting);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to retrieve rentings: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("An error occurred: " + e.getMessage());
        }

        return rentings;
    }

    /**
     * Method to get bookings from the database from a specific roomID
     *
     * @return List of bookings from database
     * @throws Exception when trying to connect to database
     */
    public List<Renting> getRentings(int roomID) throws Exception {

        // sql query
        String sql1 = "SELECT * FROM renting WHERE RoomID = ?;";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all bookings retrieved from database
        List<Renting> rentings = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt2 = con.prepareStatement(sql1);
            // get the results from executing the query
            stmt2.setInt(1, roomID);

            ResultSet rs2 = stmt2.executeQuery();


            // iterate through the result set
            while (rs2.next()) {
                // create new booking object
                Renting renting = new Renting(
                        rs2.getInt("RentingID"),
                        rs2.getInt("CustomerID"),
                        rs2.getInt("RoomID"),
                        rs2.getDate("CheckIn"),
                        rs2.getDate("CheckOut")
                );

                // append booking in bookings list
                rentings.add(renting);
            }

            //close the result set
            rs2.close();
            // close the statement
            stmt2.close();
            con.close();
            db.close();

            // return the bookings retrieved from database
            return rentings;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }
    public String deleteRenting(int RentingID) throws Exception {
        String message = "";

        // sql query
        String sql0 = "INSERT INTO renting_archive (RentingID, CustomerID, RoomID, CheckIn, CheckOut) SELECT RentingID, CustomerID, RoomID, CheckIn, CheckOut FROM renting WHERE RentingID = ?;";
        String sql = "DELETE FROM renting WHERE RentingID = ?;";


        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()){

            // prepare statement
            PreparedStatement stmt0 = con.prepareStatement(sql0);
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt0.setInt(1, RentingID);
            stmt.setInt(1, RentingID);

            // execute the query
            stmt0.executeUpdate();
            stmt.executeUpdate();

        } catch (Exception e) {
            message = "Error while deleting Renting: " + e.getMessage();
        } finally {
            if (message.equals("")) message = "Renting successfully deleted!";
        }
        return message;
    }


}
