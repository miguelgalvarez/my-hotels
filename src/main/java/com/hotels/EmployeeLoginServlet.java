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

@WebServlet("/employeeLogin")
public class EmployeeLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("full name");
        String employeeNumber = request.getParameter("Employee Number");

        Employee newEmployee = new Employee(username, Integer.parseInt(employeeNumber));
        EmployeeService employeeService = new EmployeeService();

        try {
            boolean success = employeeService.validateEmployee(newEmployee);

            if (success) {
                request.getSession().setAttribute("name", username);
                request.getSession().setAttribute("employeeNumber", employeeNumber);

                request.getSession().setAttribute("message", "Login successful!");
                response.sendRedirect("employee.jsp");
            } else {
                request.getSession().setAttribute("message", "Invalid Employee Name or Number.");
                response.sendRedirect("employeeLogin.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

