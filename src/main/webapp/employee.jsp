<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="import" href="payment-screen.html">
    <style>
        /* Custom styles here */
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
        h1, h2 {
            font-weight: 600;
            margin-bottom: 20px;
        }
        h1 { font-size: 36px; }
        h2 { font-size: 24px; margin-bottom: 10px; }
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
        th { background-color: #f2f2f2; }
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
        /* Additional styles for modal */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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
                    <th>Status</th>
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
    </div>

    <!-- Modal for Processing Payment -->
    <div id="processPaymentModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Process Payment</h2>
            <form id="processPaymentForm">
                <!-- Assume necessary fields are included -->
                <p><input type="number" placeholder="Amount" name="amount"></p>
                <p><button type="submit">Submit</button></p>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Fake bookings data
            const bookingsData = [
                { bookingId: 1, customerName: "John Doe", checkInDate: "2024-03-26", checkOutDate: "2024-03-28", status: "pending" },
                { bookingId: 2, customerName: "Jane Smith", checkInDate: "2024-03-27", checkOutDate: "2024-03-29", status: "pending" },
                { bookingId: 3, customerName: "Alice Johnson", checkInDate: "2024-03-28", checkOutDate: "2024-03-30", status: "paid" }
            ];

            // Fake rentings data
            const rentingsData = [
                { rentingId: 1, customerName: "Bob Brown", checkInDate: "2024-03-26", checkOutDate: "2024-03-28" },
                { rentingId: 2, customerName: "Sarah Lee", checkInDate: "2024-03-27", checkOutDate: "2024-03-29" },
                { rentingId: 3, customerName: "David Wilson", checkInDate: "2024-03-28", checkOutDate: "2024-03-30" }
            ];

            // Function to populate bookings table
            function populateBookingsTable() {
                const bookingsTable = document.getElementById("bookings-table").getElementsByTagName("tbody")[0];
                bookingsData.forEach(function(booking) {
                    const row = bookingsTable.insertRow();
                    row.innerHTML = `<td>${booking.bookingId}</td><td>${booking.customerName}</td><td>${booking.checkInDate
}</td><td>${booking.checkOutDate}</td><td>${booking.status}</td><td>
                    <button class="convert-btn" data-booking-id="${booking.bookingId}">Convert to Rental</button>
                    <button class="process-btn" data-booking-id="${booking.bookingId}" style="${booking.status === 'paid' ? 'display: none;' : ''}">Process Payment</button>
                </td>`;
                });
            }


            // Function to populate rentings table
            function populateRentingsTable() {
                const rentingsTable = document.getElementById("rentings-table").getElementsByTagName("tbody")[0];
                rentingsData.forEach(function(renting) {
                    const row = rentingsTable.insertRow();
                    row.innerHTML = `<td>${renting.rentingId}</td><td>${renting.customerName}</td><td>${renting.checkInDate}</td><td>${renting.checkOutDate}</td><td>
                    <!-- Actions column for rentings table -->
                </td>`;
                });
            }

            // Populate the tables on page load
            populateBookingsTable();
            populateRentingsTable();

            // Modal functionality
            const processPaymentModal = document.getElementById("processPaymentModal");

            const processPaymentForm = document.getElementById("processPaymentForm");
            processPaymentForm.addEventListener("submit", function(event) {
                event.preventDefault();
                const bookingId = processPaymentForm.dataset.bookingId;
                const amount = processPaymentForm.elements["amount"].value;
                // Assume there is a function to process payment
                processPayment(bookingId, amount);
                // Update booking status and hide process button
                const bookingRow = document.querySelector(`#bookings-table tbody tr:nth-child(${parseInt(bookingId) + 1})`);
                bookingRow.cells[4].innerText = "paid";
                bookingRow.querySelector(".process-btn").style.display = "none";
                processPaymentModal.style.display = "none";
            });

            // Event listener for "Convert to Rental" buttons
            const convertButtons = document.getElementsByClassName("convert-btn");
            Array.from(convertButtons).forEach(function(button) {
                button.addEventListener("click", function() {
                    const bookingId = button.dataset.bookingId;
                    // Assume there is a function to convert booking to rental
                    convertToRental(bookingId);
                    // Update booking status and hide convert button
                    const bookingRow = document.querySelector(`#bookings-table tbody tr:nth-child(${parseInt(bookingId) + 1})`);
                    bookingRow.cells[4].innerText = "converted";
                    button.style.display = "none";
                });
            });

            // Event listener for "Process Payment" buttons
            const processButtons = document.getElementsByClassName("process-btn");
            Array.from(processButtons).forEach(function(button) {
                button.addEventListener("click", function() {
                    const bookingId = button.dataset.bookingId;
                    processPaymentForm.dataset.bookingId = bookingId;
                    processPaymentModal.style.display = "block";
                });
            });

            // Close modal when the close button is clicked
            const closeButtons = document.getElementsByClassName("close");
            Array.from(closeButtons).forEach(function(button) {
                button.addEventListener("click", function() {
                    processPaymentModal.style.display = "none";
                });
            });

            // Close modal when clicking outside the modal
            window.onclick = function(event) {
                if (event.target == processPaymentModal) {
                    processPaymentModal.style.display = "none";
                }
            };
        });
    </script>
</body>
</html>
