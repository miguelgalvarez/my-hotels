<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Choose Your Destination</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
         /* Your existing styles */
         body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .navbar {
            background-color: #f29602;
            overflow: hidden;
            padding: 0 20px;
        }
        .navbar a, .navbar .profile-dropdown {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 16px 16px;
            text-decoration: none;
            transition: background-color 0.3s, text-shadow 0.3s;
            border-radius: 16px;
        }
        .navbar .logo {
            font-size: 20px;
            font-weight: 600;
            padding: 14px 16px;
            color: white;
            text-decoration: none;
            float: left;
        }
        .navbar .profile {
            float: right;
        }
        /* Other existing styles */

        /* Styles for the locations container */
        .locations-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .city-link {
            text-align: center;
            display: block;
            width: 100%;
        }
        .city-link img {
            max-width: 100px; /* Adjust as necessary */
            height: auto;
            border-radius: 8px; /* Optional: for rounded corners on images */
            transition: transform 0.3s ease;
        }
        .city-link img:hover {
            transform: scale(1.05); /* Slightly enlarge images on hover */
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
            <a href="#signin">Sign In</a>
            <a href="#register">Register</a>
    </div>
</div>

<div class="container">
    <h2>Select a Location</h2>
    <div class="locations-container">
        <a href="hotels.jsp?city=Toronto" class="city-link">
            <img src="images/Toronto.webp" alt="Toronto">
            <span>Toronto</span>
        </a>
        <a href="hotels.jsp?city=Montreal" class="city-link">
            <img src="images/Montreal.jpeg" alt="Montreal">
            <span>Montreal</span>
        </a>
        <a href="hotels.jsp?city=Vancouver" class="city-link">
            <img src="images/Vancouver.jpeg" alt="Vancouver">
            <span>Vancouver</span>
        </a>
    </div>
</div>

</body>
</html>
