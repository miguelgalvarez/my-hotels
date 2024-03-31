<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.hotels.Room, com.hotels.HotelService, com.hotels.RoomService, com.hotels.BookingService, com.hotels.Booking" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .summary-container {
            width: 80%;
            margin: 40px auto; /* Adjusted margin-top */
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .summary-detail {
            margin-bottom: 10px;
            font-size: 16px;
        }
        .highlight {
            font-weight: bold;
        }
        .button-container {
            width: 400px;
            display: flex;
            justify-content: space-between;
            margin-top: 20px; /* Add some space between text and buttons */
        }
        .payment-button {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            width: 200px; /* Set the width to half of the container minus margin */
        }
        .go-back-button {
            background-color: #ccc; /* Gray */
            color: #fff; /* White text */
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            width: 200px; /* Set the width to half of the container minus margin */
        }
    </style>
</head>
<body>
<%
    int hotelId = Integer.parseInt(request.getParameter("hotelId"));
    HotelService hotelService = new HotelService();
    String hotelID = hotelService.getHotelName(hotelId);
%>
<jsp:include page="navbar.jsp" />
<div class="summary-container">
    <h2>Booking Summary</h2>
    <div class="text-container">
        <div class="summary-detail">Hotel Name: <span class="highlight"><%= hotelID %></span></div>
        <div class="summary-detail">Room Number: <span class="highlight"><%= request.getParameter("roomID")%></span></div>
        <div class="summary-detail">Cost: <span class="highlight"><%= request.getParameter("cost") %></span></div>
        <div class="summary-detail">Capacity: <span class="highlight"><%= request.getParameter("capacity")%> guests</span></div>
        <div class="summary-detail">Amenities: <span class="highlight"><%= request.getParameter("amenities") %></span></div>
        <div class="summary-detail">Check-in Date: <span class="highlight"><%= request.getParameter("checkIN") %></span></div>
        <div class="summary-detail">Check-out Date: <span class="highlight"><%= request.getParameter("checkOut") %></span></div>
    </div>
    <!-- Button container for payment and go back buttons -->
    <div class="button-container">
        <!-- Go back button -->
        <a href="rooms.jsp?hotelId=<%= hotelId %>" class="go-back-button">Go Back</a>
        <!-- Continue to payment button -->
        <a href="payment.jsp?numberOfDays=<%= URLEncoder.encode(request.getParameter("numberOfDays"), "UTF-8") %>&price=<%= URLEncoder.encode(request.getParameter("price"), "UTF-8") %>&capacity=<%= URLEncoder.encode(request.getParameter("capacity"), "UTF-8") %>&amenities=<%= URLEncoder.encode(request.getParameter("amenities"), "UTF-8") %>&checkInDate=<%= URLEncoder.encode(request.getParameter("checkIN"), "UTF-8") %>&checkOutDate=<%= URLEncoder.encode(request.getParameter("checkOut"), "UTF-8") %>" class="payment-button">Continue to Payment</a>
    </div>
</div>
</body>
</html>
