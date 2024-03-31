<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>
<%@ page import="com.hotels.Room, com.hotels.HotelService, com.hotels.RoomService, com.hotels.BookingService, com.hotels.Booking" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Summary</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
        }
        .summary-container, .map-container {
            width: 80%;
            margin: 30px auto; /* Adjusted margin-top */
            /*padding: 30px;*/
            padding-left: 30px;
            padding-bottom: 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .button-container {
            width: 500px;
            display: flex;
            justify-content: space-between;
            margin-top: 20px; /* Add some space between text and buttons */
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
            border-radius: 8px;
            width: 200px; /* Set the width to half of the container minus margin */
        }
        .go-back-button {
            background-color: #ccc; /* Gray */
            color: #fff; /* White text */
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border: none;
            border-radius: 8px;
            width: 200px; /* Set the width to half of the container minus margin */
        }

        #hotelMap {
            height: 400px; /* Adjust the height as necessary */
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
        <div class="summary-detail">Cost: <span class="highlight">$<%= String.format("%.2f", Float.parseFloat(request.getParameter("cost"))) %></span></div>
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
        <a href="payment.jsp?roomID=<%= URLEncoder.encode(request.getParameter("roomID"), "UTF-8") %>&numberOfDays=<%= URLEncoder.encode(request.getParameter("numberOfDays"), "UTF-8") %>&cost=<%= URLEncoder.encode(request.getParameter("cost"), "UTF-8") %>&capacity=<%= URLEncoder.encode(request.getParameter("capacity"), "UTF-8") %>&amenities=<%= URLEncoder.encode(request.getParameter("amenities"), "UTF-8") %>&checkIN=<%= URLEncoder.encode(request.getParameter("checkIN"), "UTF-8") %>&checkOut=<%= URLEncoder.encode(request.getParameter("checkOut"), "UTF-8") %>" class="payment-button">Continue to Payment</a>
    </div>
</div>

<div class="map-container">
    <div id="hotelMap"></div> <!-- The map will be inserted here -->
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAcgTK4ZHvxFLZUhhVc517SjqXMmx3yY4&callback=initMap" async defer></script>
<script>
    function initMap() {
        // Get the address from the URL parameter and decode it
        var address = "<%= URLDecoder.decode(request.getParameter("address"), "UTF-8") %>";

        // Use the Google Maps Geocoding API to get the location of the address
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': address}, function(results, status) {
            if (status === 'OK') {
                // Center the map at the address location
                var map = new google.maps.Map(document.getElementById('hotelMap'), {
                    zoom: 15,
                    center: results[0].geometry.location
                });

                // Place a marker at the address location
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }
</script>

</body>
</html>


