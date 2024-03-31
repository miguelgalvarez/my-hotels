package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Set cache-control headers
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Customer newCustomer = new Customer(username, password);
        CustomerService customerService = new CustomerService();

        String returnUrl = request.getParameter("returnUrl");

        try {
            boolean success = customerService.validateCustomer(newCustomer);

            if (success) {
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("customerID", customerService.fetchCustomerID(username)); //query username to get customer ID and add it to session

                request.getSession().setAttribute("message", "Login successful!");

                if (returnUrl != null && !returnUrl.trim().isEmpty()) {
                    response.sendRedirect(URLDecoder.decode(returnUrl, "UTF-8"));
                } else {
                    response.sendRedirect("index.jsp");
                }

            } else {
                request.getSession().setAttribute("message", "Invalid username or password.");
                response.sendRedirect("login.jsp?returnUrl="+returnUrl);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

