<%@ page import="java.util.List, java.util.ArrayList, java.text.SimpleDateFormat" %>
<%@ page import="com.hotels.Room, com.hotels.RoomService, com.hotels.BookingService, com.hotels.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Montreal Hotels</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --main-colour: #2596be;
            --lighter-colour: #36bbeb;
            --darker-colour: #1f7999;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .container {
            display: flex;
            padding: 20px;
        }
        .filters {
            flex: 0 0 200px;
            background-color: #f9f9f9;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-right: 20px;

        }
        .filters h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .filters label, .filters select {
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            width: 100%;
            margin-bottom: 10px;
        }

        .filters input {
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            width: 90%;
            margin-bottom: 10px;
            margin-right: 10px;
        }

        .filters select:hover, .filters input:hover {
            background-color: #eaeaea;
        }
        .hotels {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .hotel {
            width: calc(33.333% - 20px);
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            display: flex;
            flex-direction: column;
            max-height: 200px;
        }
        .hotel:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }
        .hotel h3 {
            background-color: var(--main-colour);
            color: white;
            text-align: center;
            margin: 0;
            padding: 15px 0;
        }
        .hotel-info {
            padding: 20px;
            overflow: auto;
            max-height: 100px;
        }
        .hotel-info p {
            margin: 10px 0;
        }
        a:visited, a:link {
           color: inherit;
           text-decoration: none;
        }
        a:active {
            color: inherit;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<%
    int hotelId = Integer.parseInt(request.getParameter("hotelId"));
    RoomService roomService = new RoomService();
    BookingService bookingService = new BookingService();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    List<Room> rooms = null;
    StringBuilder bookingsJson = new StringBuilder("[");

    try {
        rooms = roomService.getRooms(hotelId);
        List<Booking> bookings = new ArrayList<>();
        if(rooms != null && !rooms.isEmpty()) {
            for(Room room : rooms) {
                List<Booking> roomBookings = bookingService.getBookings(room.getRoomID());
                for (Booking booking : roomBookings) {
                    if(bookingsJson.length() > 1) {
                        bookingsJson.append(",");
                    }
                    bookingsJson.append(String.format(
                        "{\"roomID\":%d, \"checkIn\":\"%s\", \"checkOut\":\"%s\"}",
                        booking.getRoomID(), sdf.format(booking.getCheckIn()), sdf.format(booking.getCheckOut())
                    ));
                }
            }
        }
        bookingsJson.append("]");
    } catch (Exception e) {
        out.println("<p>Error fetching rooms or bookings: " + e.getMessage() + "</p>");
    }
%>

<div class="container">
    <div class="filters">
        <h2>Filters</h2>
        <label for="price">Price Range:</label>
        <select id="price" class="filter-dropdown">
            <option value="0">All</option>
            <option value="1">Under $99</option>
            <option value="2">$100 - $200</option>
            <option value="3">Over $200</option>
        </select>

        <label for="start-date">Start Date:</label>
        <input type="date" id="start-date" class="filter-dropdown">

        <label for="end-date">End Date:</label>
        <input type="date" id="end-date" class="filter-dropdown">

        <label for="capacity">Capacity:</label>
        <select id="capacity" class="filter-dropdown">
            <option value="0">All</option>
            <option value="1">1 guest</option>
            <option value="2">2 guests</option>
            <option value="3">3 guests</option>
            <option value="4">4 guests</option>
        </select>
        <button onclick="filterRooms()">Search</button>
    </div>
    <div class="hotels">
        <% if (rooms != null) {
            for (Room room : rooms) { %>
                <div class="hotel" onclick="redirectToPayment(<%= room.getRoomID() %>)" data-price="<%= room.getPrice() %>" data-capacity="<%= room.getCapacity() %>" data-roomId="<%= room.getRoomID() %>">
                    <h3>Room <%= room.getID() %></h3>
                    <div class="hotel-info">
                        <p>Price Per Day: $<%= room.getPrice() %></p>
                        <p>Capacity: <%= room.getCapacity() %> guests</p>
                        <p>Amenities: <%= room.getAmeneties() %></p>
                    </div>
                </div>
        <%    }
        } %>
    </div>
</div>

<script>
    var bookingsData = <%=bookingsJson.toString()%>;

    document.addEventListener('DOMContentLoaded', function () {
        const today = new Date().toISOString().split('T')[0];
        const startDate = document.getElementById('start-date');
        const endDate = document.getElementById('end-date');

        startDate.setAttribute('min', today);
        endDate.setAttribute('min', today);

        startDate.value = today;
        endDate.value = today;

        startDate.addEventListener('change', function() {
            endDate.setAttribute('min', startDate.value);
            if (endDate.value < startDate.value) {
                endDate.value = startDate.value;
            }
        });
    });

    function redirectToPayment(roomId) {
        const startDate = document.getElementById('start-date').value;
        const endDate = document.getElementById('end-date').value;
        const start = new Date(startDate);
        const end = new Date(endDate);
        const diffTime = Math.abs(end - start);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        const url = `payment.jsp?roomId=${roomId}&numberOfDays=${diffDays}`;
        window.location.href = url;
    }

    function filterRooms() {
        const priceFilter = document.getElementById('price').value;
        const startDate = new Date(document.getElementById('start-date').value);
        const endDate = new Date(document.getElementById('end-date').value);
        const capacityFilter = document.getElementById('capacity').value;
        const rooms = document.querySelectorAll('.hotel');

        rooms.forEach(room => {
            const roomId = parseInt(room.getAttribute('data-roomId'), 10);
            const price = parseInt(room.getAttribute('data-price'), 10);
            const capacity = parseInt(room.getAttribute('data-capacity'), 10);
            const roomBookings = bookingsData.filter(booking => booking.roomID === roomId);
            let dateAvailable = !roomBookings.some(booking => {
                const bookingStart = new Date(booking.checkIn);
                const bookingEnd = new Date(booking.checkOut);
                return bookingStart < endDate && bookingEnd > startDate;
            });

            let pricePass = false;
            switch(priceFilter) {
                case '0': pricePass = true; break;
                case '1': pricePass = price < 99; break;
                case '2': pricePass = price >= 100 && price <= 200; break;
                case '3': pricePass = price > 200; break;
            }

            const capacityPass = capacityFilter === '0' || capacity === parseInt(capacityFilter, 10);
            room.style.display = (dateAvailable && pricePass && capacityPass) ? '' : 'none';
        });
    }
</script>

</body>
</html>
