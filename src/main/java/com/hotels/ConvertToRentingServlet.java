package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/convertToRenting")
public class ConvertToRentingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIDstr = request.getParameter("bookingID");
        int bookingID = Integer.parseInt(bookingIDstr);

        try {
            RentingService rentingService = new RentingService();
            boolean success = rentingService.bookingToRenting(bookingID);
            if (success) {
                request.getSession().setAttribute("message", "Booking successfully converted to renting");
            } else {
                request.getSession().setAttribute("message", "Booking failed to convert to renting");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("message", "Error converting booking: " + e.getMessage());
        }
        response.sendRedirect("employee.jsp");
    }
}

