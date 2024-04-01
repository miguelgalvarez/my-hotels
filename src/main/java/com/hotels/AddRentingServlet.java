package com.hotels;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@WebServlet("/addRenting")
public class AddRentingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomIDstr = request.getParameter("roomID");
        int roomID = Integer.parseInt(roomIDstr);

        String checkInStr = request.getParameter("checkInDate");
        String checkOutStr = request.getParameter("checkOutDate");

        Date checkInDate = null;
        Date checkOutDate = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            checkInDate = new Date(dateFormat.parse(checkInStr).getTime());
            checkOutDate = new Date(dateFormat.parse(checkOutStr).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Renting renting = new Renting(roomID, checkInDate, checkOutDate);

        RentingService rentingService = new RentingService();

        try {
            boolean success = rentingService.createRenting(renting);
            if (success) {
                request.getSession().setAttribute("message", "Renting successfully created");
            } else {
                request.getSession().setAttribute("message", "Failed to create renting");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("message", "Error creating renting: " + e.getMessage());
        }
        response.sendRedirect("employee.jsp");
    }
}


