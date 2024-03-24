<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Choose Your Destination</title>
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
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 16px;
        }

        .location-title {
            margin-top: 20px;
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .locations-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
        }

        .city-card {
            display: block;
            width: calc(33.333% - 20px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .city-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        .city-link {
            display: block;
            text-decoration: none;
        }

        .city-image {
            width: 100%;
            height: auto;
            border-bottom: 4px solid #fff;
            transition: transform 0.3s ease;
        }

        .city-image:hover {
            transform: scale(1.1);
        }

        .city-name {
            display: block;
            text-align: center;
            padding: 15px 0;
            background-color: #f29602;
            color: white;
            font-size: 18px;
        }

    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <h2 class="location-title">Where Would You Like to Stay?</h2>
    <div class="locations-container">
        <div class="city-card">
            <a href="hotels.jsp?city=Toronto" class="city-link">
                <img src="assets/toronto.jpeg" alt="Toronto" class="city-image">
                <span class="city-name">Toronto</span>
            </a>

        </div>
        <div class="city-card">
            <a href="hotels.jsp?city=Montreal" class="city-link">
                <img src="assets/montreal.jpeg" alt="Montreal" class="city-image">
                <span class="city-name">Montreal</span>
            </a>
        </div>
        <div class="city-card">
            <a href="hotels.jsp?city=Vancouver" class="city-link">
                <img src="assets/vancouver.jpeg" alt="Vancouver" class="city-image">
                <span class="city-name">Vancouver</span>
            </a>

        </div>
    </div>
</div>


</body>
</html>
