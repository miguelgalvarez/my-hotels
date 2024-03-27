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

        .available-rooms {
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
        }


        /*popup window */
        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0, 0, 0.5); /* Dimmed background */

        }

        .popup-content {
            background-color: #fce5b8;
            padding: 5px;
            margin-left: 500px;
            margin-right: 500px;
            margin-top: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-size: 20px
        }

        .close-btn {
            float: right;
            font-size: 1.5em;
            cursor: pointer;
        }

    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<jsp:include page="popup.jsp" />

<div class="container">
    <h2 class="location-title">Where Would You Like to Stay?</h2>
    <div class="locations-container">
        <div class="city-card">
            <a href="hotels.jsp?city=Toronto" class="city-link">
                <img src="assets/toronto.jpeg" alt="Toronto" class="city-image">
                <span class="city-name">Toronto</span>
                <span class="available-rooms">200 Available Rooms!</span>
            </a>
        </div>
        <div class="city-card">
            <a href="montreal.jsp" class="city-link">
                <img src="assets/montreal.jpeg" alt="Montreal" class="city-image">
                <span class="city-name">Montreal</span>
                <span class="available-rooms">150 Available Rooms!</span>
            </a>
        </div>
        <div class="city-card">
            <a href="hotels.jsp?city=Vancouver" class="city-link">
                <img src="assets/vancouver.jpeg" alt="Vancouver" class="city-image">
                <span class="city-name">Vancouver</span>
                <span class="available-rooms">180 Available Rooms!</span>
            </a>
        </div>
    </div>
</div>

</body>
</html>
