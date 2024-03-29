package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomService {

    /**
     * Method to get all rooms from a specific hotel
     *
     * @return List of rooms from a specific hotel
     * @throws Exception when trying to connect to database
     */
    public List<Room> getRooms(int hotelID) throws Exception {
        // sql query
        String sql = "SELECT * FROM room WHERE hotelid = ?";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all rooms retrieved from database
        List<Room> rooms = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,hotelID);
            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();


            // iterate through the result set
            while (rs.next()) {
                // create new room object
                Room room = new Room(
                        rs.getInt("RoomID"),
                        rs.getDouble("Price"),
                        rs.getInt("HotelID"),
                        rs.getInt("Capacity"),
                        rs.getString("Amenities"),
                        rs.getString("RoomView"),
                        rs.getBoolean("RoomExtension")
                );

                // append room in rooms list
                rooms.add(room);
            }

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the rooms retrieved from database
            return rooms;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get all rooms from the database
     *
     * @return List of rooms from database
     * @throws Exception when trying to connect to database
     */
    public List<Room> getRooms() throws Exception {

        // sql query
        String sql = "SELECT * FROM room";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all rooms retrieved from database
        List<Room> rooms = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();


            // iterate through the result set
            while (rs.next()) {
                // create new room object
                Room room = new Room(
                        rs.getInt("RoomID"),
                        rs.getDouble("Price"),
                        rs.getInt("HotelID"),
                        rs.getInt("Capacity"),
                        rs.getString("Amenities"),
                        rs.getString("RoomView"),
                        rs.getBoolean("RoomExtension")
                );

                // append room in rooms list
                rooms.add(room);
            }

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the rooms retrieved from database
            return rooms;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to delete by ID a room
     *
     * @param RoomID is the ID of the room to be deleted from database
     * @return string returned that states if the grade deleted or not
     * @throws Exception when trying to connect to database
     */
    public String deleteRoom(Integer RoomID) throws Exception {
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
            stmt.setInt(1, RoomID);

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

