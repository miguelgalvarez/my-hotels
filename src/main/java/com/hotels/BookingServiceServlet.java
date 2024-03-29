package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.hotels.BookingService;

import java.io.IOException;
import java.util.List;

@WebServlet("/getBookings")
public class BookingServiceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        BookingService service = new BookingService();
        List<Booking> bookings = null;
        try {
            bookings = service.getBookings(roomId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

