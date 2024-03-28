<%@ page import="java.util.List" %>
<%@ page import="com.hotels.Room" %>
<%@ page import="com.hotels.RoomService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Montreal Hotels</title>
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
        .filters select:hover {
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
        }
        .hotel:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }
        .hotel h3 {
            background-color: #f29602;
            color: white;
            text-align: center;
            margin: 0;
            padding: 15px 0;
        }
        .hotel-info {
            padding: 20px;
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
    RoomService roomService = new RoomService();
    List<Room> rooms = null;
    try {
        rooms = roomService.getRooms();
    } catch (Exception e) {
        out.println("<p>Error fetching rooms: " + e.getMessage() + "</p>");
    }
%>

<div class="container">
    <div class="filters">
        <h2>Filters</h2>
        <label for="price">Price Range:</label>
        <select id="price" class="filter-dropdown" onchange="filterRooms()">
            <option value="0">All</option>
            <option value="1">Under $99</option>
            <option value="2">$100 - $200</option>
            <option value="3">Over $200</option>
        </select>

        <label for="start-date">Start Date:</label>
        <input type="date" id="start-date" class="filter-dropdown" onchange="filterRooms()">

        <label for="end-date">End Date:</label>
        <input type="date" id="end-date" class="filter-dropdown" onchange="filterRooms()">

        <label for="capacity">Capacity:</label>
        <select id="capacity" class="filter-dropdown" onchange="filterRooms()">
            <option value="0">All</option>
            <option value="1">1 guest</option>
            <option value="2">2 guests</option>
            <option value="3">3 guests</option>
            <option value="4">4 guests</option>
        </select>
    </div
    <div class="hotels">
        <% if (rooms != null) {
            for (Room room : rooms) { %>
                <div class="hotel" data-price="<%= room.getPrice() %>" data-capacity="<%= room.getCapacity() %>">
                    <a href="payment.jsp?roomId=<%= room.getRoomID() %>">
                        <h3>Room <%= room.getRoomID() %></h3>
                        <div class="hotel-info">
                            <p>Price: $<%= room.getPrice() %></p>
                            <p>Capacity: <%= room.getCapacity() %> guests</p>
                        </div>
                    </a>
                </div>
        <%    }
        } %>
    </div>
</div>
<script>
    function filterRooms() {
        const priceFilter = document.getElementById('price').value;
        const startDate = document.getElementById('start-date').value;
        const endDate = document.getElementById('end-date').value;
        const capacityFilter = document.getElementById('capacity').value;

        const rooms = document.querySelectorAll('.hotel');

        rooms.forEach(room => {
            const price = parseInt(room.getAttribute('data-price'), 10);
            const capacity = parseInt(room.getAttribute('data-capacity'), 10);
            let pricePass = false;

            switch(priceFilter) {
                case '0': // All prices
                    pricePass = true;
                    break;
                case '1': // Under $99
                    pricePass = price < 99;
                    break;
                case '2': // $100 - $200
                    pricePass = price >= 100 && price <= 200;
                    break;
                case '3': // Over $200
                    pricePass = price > 200;
                    break;
            }

            const capacityPass = capacityFilter === '0' || capacity === parseInt(capacityFilter, 10);

            if (pricePass && capacityPass) {
                room.style.display = '';
            } else {
                room.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>
