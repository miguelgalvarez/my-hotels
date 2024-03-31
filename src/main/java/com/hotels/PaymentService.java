package com.hotels;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class PaymentService {
    /**
     * Method that returns true if the payment information inputted by the customer is valid
     *
     * @param payment object that is created based on the input that the user puts when doing payment
     */
    public boolean paymentAccepted(Payment payment){
        BigInteger ccNumber = payment.getCreditCardNumber();
        int cvv = payment.getCvv();
        String fullName = payment.getFullName();
        String expDate = payment.getExpDate();

        int count2 = 0;

        while(cvv != 0){
            cvv /= 10;
            count2++;
        }
        // getting length of creditcard number
        int length = ccNumber.toString().length();
        // Return true if the count is 16, indicating a 16-digit number
        return ((length == 16) && (!fullName.equals("")) && (count2 == 3) && (expDate.length() == 4));
    }

    /**
     * Method that returns true if method was able to update payment status to true given the bookingID input
     *
     * @param bookingID unique number of the customer's credit card
     */
    public boolean updatePaymentStatus(int bookingID) {
        String sql = "UPDATE booking SET Payment = true WHERE BookingID = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, bookingID);

            // Execute the update statement
            int rowsAffected = stmt.executeUpdate();

            // Check if any rows were affected
            return rowsAffected > 0;

        } catch (SQLException e) {
            // Handle SQL exception
            throw new RuntimeException("Error updating payment status: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int getHotelID(int roomID){
        String sql = "SELECT HotelID from room WHERE RoomID = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();

             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, roomID);

            // Execute the update statement
            ResultSet result = stmt.executeQuery();
            if(result.next()){
                return result.getInt("HotelID");
            }
            // Check if any rows were affected
            return 0;

        } catch (SQLException e) {
            // Handle SQL exception
            throw new RuntimeException("Error retrieving hotelID: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}


