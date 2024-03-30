<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact myHotels</title>
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

        .contact-title {
            margin-top: 20px;
            text-align: center;
            color: #333;
            font-size: 40px;
            margin-bottom: 30px;
        }

        .contact-info {
            line-height: 1.6;
            font-size: 16px;
            text-align: justify;
        }

        #map {
            margin-top: 30px;
            height: 400px;
            border-radius: 8px;
            overflow: hidden;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />
<jsp:include page ="popup.jsp" />

<div class="container">
    <h2 class="contact-title">Contact myHotels</h2>
    <div class="contact-info">
        <p>If you have any questions, feedback, or inquiries, feel free to reach out to us!</p>
        <p>Email: info@myhotels.com</p>
        <p>Phone: +1234567890</p>
        <p>Address: 90 University Private, Ottawa, ON K1N 6N5</p>
    </div>
    <div id="map"></div>
</div>

<script>
    function initMap() {
        const universityOfOttawa = { lat: 45.423206, lng: -75.684943 };
        const map = new google.maps.Map(document.getElementById("map"), {
            zoom: 15,
            center: universityOfOttawa,
        });
        new google.maps.Marker({
            position: universityOfOttawa,
            map,
            title: "University of Ottawa",
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAcgTK4ZHvxFLZUhhVc517SjqXMmx3yY4&callback=initMap" async defer></script>

</body>
</html>
