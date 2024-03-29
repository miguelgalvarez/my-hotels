<%@ page import="java.util.List" %>
<%@ page import="com.hotels.Hotel" %>
<%@ page import="com.hotels.HotelService" %>
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
            flex: 0 0 200px; /* Fixed width */
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
            margin-bottom: 10px; /* Added for spacing */
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
            margin: 10px 0; /* Added for spacing */
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
    HotelService service = new HotelService();
    List<Hotel> hotels = null;
    try {
        hotels = service.getHotels(); // Fetch the list of hotels from your database
    } catch (Exception e) {
        out.println("<p>Error fetching hotels: " + e.getMessage() + "</p>");
    }
%>
<div class="container">
    <div class="filters">
<div class="filters">
        <h2>Filters</h2>
        <label for="Hotel-Chain">Hotel Chain:</label>
        <select id="Hotel-Chain" class="filter-dropdown" onchange="filterHotels()">
            <option value="0">All</option>
            <option value="1">Hotel-Chain 1</option>
            <option value="2">Hotel-Chain 2</option>
            <option value="3">Hotel-Chain 3</option>
            <option value="4">Hotel-Chain 4</option>
            <option value="5">Hotel-Chain 5</option>
        </select>
        <label for="Hotel-Type">Hotel Type:</label>
        <select id="Hotel-Type" class="filter-dropdown" onchange="filterHotels()">
            <option value="0">All</option>
            <option value="1">Budget</option>
            <option value="2">Mid-Range</option>
            <option value="3">Luxury</option>
        </select>
        <label for="Max-Rooms">Max Rooms:</label>
        <select id="Max-Rooms" class="filter-dropdown" onchange="filterHotels()">
            <option value="0">All</option>
            <option value="1">Less than 50</option>
            <option value="2">50-100</option>
            <option value="3">More than 100</option>
        </select>
    </div>
        </div>
    <div class="hotels">
        <% if (hotels != null) {
            for (Hotel hotel : hotels) {
        %>
                <div class="hotel" data-HotelChain="<%= hotel.getHotelChainID() %>" data-HotelType="<%= hotel.getHotelCategory() %>" data-MaxRooms="<%= hotel.getNumRooms() %>">
                        <a href="rooms.jsp?hotelId=<%= hotel.getID() %>">
                        <h3><%= hotel.getHotelName() %></h3>
                        <div class="hotel-info">
                            <p>Hotel Chain: <%= hotel.getHotelChainID() %></p>
                            <p>Hotel Type: <%= hotel.getHotelCategory() %></p>
                            <p>Max Rooms: <%= hotel.getNumRooms() %></p>
                        </div>
                    </a>
                </div>
        <%
            }
        } %>
    </div>
</div>

<script>
    function filterHotels() {
        const hotelChainFilter = document.getElementById('Hotel-Chain').value;
        const hotelTypeFilter = document.getElementById('Hotel-Type').value;
        const maxRoomsFilter = document.getElementById('Max-Rooms').value;

        const hotels = document.querySelectorAll('.hotel');

        hotels.forEach(hotel => {
            const hotelChain = parseInt(hotel.getAttribute('data-HotelChain'));
            const hotelType = parseInt(hotel.getAttribute('data-HotelType'));
            const maxRooms = parseInt(hotel.getAttribute('data-MaxRooms'));

            const hotelChainPass = hotelChainFilter == 0 || hotelChain == hotelChainFilter;
            const hotelTypePass = hotelTypeFilter == 0 || hotelType == hotelTypeFilter;
            const maxRoomsPass = maxRoomsFilter == 0 ||
                (maxRoomsFilter == 1 && maxRooms < 50) ||
                (maxRoomsFilter == 2 && maxRooms >= 50 && maxRooms <= 100) ||
                (maxRoomsFilter == 3 && maxRooms > 100);

            if (hotelChainPass && hotelTypePass && maxRoomsPass) {
                hotel.style.display = 'block';
            } else {
                hotel.style.display = 'none';
            }
        });
    }

    // Initial filtering
    filterHotels();
</script>

</body>
</html>
