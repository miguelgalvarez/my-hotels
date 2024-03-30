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
            flex: 0 0 250px; /* Updated width for more space */
            background-color: #f9f9f9;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            gap: 15px; /* Adjusted gap for a neater look */
            margin-right: 20px;
        }
        .filters h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }
        .filters label {
            font-size: 16px; /* Larger font size for clarity */
            font-weight: 600;
            color: #333; /* Dark color for better contrast */
            margin-bottom: 5px;
        }
        .filters select,  .filters button {
            padding: 12px;
            border: 2px solid;
            border-radius: 8px;
            width: 100%;
            font-size: 16px;
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
        .filters button {
            background-color: #007bff;
            color: white;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .filters button:hover {
            background-color: #0056b3;
        }
        .filters select:hover, .filters input:hover {
            background-color: #d0e7ff; /* Slightly darker blue on hover for inputs */
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

<% if (session.getAttribute("username") != null) { %>
    <meta name="user-status" content="logged-in">
<% } else { %>
    <meta name="user-status" content="logged-out">
<% } %>

</head>
<body>
<jsp:include page="navbar.jsp" />
<jp:include page = "popup.jsp" />

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

        <label for="start-date">Check In Date:</label>
        <input type="date" id="start-date" class="filter-dropdown">

        <label for="end-date">Check Out Date:</label>
        <input type="date" id="end-date" class="filter-dropdown">

        <label for="capacity">Number of Guests:</label>
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
                <%String amenities = room.getAmenities().replace("'", "\\'"); %>
                <div class="hotel" onclick="checkLoginStatus(<%=room.getRoomID()%>, <%=room.getPrice()%>, '<%=amenities%>')" data-price="<%= room.getPrice() %>" data-capacity="<%= room.getCapacity() %>" data-roomID="<%= room.getRoomID() %>">
                    <h3>Room <%= room.getID() %></h3>
                    <div class="hotel-info">
                        <p>Price Per Day: $<%= room.getPrice() %></p>
                        <p>Capacity: <%= room.getCapacity() %> guests</p>
                        <p>Amenities: <%= room.getAmenities() %></p>
                    </div>
                </div>
        <%    }
        } %>
    </div>
</div>

<script>
    var bookingsData = <%=bookingsJson.toString()%>;
        document.addEventListener('DOMContentLoaded', function () {
        const today = new Date();
        const oneWeekFromToday = new Date(today);
        oneWeekFromToday.setDate(oneWeekFromToday.getDate() + 7); // Setting 'oneWeekFromToday' as one week after today
        const oneDayAfterOneWeekFromToday = new Date(oneWeekFromToday);
        oneDayAfterOneWeekFromToday.setDate(oneDayAfterOneWeekFromToday.getDate() + 1); // Setting this as one day after one week from today

        const startDate = document.getElementById('start-date');
        const endDate = document.getElementById('end-date');

        // Setting the minimum selectable dates
        startDate.setAttribute('min', oneWeekFromToday.toISOString().split('T')[0]);
        endDate.setAttribute('min', oneWeekFromToday.toISOString().split('T')[0]);

        // Set the start date to one week from today and the end date to one day after that by default
        startDate.value = oneWeekFromToday.toISOString().split('T')[0];
        endDate.value = oneDayAfterOneWeekFromToday.toISOString().split('T')[0];

        startDate.addEventListener('change', function() {
            const selectedStartDate = new Date(startDate.value);
            const dayAfterSelectedStartDate = new Date(selectedStartDate);
            dayAfterSelectedStartDate.setDate(dayAfterSelectedStartDate.getDate() + 1);

            endDate.setAttribute('min', dayAfterSelectedStartDate.toISOString().split('T')[0]);

            // Automatically adjust the end date to be at least one day after the start date
            // if the current end date is less than or equal to the new start date
            if (new Date(endDate.value) <= selectedStartDate) {
                endDate.value = dayAfterSelectedStartDate.toISOString().split('T')[0];
            }
        });
    });


    function checkLoginStatus(roomID, price, amenities) {
        const userStatus = document.querySelector('meta[name="user-status"]').getAttribute('content');

        if (userStatus === "logged-in") {
            redirectToPayment(roomID, price, amenities); // User is logged in, proceed to payment
        } else {
            // Encode the current URL and append it as a query parameter
            const currentUrl = encodeURIComponent(window.location.href);
            window.location.href = `loginOrRegister.jsp?returnUrl=${currentUrl}`;
        }
    }

    function redirectToPayment(roomID, price, amenities) {
        const startDate = document.getElementById('start-date').value;
        const endDate = document.getElementById('end-date').value;
        let capacityFilter = document.getElementById('capacity').value;

        // Default to 1 guest if 'All' is selected
        const numberOfGuests = capacityFilter === "0" ? "1" : capacityFilter;

        const start = new Date(startDate);
        const end = new Date(endDate);
        const diffTime = Math.abs(end - start);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        const encodedAmenities = encodeURIComponent(amenities);
        const cost = price * diffDays;
        const url = `bookingSummary.jsp?roomID=${roomID}&numberOfDays=${diffDays}&price=${price}&checkIN=${startDate}&checkOut=${endDate}&capacity=${numberOfGuests}&amenities=${encodedAmenities}&cost=${cost}`;

        window.location.href = url;
    }


function filterRooms() {
    const priceFilter = document.getElementById('price').value;
    const startDate = new Date(document.getElementById('start-date').value);
    const endDate = new Date(document.getElementById('end-date').value);
    let capacityFilter = document.getElementById('capacity').value;
    const rooms = document.querySelectorAll('.hotel');

    capacityFilter = capacityFilter === "0" ? "4" : capacityFilter;

    rooms.forEach(room => {
        const roomID = parseInt(room.getAttribute('data-roomID'), 10);
        const price = parseInt(room.getAttribute('data-price'), 10);
        const capacity = parseInt(room.getAttribute('data-capacity'), 10);
        const roomBookings = bookingsData.filter(booking => booking.roomID === roomID);
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

        const capacityPass = capacity <= parseInt(capacityFilter, 10);

        room.style.display = (dateAvailable && pricePass && capacityPass) ? '' : 'none';
    });
}

</script>

</body>
</html>
