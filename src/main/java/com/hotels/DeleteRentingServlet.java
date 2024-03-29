package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteRenting")
public class DeleteRentingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set cache-control headers
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
        String bookingIdStr = request.getParameter("rentingID");
        int rentingID = Integer.parseInt(bookingIdStr);
        RentingService rentingService = new RentingService();

        try {
            String message = rentingService.deleteRenting(rentingID);
            System.out.println("message in servlet is"+message);
            request.getSession().setAttribute("message", message);
        } catch (Exception e) {
            request.getSession().setAttribute("message", "Error deleting booking: " + e.getMessage());
        } finally {
            response.sendRedirect("employee.jsp");
        }
    }
}
