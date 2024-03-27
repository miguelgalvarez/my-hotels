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
        String providedPassword = request.getParameter("password");

        ConnectionDB db = new ConnectionDB();
        try (Connection connection = db.getConnection()) { // Assume Database.getConnection() is your method to get a DB connection
            String sql = "SELECT password FROM customer WHERE username = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);

                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    String storedHash = rs.getString("password");
                    if (BCrypt.checkpw(providedPassword, storedHash)) {
                        // Login success
                        request.getSession().setAttribute("username", username);// Simple session management


                        /*query username to get customer ID and add it to session */



                        request.getSession().setAttribute("message", "Login successful!");
                        response.sendRedirect("index.jsp");
                    } else {
                        // Password incorrect
                        request.getSession().setAttribute("message", "Invalid username or password.");
                        response.sendRedirect("signin.jsp");
                    }
                } else {
                    // Username does not exist
                    request.getSession().setAttribute("message", "Invalid username or password.");
                    response.sendRedirect("signin.jsp");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

