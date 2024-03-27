package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Customer newCustomer = new Customer(username, password);
        CustomerService customerService = new CustomerService();

        try {
            boolean success = customerService.validateCustomer(newCustomer);

            if (success) {
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("customerID", customerService.fetchCustomerID(username)); //query username to get customer ID and add it to session

                request.getSession().setAttribute("message", "Login successful!");
                response.sendRedirect("index.jsp");
            } else {
                request.getSession().setAttribute("message", "Invalid username or password.");
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

