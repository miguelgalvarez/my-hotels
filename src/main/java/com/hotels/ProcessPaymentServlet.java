package com.hotels;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIDstr = request.getParameter("bookingID");
        int bookingID = Integer.parseInt(bookingIDstr);

        PaymentService paymentService = new PaymentService();

        try {
            boolean success = paymentService.updatePaymentStatus(bookingID);

            if (success) {
                request.getSession().setAttribute("message", "Payment successfully processed");
            } else {
                request.getSession().setAttribute("message", "Payment Failed");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("message", "Error with Payment" + e.getMessage());
        } finally {
            response.sendRedirect("employee.jsp");
        }
    }
}
