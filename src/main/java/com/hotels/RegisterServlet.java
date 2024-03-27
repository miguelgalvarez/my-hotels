package com.hotels;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("full name");
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Plain text password
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String typeOfId = request.getParameter("type of ID");

        Customer newCustomer = new Customer(fullName, username, password, address, typeOfId, email);

        CustomerService addCustomer = new CustomerService();

        try {
           boolean success = addCustomer.createCustomer(newCustomer);

            if (success) {
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("message", "Registration successful!");
                response.sendRedirect("index.jsp");
            } else {
                request.getSession().setAttribute("message", "Registration failed.");
                response.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}