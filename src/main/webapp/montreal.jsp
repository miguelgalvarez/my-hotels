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
        <!-- Your filters here -->
    </div>
    <div class="hotels">
        <% if (hotels != null) {
            for (Hotel hotel : hotels) {
        %>
                <div class="hotel" data-HotelChain="<%= hotel.getHotelChainID() %>" data-type="<%= hotel.getHotelCategory() %>" data-MaxRooms="<%= hotel.getNumRooms() %>">
                    <a href="rooms.jsp">
                        <h3><%= hotel.getHotelName() %></h3>
                        <div class="hotel-info">
                            <p>Hotel Chain: <%= hotel.getHotelChainID() %></p>
                            <p>Type: <%= hotel.getHotelCategory() %></p>
                            <p>Max Rooms: <%= hotel.getNumRooms() %></p>
                            <!-- You can add more hotel details here -->
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
        const typeFilter = document.getElementById('type').value;
        const maxRoomsFilter = document.getElementById('Max-Rooms').value;

        const hotels = document.querySelectorAll('.hotel');

        hotels.forEach(hotel => {
            const hotelChain = parseInt(hotel.getAttribute('data-HotelChain'));
            const type = parseInt(hotel.getAttribute('data-type'));
            const maxRooms = parseInt(hotel.getAttribute('data-MaxRooms'));

            const hotelChainPass = hotelChainFilter == 0 || hotelChain == hotelChainFilter;
            const typePass = typeFilter == 0 || type == typeFilter;
            const maxRoomsPass = maxRoomsFilter == 0 ||
                (maxRoomsFilter == 1 && maxRooms < 50) ||
                (maxRoomsFilter == 2 && maxRooms >= 50 && maxRooms <= 100) ||
                (maxRoomsFilter == 3 && maxRooms > 100);

            if (hotelChainPass && typePass && maxRoomsPass) {
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
