package com.hotels;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class PaymentService {
    /**
     * Method that returns true if the payment information inputted by the customer is valid
     *
     * @param payment object that is created based on the input that the user puts when doing payment
     */
    public boolean paymentAccepted(Payment payment){
        int ccNumber = payment.getCreditCardNumber();
        int cvv = payment.getCvv();
        String fullName = payment.getFullName();
        
        int count = 0;
        int count2 = 0;

        while (ccNumber != 0) {
            // Remove the last digit
            ccNumber /= 10;
            // Increment the count
            count++;
        }

        while(cvv != 0){
            cvv /= 10;
            count2++;
        }
        // Return true if the count is 16, indicating a 16-digit number
        return ((count == 16) && (!fullName.equals("")) && (count2 == 3));
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

}


