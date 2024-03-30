package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingService {

    public String getHotelName(int HotelID) throws Exception {
        ConnectionDB db = new ConnectionDB();
        // this query returns
        String sql = "SELECT hotel.HotelName FROM hotel JOIN hotelchain ON hotel.HotelChainID = hotelchain.HotelChainID WHERE hotel.HotelID = ?;";
        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1,HotelID);
            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // Processing the result and returning true if there is a row returned from the query
            if (rs.next()){
                return rs.getString("hotelname");
            }

            // return false if the username does not exist
            return null;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }
    /**
     * Method to create a booking and add it to the database
     * This method takes a booking object as its parameter
     * @return true if the booking was successfully added to the database
     * @throws Exception when trying to connect to database
     */

    public boolean createBooking(Booking booking) throws Exception {

        boolean canCreate = canAddBooking(booking.getCustomerID());

        if (!canCreate) {
            return false;
        }

        //testing
        System.out.println(booking.getPricePaid());
        System.out.println(booking.getHotelID());
        System.out.println(booking.getCustomerID());
        System.out.println(booking.getCheckIn());
        System.out.println(booking.getCheckOut());

        //establish connection with DB
        ConnectionDB db = new ConnectionDB();

        // Insert data into the database
        try (Connection connection = db.getConnection()) {
            String sql = "INSERT INTO booking (CustomerID, PricePaid, CheckIn, CheckOut, HotelID, roomID) VALUES (?, ?, ?, ?, ?, ?)";
            String sql2 = "UPDATE hotel SET NumberOfRooms = NumberOfRooms - 1 WHERE HotelID = ?;";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // statement 1
                statement.setInt(1, booking.getCustomerID());
                statement.setDouble(2, booking.getPricePaid());
                statement.setDate(3, booking.getCheckInSQL());
                statement.setDate(4, booking.getCheckOutSQL());
                statement.setInt(5, booking.getHotelID());
                statement.setInt(6, booking.getRoomID());

                // statement 2
                PreparedStatement statement2 = connection.prepareStatement(sql2);
                statement2.setInt(1, booking.getHotelID());

                int result = statement.executeUpdate();
                int result2 = statement2.executeUpdate();

                return ((result > 0) && (result2 > 0)); //registration if registration was successful or not
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
     * Method to get bookings from the database from a specific roomID
     *
     * @return List of bookings from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getBookings(int roomID) throws Exception {

        // sql query
        String sql1 = "SELECT * FROM booking WHERE RoomID = ?;";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all bookings retrieved from database
        List<Booking> bookings = new ArrayList<>();

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
                Booking booking = new Booking(
                        rs2.getInt("BookingID"),
                        rs2.getInt("HotelID"),
                        rs2.getInt("RoomID"),
                        rs2.getBoolean("Payment"),
                        rs2.getDouble("PricePaid"),
                        rs2.getInt("CustomerID"),
                        rs2.getDate("CheckIn"),
                        rs2.getDate("Checkout")
                );

                // append booking in bookings list
                bookings.add(booking);
            }

            //close the result set
            rs2.close();
            // close the statement
            stmt2.close();
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
     * Method to get bookings from the database from a specific customer
     *
     * @return List of bookings from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getBookings(Integer customerID) throws Exception {

        // sql query
        String sql1 = "SELECT * FROM booking WHERE CustomerID = ?;";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all bookings retrieved from database
        List<Booking> bookings = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt2 = con.prepareStatement(sql1);
            // get the results from executing the query
           stmt2.setInt(1, customerID);

            ResultSet rs2 = stmt2.executeQuery();


            // iterate through the result set
            while (rs2.next()) {
                // create new booking object
                Booking booking = new Booking(
                        rs2.getInt("BookingID"),
                        rs2.getInt("HotelID"),
                        rs2.getInt("RoomID"),
                        rs2.getBoolean("Payment"),
                        rs2.getDouble("PricePaid"),
                        rs2.getInt("CustomerID"),
                        rs2.getDate("CheckIn"),
                        rs2.getDate("Checkout")
                );

                // append booking in bookings list
                bookings.add(booking);
            }

            //close the result set
            rs2.close();
            // close the statement
            stmt2.close();
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
     * Method to get all bookings from the database
     *
     * @return List of bookings from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getAllBookings() throws Exception {

        // sql queries
        String sql = "SELECT * FROM booking";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all bookings retrieved from database
        List<Booking> bookings = new ArrayList<>();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);
            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                // create new booking object
                Booking booking = new Booking(
                        rs.getInt("BookingID"),
                        rs.getInt("HotelID"),
                        rs.getInt("RoomID"),
                        rs.getBoolean("Payment"),
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
    public String deleteBooking(int BookingID) throws Exception {
        Connection con = null;
        String message = "";

        // sql query
        String sql1 = "UPDATE hotel SET NumberOfRooms = NumberOfRooms + 1 WHERE HotelID = (SELECT hotel.HotelID FROM booking INNER JOIN room ON booking.RoomID = room.RoomID INNER JOIN hotel ON room.HotelID = hotel.HotelID WHERE booking.BookingID = ?);";
        String sql = "DELETE FROM booking WHERE BookingID = ?;";


        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection();

            // prepare statement
            PreparedStatement stmt = con.prepareStatement(sql);
            PreparedStatement stmt2 = con.prepareStatement(sql1);

            // set every ? of statement
            stmt.setInt(1, BookingID);
            stmt2.setInt(1, BookingID);

            // execute the query
            stmt.executeUpdate();
            stmt2.executeUpdate();

            // close the statement
            stmt.close();
            stmt2.close();
        } catch (Exception e) {
            message = "Error while deleting Booking: " + e.getMessage();
        } finally {
            if (con != null) con.close();
            if (message.equals("")) message = "Booking successfully deleted!";
        }

        return message;
    }

    /**
     * Method to check whether a customer can add a booking
     *
     * @param customerID is the ID of the customer
     * @return true if customer has less than 5 bookings and false otherwise
     * @throws Exception when trying to connect to database
     */
    public static boolean canAddBooking(int customerID){
        //establish connection with DB
        ConnectionDB db = new ConnectionDB();

        // Insert data into the database
        try (Connection connection = db.getConnection()) {
            // aggregate query
            String sql = "SELECT COUNT(*) AS NumberOfBookings FROM booking WHERE CustomerID = ?;";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // statement 1
                statement.setInt(1, customerID);

                ResultSet result = statement.executeQuery();
                if(result.next()){
                    return (result.getInt("NumberOfBookings") < 5);
                }

                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exceptions
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return false;
    }
}
