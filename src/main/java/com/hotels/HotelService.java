package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HotelService {

    /**
     * Method to get all hotels from the database
     *
     * @return List of hotels from database
     * @throws Exception when trying to connect to database
     */
    public List<Hotel> getHotels() throws Exception {
        // sql query
        String sql = "SELECT * FROM hotel;";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all hotels retrieved from database
        List<Hotel> hotels = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);
            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();


            // iterate through the result set
            while (rs.next()) {
                // create new hotel object
                Hotel hotel = new Hotel(
                        rs.getInt("HotelID"),
                        rs.getInt("HotelChainID"),
                        rs.getDouble("Rating"),
                        rs.getString("HotelArea"),
                        rs.getString("HotelCategory"),
                        rs.getBigDecimal("HotelPhoneNumber"),
                        rs.getInt("NumberOfRooms"),
                        rs.getString("Address"),
                        rs.getString("HotelEmail"),
                        rs.getString("HotelName")
                );

                // append hotel in hotels list
                hotels.add(hotel);
            }

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the hotels retrieved from database
            return hotels;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get the number of rooms in a certain area
     * This method takes a string (the area in question) as a parameter
     * @return int that represents the number of rooms in the specified area
     * @return 0 if null
     * @throws Exception when trying to connect to database
     */
    public int getTotalNumRoomsInArea(String area){
        //establish connection with DB
        ConnectionDB db = new ConnectionDB();

        // Insert data into the database
        try (Connection connection = db.getConnection()) {
            String sql = "SELECT HotelArea, SUM(NumberOfRooms) AS TotalRooms FROM hotel WHERE HotelArea = ? GROUP BY HotelArea;";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, area);

                ResultSet result = statement.executeQuery();

                if(result.next()){
                    return result.getInt("totalrooms");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exceptions
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return 0;
    }

    /**
     * Method to delete by ID a hotel
     *
     * @param HotelID is the ID of the hotel to be deleted from database
     * @return string returned that states if the grade deleted or not
     * @throws Exception when trying to connect to database
     */
    public String deleteHotel(Integer HotelID) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql = "DELETE FROM hotel WHERE id = ?;";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // set every ? of statement
            stmt.setInt(1, HotelID);

            // execute the query
            stmt.executeUpdate();

            // close the statement
            stmt.close();

        } catch (Exception e) {
            message = "Error while deleting Hotel: " + e.getMessage();
        } finally {
            if (con != null) con.close();
            if (message.equals("")) message = "Hotel successfully deleted!";
        }

        return message;
    }
}

