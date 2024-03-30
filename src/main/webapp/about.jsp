<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About myHotels</title>
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

        .about-title {
            margin-top: 20px;
            text-align: center;
            color: #333;
            font-size: 40px;
            margin-bottom: 30px;
        }

        .header-title {
            margin-top: 20px;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .about-content {
            line-height: 1.6;
            font-size: 16px;
            text-align: justify;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <h2 class="about-title">About myHotels</h2>
    <div class="about-content">
        <p>Welcome to myHotels, your ultimate destination for hassle-free hotel bookings! Founded by Zachary Sikka, Miguel Alvarez, and Zachary Kranabetter, myHotels aims to revolutionize the way you book your accommodation.</p>

        <h3 class="header-title">Simplifying Room Bookings</h3>
        <p>We understand that finding the perfect accommodation for your trip can be overwhelming. With myHotels, we've simplified the process by bringing together a wide range of rooms from various hotels, all in one convenient platform. Say goodbye to endless browsing and comparing as myHotels streamlines the booking process, making it easier than ever to find the ideal room for your needs.</p>

        <h3 class="header-title">Your Best Deal Awaits</h3>
        <p>At myHotels, we're committed to helping you make your dream trip a reality without breaking the bank. Our platform not only offers convenience but also provides you with the opportunity to find the best deals available. Whether you're planning a luxurious getaway or a budget-friendly adventure, myHotels ensures that you get the most value for your money.</p>
    </div>
</div>

</body>
</html>
