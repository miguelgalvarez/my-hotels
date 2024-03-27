package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get session if exists, null otherwise
        if (session != null) {
            session.removeAttribute("username");
        }

        // Set a message to be displayed after redirecting
        request.getSession().setAttribute("message", "Logged out successfully");

        response.sendRedirect("index.jsp"); // Redirect to main page
    }
}

