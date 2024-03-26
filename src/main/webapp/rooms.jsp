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

<div class="container">
    <div class="filters">
        <h2>Filters</h2>
        <label for="price">Price:</label>
        <select id="price" class="filter-dropdown">
            <option value="0">Lowest First</option>
            <option value="1">Highest First</option>
        </select>
        <label for="type">Type:</label>
        <select id="type" class="filter-dropdown">
            <option value="0">All</option>
            <option value="1">Single</option>
            <option value="2">Double</option>
            <option value="3">Suite</option>
        </select>
        <label for="capacity">Capacity:</label>
        <select id="capacity" class="filter-dropdown">
            <option value="0">All</option>
            <option value="1">1 guest</option>
            <option value="2">2 guests</option>
            <option value="3">3 guests</option>
            <option value="4">4 guests</option>
        </select>
    </div>
    <div class="hotels">
        <div class="hotel">
            <a href="payment.jsp">
                <h3>Room 1</h3>
                <div class="hotel-info">
                    <p>Price: $25000</p>
                    <p>Type: Double</p>
                    <p>Capacity: 2 guests</p>
                </div>
            </a>
        </div>
        <div class="hotel">
            <a href="payment.jsp">
                <h3>Room 2</h3>
                <div class="hotel-info">
                    <p>Price: $100</p>
                    <p>Type: Suite</p>
                    <p>Capacity: 4 guests</p>
                </div>
            </a>
        </div>
        <!-- Add more hotel entries here -->
    </div>
</div>

</body>
</html>
