package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.Date;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract payment details from the request
        int creditCardNumber = Integer.parseInt(request.getParameter("creditCardNumber"));
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        String expDate = request.getParameter("expiryDate");
        String fullName = request.getParameter("fullName"); // Assume this is also collected in the form

        // Create a Payment object
        Payment payment = new Payment(123, 123, expDate, fullName);

        // Validate the payment
        PaymentService paymentService = new PaymentService();
        boolean paymentAccepted = paymentService.paymentAccepted(payment);

        if (paymentAccepted) {
            // If payment is valid, proceed to create the booking
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            int numberOfDays = Integer.parseInt(request.getParameter("numberOfDays"));
            int pricePaid = numberOfDays*Integer.parseInt(request.getParameter("price"));
            //have to update this part
            int customerID = 1;
            int hotelID = 1;
            // Parse the check-in date string into a Date object
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date checkInDate = null;
            Date checkOutDate = null;
            try {
                checkInDate = new Date(dateFormat.parse(request.getParameter("checkInDate")).getTime());
                checkOutDate = new Date(dateFormat.parse(request.getParameter("checkInDate")).getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            // Create a Booking object
            Booking booking = new Booking(hotelID, true, pricePaid, customerID, roomId, checkInDate, checkOutDate);

            // Create the booking using BookingService
            BookingService bookingService = new BookingService();
            try {
                boolean bookingCreated = bookingService.createBooking(booking);
                if (bookingCreated) {
                    // Redirect to main page
                    response.sendRedirect("index.jsp");
                } else {
                    // Handle the case where booking couldn't be created
                    response.sendRedirect("payment.jsp?error=Booking failed");
                }
            } catch (Exception e) {
                // Log the exception and redirect to an error page
                e.printStackTrace(); // Consider logging this properly
                response.sendRedirect("payment.jsp?error=Payment failed");
            }

        } else {
            response.sendRedirect("payment.jsp?error=Payment failed");
        }
    }
}
