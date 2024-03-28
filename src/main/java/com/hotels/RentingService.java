package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class RentingService {
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
