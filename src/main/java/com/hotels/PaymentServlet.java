package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

import java.math.BigInteger;
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
        BigInteger creditCardNumber = new BigInteger(request.getParameter("credit-card-number"));
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        String expDate = request.getParameter("expiryDate");
        String fullName = request.getParameter("fullName"); // Assume this is also collected in the form

        // Create a Payment object
        Payment payment = new Payment(creditCardNumber, cvv, expDate, fullName);
        // Testing
        System.out.println(creditCardNumber);
        System.out.println(cvv);
        System.out.println(expDate);
        System.out.println(fullName);
        System.out.println(creditCardNumber.bitCount());
        System.out.println(expDate.length());
        // Validate the payment
        PaymentService paymentService = new PaymentService();
        boolean paymentAccepted = paymentService.paymentAccepted(payment);

        if (paymentAccepted) {
            // If payment is valid, proceed to create the booking
            int roomId = Integer.parseInt(request.getParameter("roomID"));
            int pricePaid = Integer.parseInt(request.getParameter("cost"));
            int customerID = (int) request.getSession().getAttribute("customerID");
            int hotelID = paymentService.getHotelID(roomId);

            String checkInStr = request.getParameter("checkIN");
            String checkOutStr = request.getParameter("checkOut");
            Date checkInDate = null;
            Date checkOutDate = null;
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            try {
                checkInDate = new Date(dateFormat.parse(checkInStr).getTime());
                checkOutDate = new Date(dateFormat.parse(checkOutStr).getTime());
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
                    request.getSession().setAttribute("message", "Booking Successful!");
                    response.sendRedirect("bookings.jsp");

                } else {
                    request.getSession().setAttribute("message", "Booking could not be created!");
                    response.sendRedirect("payment.jsp?error=Booking could not be created");
                }
            } catch (Exception e) {
                // Log the exception and redirect to an error page
                e.printStackTrace(); // Consider logging this properly
                response.sendRedirect("payment.jsp?error=Payment exception"+ e.getMessage());
            }

        } else {
            response.sendRedirect("payment.jsp?error=Payment fatal error");
            request.getSession().setAttribute("message", "Payment Failed");
        }
    }
}
