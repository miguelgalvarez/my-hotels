<%@ page import="java.net.URLEncoder" %>

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
            margin: 0 auto;
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
        .payment-button {
            display: inline-block;
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="summary-container">
    <h2>Booking Summary</h2>
    <div class="summary-detail">Hotel Name: <span class="highlight">HOTEL NAME PLACEHOLDER</span></div>
    <div class="summary-detail">Room Name: <span class="highlight">ROOM NAME PLACEHOLDER</span></div>
    <div class="summary-detail">Cost: <span class="highlight"><%= request.getParameter("cost") %></span></div>
    <div class="summary-detail">Capacity: <span class="highlight"><%= request.getParameter("capacity")%> guests</span></div>
    <div class="summary-detail">Amenities: <span class="highlight"><%= request.getParameter("amenities") %></span></div>
    <div class="summary-detail">Check-in Date: <span class="highlight"><%= request.getParameter("checkIN") %></span></div>
    <div class="summary-detail">Check-out Date: <span class="highlight"><%= request.getParameter("checkOut") %></span></div>

    <!-- Optionally, add a button or link for the user to perform actions like edit or print the booking -->
    <a href="payment.jsp?numberOfDays=<%= URLEncoder.encode(request.getParameter("numberOfDays"), "UTF-8") %>&price=<%= URLEncoder.encode(request.getParameter("price"), "UTF-8") %>&capacity=<%= URLEncoder.encode(request.getParameter("capacity"), "UTF-8") %>&amenities=<%= URLEncoder.encode(request.getParameter("amenities"), "UTF-8") %>&checkInDate=<%= URLEncoder.encode(request.getParameter("checkIN"), "UTF-8") %>&checkOutDate=<%= URLEncoder.encode(request.getParameter("checkOut"), "UTF-8") %>" class="payment-button">Continue to Payment</a>

</div>
</body>
</html>
