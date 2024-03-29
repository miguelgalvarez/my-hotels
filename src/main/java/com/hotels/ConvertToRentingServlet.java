package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/convertToRenting")
public class ConvertToRentingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomIDstr = request.getParameter("roomID");
        int roomID = Integer.parseInt(roomIDstr);
        JSONObject jsonResponse = new JSONObject();

        try {
            RentingService rentingService = new RentingService();
            boolean success = rentingService.bookingToRenting(roomID);

            jsonResponse.put("success", success);
            if (success) {
                jsonResponse.put("message", "Booking successfully converted to renting!");
            } else {
                jsonResponse.put("message", "Booking failed to convert to renting.");
            }
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Error converting booking: " + e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }
}

