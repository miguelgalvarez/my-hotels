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
        .navbar {
            background-color: #f29602; /* background color for navbar (FFAF45) (0056b3) (f29602)*/
            overflow: hidden;
            padding: 0 20px;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 16px 16px;
            text-decoration: none;
            transition: background-color 0.3s, text-shadow 0.3s;
            border-radius: 16px; /* Rounded edges for the container */
        }
        .navbar a:hover {
            background-color: #FFAF45; /* Lighter blue on hover */
            /*padding: 12px 12px; /* reduced padding on hover */
            /*margin: 4px 4px; /* adjusted margin to compensate for the reduced padding */

            text-shadow: 0 0 0 2px #FFAF45;

        }
        .navbar .profile {
            float: right;
        }
        .navbar .logo {
            font-size: 20px;
            font-weight: 600;
            padding: 14px 16px;
            color: white;
            text-decoration: none;
            float: left;
        }

        /* Override the hover effect for the logo specifically */
        .navbar .logo:hover {
            background-color: transparent; /* Maintain the background color on hover */
            color: white; /* Maintain the text color on hover */
            box-shadow: none;
            text-shadow: none:
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

        /* Profile dropdown styling */
        .profile-dropdown {
            /*position: relative; /* This positions the dropdown absolutely within the navigation link */
            float: right;
            overflow: hidden; /* Ensures the dropdown content is hidden until hovered */
        }

        /* Dropdown content container */
        .dropdown-content {
            display: none; /* Hide dropdown content */
            position: absolute; /* Positioning dropdown */
            background-color: #f9f9f9; /* Dropdown background color */
            width: 80px; /* Ensure dropdown is as wide as the parent */
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); /* Add some shadow */
            z-index: 1; /* Ensure dropdown is on top */
            top: 58px; /* Start just below the profile link */
            /*left: 0; /* Align with the left edge of the profile link */
            border-radius: 14px;
        }

        /* Style dropdown links */
        .dropdown-content a {
            float: none; /* Dropdown links should not float */
            color: black; /* Text color */
            padding: 12px 12px; /* Padding for dropdown items */
            text-decoration: none; /* No underline */
            display: block; /* Dropdown items should be block level for easier interaction */
            text-align: center; /* Align text to the left */
            font-size: 14px;
        }

        /* Show dropdown content on hover */
        .profile-dropdown:hover .dropdown-content {
            display: block; /* Show dropdown content */
        }

        /* Change dropdown links style on hover */
        .dropdown-content a:hover {
            background-color: #FFAF45; /* Light grey background on hover */
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
    <form action="submitBooking.jsp" method="post">
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

        <button type="submit">Find Rooms</button>
    </form>
</div>

</body>
</html>
