<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotel Booking System</title>
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 16px; /* Rounded edges for the container */
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #666;
        }
        input[type="date"],
        select,
        button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 8px; /* Rounded edges for inputs, selects, and buttons */
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input[type="date"]:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }
        button {
            background-color: #f29602;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: 600; /* Slightly bolder font for the button */
            transition: background-color 0.3s, transform 0.2s;
        }
        button:hover {
            background-color: #FFAF45;
            transform: translateY(-2px); /* A subtle lift effect on hover */
        }

        /* Styles for location selector */
        .location-selector {
            display: flex;
            justify-content: space-around;
            padding: 10px;
        }

        .location-label {
            display: flex;
            flex-direction: column;
            align-items: center;
            cursor: pointer;
        }

        .location-label img {
            max-width: 100px; /* Adjust as needed */
            border-radius: 8px; /* Optional, for rounded corners on images */
            margin-bottom: 8px;
        }

        /* Hide the default radio button */
        .location-selector input[type="radio"] {
            display: none;
        }

        /* Styling for label when corresponding radio button is checked */
        .location-selector input[type="radio"]:checked + label {
            border: 2px solid #f29602; /* Highlight color */
            padding: 5px;
            border-radius: 8px;
        }

    </style>
</head>
<body>

<div class="navbar">
    <a href="/my-hotels" class="logo">myHotels</a>
    <a href="#stays">Stays</a>
    <a href="#bookings">Bookings</a>
    <a href="#about">About</a>
    <a href="#contact">Contact</a>
    <div class="profile-dropdown">
            <a href="#profile" class="profile">Profile</a>
            <div class="dropdown-content">
                <a href="#signin">Sign In</a>
                <a href="#register">Register</a>
            </div>
        </div>
</div>

<div class="container">
    <h2>Hotel Room Booking</h2>
    <form action="toronto.jsp" method="post">
        <div class="form-group">
            <label for="checkInDate">Check-In Date:</label>
            <input type="date" id="checkInDate" name="checkInDate" required>
        </div>

        <div class="form-group">
            <label for="checkOutDate">Check-Out Date:</label>
            <input type="date" id="checkOutDate" name="checkOutDate" required>
        </div>

        <div class="form-group">
            <label for="guests">Number of Guests:</label>
            <select id="guests" name="guests">
                <option value="1">1 Guest</option>
                <option value="2">2 Guests</option>
                <option value="3">3 Guests</option>
                <option value="4">4 Guests</option>
                <!-- More options can be added here -->
            </select>
        </div>

        <div class="form-group">
            <label for="roomType">Room Type:</label>
            <select id="roomType" name="roomType">
                <option value="single">Single</option>
                <option value="double">Double</option>
                <option value="suite">Suite</option>
                <!-- More options can be added here -->
            </select>
        </div>

        <div class="form-group">
            <label for="location">Location:</label>
            <div class="location-selector">
                <input type="radio" id="toronto" name="location" value="Toronto">
                <label for="toronto" class="location-label">
                    <img src="assets/Toronto.webp" alt="Toronto">
                    Toronto
                </label>

                <input type="radio" id="vancouver" name="location" value="Vancouver">
                <label for="vancouver" class="location-label">
                    <img src="assets/Montreal.jpeg" alt="Montreal">
                    Vancouver
                </label>

                <input type="radio" id="montreal" name="location" value="Montreal">
                <label for="montreal" class="location-label">
                    <img src="assets/Vancouver.jpeg" alt="Vancouver">
                    Montreal
                </label>
            </div>
        </div>

        <button type="submit">Find Rooms</button>
    </form>
</div>

</body>
</html>
