<%@ page import="java.util.ArrayList,java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Hotel Bookings</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 16px;
            display: flex;
            flex-direction: column;
            gap: 10px;

        }

        .booking-title {
            margin-top: 20px;
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .booking-card {
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            margin-bottom: 20px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        .hotel-name {
            font-size: 22px;
            color: #f29602;
            margin-bottom: 10px;
        }

        .dates {
            font-size: 18px;
            color: #666;
        }

        .details {
            font-size: 18px;
            color: #666;
        }

        .price {
            font-size: 24px;
            color: #333;
            font-weight: bold;
            margin-bottom: 0;
        }

        .booking-info {
            flex: 1;
        }

        /*login/register buttons*/

        .auth-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;

        }

        .auth-buttons a {
            padding: 10px 20px;
            background-color: #f29602;
            color: white;
            text-decoration: none;
            border-radius: 12px;
            transition: background-color 0.3s;
            box-sizing: border-box;
            width: 100px;
            text-align: center;
        }

        .auth-buttons a:hover {
            background-color: #e08502; /* Darker shade for hover state */
        }

    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <h2 class="booking-title">Your Bookings</h2>
    <% if (session.getAttribute("username") != null) { %>
        <%-- User is logged in, display bookings --%>
        <%
            // Enhanced Booking class with additional details
            class Booking {
                String bookingId;
                String hotelName;
                String checkInDate;
                String checkOutDate;
                double pricePaid;
                int numOfRooms;
                public Booking(String bookingId, String hotelName, String checkInDate, String checkOutDate, double pricePaid, int numOfRooms) {
                    this.bookingId = bookingId;
                    this.hotelName = hotelName;
                    this.checkInDate = checkInDate;
                    this.checkOutDate = checkOutDate;
                    this.pricePaid = pricePaid;
                    this.numOfRooms = numOfRooms;
                }
            }

            //getting all bookings of a customer
            List<Booking> bookings = new ArrayList<>();

            bookings.add(new Booking("000312", "Hotel Sunshine", "2024-03-01", "2024-03-05", 299.99, 2));
            bookings.add(new Booking("03312", "Sea View Resort", "2024-04-15", "2024-04-20", 499.99, 1));

            // Displaying enhanced bookings
            for (Booking booking : bookings) {
        %>
            <div class="booking-card">
                <div class="booking-info">
                    <div class="hotel-name"><%= booking.hotelName %></div>
                    <div class="details">Booking ID: <%= booking.bookingId %></div>
                    <div class="details">Check-in: <%= booking.checkInDate %></div>
                    <div class="details">Check-out: <%= booking.checkOutDate %></div>
                    <div class="details">Number of Rooms: <%= booking.numOfRooms %></div>
                </div>
                <div class="price">$<%= booking.pricePaid %></div>
            </div>
        <%
            }
        %>
    <% } else { %>
        <%-- No user is logged in, display login and register buttons --%>
        <div class="booking-title">
            Please log in or register to view your bookings.
        </div>
        <div class="auth-buttons">
            <a href="signin.jsp" class = "login-btn">Log In</a>
            <a href="register.jsp" class="register-btn">Register</a>
        </div>
    <% } %>
</div>

</body>
</html>
