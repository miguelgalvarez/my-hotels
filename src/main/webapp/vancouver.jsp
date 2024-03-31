<%@ page import="java.util.List" %>
<%@ page import="com.hotels.Hotel" %>
<%@ page import="com.hotels.HotelService" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vancouver Hotels</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
        :root {
            --main-colour: #2596be;
            --lighter-colour: #36bbeb;
            --darker-colour: #1f7999;
            --lightest-colour: #c0e1ed;
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
            padding: 10px;
        }
        .filters {
            flex-basis: 25%;
            flex: 0 0 400px; /* Fixed width */
            background-color: #f9f9f9;
            padding: 10px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        .filters h2 {
            font-size: 24px;
        }
        .filters label, .filters select {
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
            width: 80%;
        }
        .filters select:hover {
            background-color: var(--lightest-colour);
        }


        .hotels {
            flex: 3;
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

        #map {
            height: 200px; /* or your preferred size */
            width: 100%;
        }
        .map-container {
            position: fixed; /* Fix the position */
            bottom: 20px; /* Adjust based on your navbar height and desired position */
            left: 20px; /* Right align with some margin */
            height: 210px; /* or your preferred size */
            width: 350px; /* Adjust the width as per your requirement */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            background-color: white; /* Ensure it's visible over any background */
        }

    </style>
    </head>
<body>
<jsp:include page="navbar.jsp" />
<jsp:include page="popup.jsp" />
<%
    HotelService service = new HotelService();
    List<Hotel> hotels = null;
    List<String> hotelChains = null;
    try {
        hotels = service.getHotels("Vancouver"); // Fetch the list of hotels from your database
        hotelChains = service.getHotelChains(); // Fetch the list of distinct hotel chains from your database
    } catch (Exception e) {
        out.println("<p>Error fetching data: " + e.getMessage() + "</p>");
    }
%>
<div class="container">
    <div class="filters">
        <h2>Filters</h2>
        <label for="Hotel-Chain">Hotel Chain:</label>
        <select id="Hotel-Chain" class="filter-dropdown" onchange="filterHotels()">
            <option value="0">All</option>
            <% if (hotelChains != null) {
                for(String chain : hotelChains) {
            %>
                    <option value="<%= chain %>"><%= chain %></option>
            <%
                }
            } %>
        </select>

        <label for="Hotel-Type">Hotel Type:</label>
        <select id="Hotel-Type" class="filter-dropdown" onchange="filterHotels()">
            <option value="0">All</option>
            <option value="Budget">Budget</option>
            <option value="Mid-Range">Mid-Range</option>
            <option value="Luxury">Luxury</option>
        </select>
        <label for="Max-Rooms">Total Number Of Rooms:</label>
        <select id="Max-Rooms" class="filter-dropdown" onchange="filterHotels()">
            <option value="0">All</option>
            <option value="1">Less than 50</option>
            <option value="2">50-100</option>
            <option value="3">More than 100</option>
        </select>
    </div>
    <div class="hotels">
        <% if (hotels != null) {
            for (Hotel hotel : hotels) {
        %>
            <div class="hotel" data-HotelChain="<%= hotel.getHotelChainName() %>" data-HotelType="<%= hotel.getHotelCategory() %>" data-MaxRooms="<%= hotel.getNumRooms() %>">
                <a href="rooms.jsp?hotelId=<%= hotel.getID() %>">
                    <h3><%= hotel.getHotelName() %></h3>
                    <div class="hotel-info">
                        <p>Hotel Chain: <%= hotel.getHotelChainName() %></p>
                        <p>Hotel Type: <%= hotel.getHotelCategory() %></p>
                        <p>Available Rooms: <%= hotel.getNumRooms() %></p>
                    </div>
                </a>
            </div>
        <%
            }
        } %>
    </div>

    <div class="map-container">
        <div id="map"></div> <!-- The map will be inserted here -->
    </div>
</div>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAcgTK4ZHvxFLZUhhVc517SjqXMmx3yY4&callback=initMap" async defer></script>

<script>
    function filterHotels() {
        const hotelChainFilter = document.getElementById('Hotel-Chain').value;
        const hotelTypeFilter = document.getElementById('Hotel-Type').value;
        const maxRoomsFilter = document.getElementById('Max-Rooms').value;

        const hotels = document.querySelectorAll('.hotel');

        hotels.forEach(hotel => {
            const hotelChain = hotel.getAttribute('data-HotelChain');
            const hotelType = hotel.getAttribute('data-HotelType');
            const maxRooms = parseInt(hotel.getAttribute('data-MaxRooms'), 10); // Parse to integer

            const hotelChainPass = hotelChainFilter === "0" || hotelChain === hotelChainFilter;
            const hotelTypePass = hotelTypeFilter === "0" || hotelType === hotelTypeFilter;
            let maxRoomsPass = false;
            switch(maxRoomsFilter) {
                case "0":
                    maxRoomsPass = true;
                    break;
                case "1":
                    maxRoomsPass = maxRooms < 50;
                    break;
                case "2":
                    maxRoomsPass = maxRooms >= 50 && maxRooms <= 100;
                    break;
                case "3":
                    maxRoomsPass = maxRooms > 100;
                    break;
            }

            if (hotelChainPass && hotelTypePass && maxRoomsPass) {
                hotel.style.display = '';
            } else {
                hotel.style.display = 'none';
            }
        });
    }

    // Call the filterHotels function on page load to apply filters immediately
    document.addEventListener('DOMContentLoaded', filterHotels);


    //load the map
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 12,
            center: {lat: 49.2825992, lng: -123.126862} // Vancouver's latitude and longitude
        });

        var geocoder = new google.maps.Geocoder();

        <% if (hotels != null) {
            for (Hotel hotel : hotels) {
                String address = hotel.getAddress(); // Assuming getAddress() method exists
                String hotelInfo = "<div>" +
                                  "<strong>" + hotel.getHotelName() + "</strong><br>" +
                                  "Chain: " + hotel.getHotelChainName() + "<br>" +
                                  "Type: " + hotel.getHotelCategory() + "<br>" +
                                  "Rating: " + hotel.getRating() + "</div>";
        %>
                geocoder.geocode({'address': '<%=address%>'}, function(results, status) {
                    if (status === 'OK') {
                        var marker = new google.maps.Marker({
                            map: map,
                            position: results[0].geometry.location,
                            title: '<%=hotelInfo%>' // Adding hotel info as marker title
                        });
                        var infowindow = new google.maps.InfoWindow({
                            content: marker.title
                        });
                        marker.addListener('mouseover', function() {
                            infowindow.open(map, marker);
                        });
                        marker.addListener('mouseout', function() {
                            infowindow.close();
                        });
                    }
                });
        <%
            }
        } %>
    }

</script>




</body>
</html>
