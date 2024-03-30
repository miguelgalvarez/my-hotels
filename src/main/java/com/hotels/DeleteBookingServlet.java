package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdStr = request.getParameter("bookingID");
        int bookingId = Integer.parseInt(bookingIdStr);
        BookingService bookingService = new BookingService();

        try {
            String message = bookingService.deleteBooking(bookingId);
            request.getSession().setAttribute("message", message);
        } catch (Exception e) {
            request.getSession().setAttribute("message", "Error deleting booking: " + e.getMessage());
        } finally {
            response.sendRedirect("bookings.jsp");
        }
    }
}
