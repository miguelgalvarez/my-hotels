<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Add your custom styles here */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            font-size: 36px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .actions {
            margin-top: 20px;
        }

        .actions button {
            background-color: #f29602;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            transition: background-color 0.3s;
        }

        .actions button:hover {
            background-color: #FFAF45;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee Management</h1>

        <h2>Bookings</h2>
        <table id="bookings-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer Name</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Booking data will be populated here dynamically -->
            </tbody>
        </table>

        <h2>Rentings</h2>
        <table id="rentings-table">
            <thead>
                <tr>
                    <th>Renting ID</th>
                    <th>Customer Name</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Renting data will be populated here dynamically -->
            </tbody>
        </table>

        <h2>Actions</h2>
        <div class="actions">
            <button id="create-renting-btn">Create Renting</button>
            <button id="convert-booking-btn">Convert to Rental</button>
            <button id="process-payment-btn">Process Payment</button>
        </div>
    </div>

    <script src="scripts.js"></script>
</body>
</html>
