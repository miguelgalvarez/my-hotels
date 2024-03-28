package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RentingService {
    public boolean bookingTOrenting(int roomID) {
        String sql0 = "SELECT * FROM booking WHERE RoomID = ?";
        String sql1 = "INSERT INTO renting (CustomerID, RoomID, CheckIn, CheckOut) SELECT CustomerID, RoomID, CheckIn, CheckOut FROM booking WHERE RoomID = ?";
        // deleting booking after converting it to renting
        // String sql2 = "DELETE FROM booking WHERE RoomID = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {
            // Start a transaction
            con.setAutoCommit(false);

            // Prepare the statements
            PreparedStatement stmt0 = con.prepareStatement(sql0);
            stmt0.setInt(1, roomID);
            PreparedStatement stmt1 = con.prepareStatement(sql1);
            stmt1.setInt(1, roomID);
            // deleting booking statement
            // PreparedStatement stmt2 = con.prepareStatement(sql2);
            // stmt2.setInt(1, room.getRoomID());

            // Execute query to retrieve booking info
            ResultSet rs = stmt0.executeQuery();
            if (rs.next()) {
                // Insert into renting table
                stmt1.executeUpdate();
                // Delete from booking table
                // stmt2.executeUpdate();

                // Commit transaction
                con.commit();

                // Close resources
                rs.close();
                stmt0.close();
                stmt1.close();
                //stmt2.close();
                con.close();
                db.close();

                // Return true to indicate successful transfer
                return true;
            } else {
                // No booking found for the specified room
                // Rollback transaction
                con.rollback();

                // Close resources
                rs.close();
                stmt0.close();
                stmt1.close();
                //stmt2.close();
                con.close();
                db.close();

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

    public String deleteRenting(Integer RentingID) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql0 = "INSERT INTO renting_archive (RentingID, CustomerID, RoomID, CheckIn, CheckOut) SELECT RentingID, CustomerID, RoomID, CheckIn, CheckOut FROM renting WHERE RentingID = your_renting_id;";
        String sql = "DELETE FROM booking WHERE id = ?;";


        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt0 = con.prepareStatement(sql0);
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt0.setInt(1, RentingID);
            stmt.setInt(1, RentingID);

            // execute the query
            stmt0.executeUpdate();
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
