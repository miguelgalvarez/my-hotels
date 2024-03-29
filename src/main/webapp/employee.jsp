<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page import="java.util.List" %>
    <%@ page import="com.hotels.BookingService, com.hotels.Booking" %>
    <%@ page import="com.hotels.RentingService, com.hotels.Renting" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        h1, h2 {
            color: #444;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #eee;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            border-radius: 8px;
        }
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
    </style>
</head>
<body>

<jsp:include page="popup.jsp" />

    <div class="container">
        <h1>Employee Management</h1>

        <h2>Bookings</h2>
        <table id="bookings-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookingService bookingService = new BookingService();
                    List<Booking> bookings = bookingService.getAllBookings();
                    for(Booking booking : bookings) {

                    String status = booking.getPayment() ? "Paid" : "Unpaid";
                        %>
                                <tr>

                                    <td><%= booking.getBookingID() %></td>
                                    <td><%= booking.getCustomerID() %></td>
                                    <td><%= booking.getCheckIn().toString() %></td>
                                    <td><%= booking.getCheckOut().toString() %></td>
                                    <td><%= String.format("$%.2f", booking.getPricePaid()) %></td>
                                    <td><%= status %></td>
                                    <td>
                                    <% if (!booking.getPayment()) { %>
                                        <button onclick="makePayment('<%= booking.getBookingID() %>')">Process Payment</button>
                                    <% } else { %>
                                        <button onclick="convertToRenting('<%= booking.getRoomID() %>')">Convert to Renting</button>
                                    <% } %>
                                    </td>
                                </tr>
                        <%
                            }
                        %>
                    </tbody>
        </table>

        <h2>Rentings</h2>
        <table id="rentings-table">
            <thead>
                <tr>
                    <th>Renting ID</th>
                    <th>Customer ID</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
        <%
            RentingService rentingService = new RentingService();
            List<Renting> rentings = rentingService.getAllRentings();
        %>
        <% for(Renting renting : rentings) { %>
            <tr>
                <td><%= renting.getRentingID() %></td>
                <td><%= renting.getCustomerID() %></td>
                <td><%= renting.getCheckIn().toString() %></td>
                <td><%= renting.getCheckOut().toString() %></td>
                <td>
                    <button onclick="deleteRenting('<%= renting.getRentingID() %>')">Delete Renting</button>
                </td>
            </tr>
        <% } %>

    </tbody>
</table>            </tbody>
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
        function convertToRenting(roomID) {
            var contextPath = "<%= request.getContextPath() %>";
            fetch(contextPath + '/convertToRenting', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'roomID=' + roomID
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Process the response as JSON
            })
            .then(data => {
                if(data.success) {
                    alert(data.message); // Show success message
                } else {
                    alert("Error: " + data.message); // Show error message
                }
                window.location.reload();
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }


        //function deleteRenting(rentingID) {
        //}

        function makePayment(bookingID) {
            // Code to handle payment
            document.getElementById('processPaymentModal').style.display = 'block';
        }
        // Close modal functionality (if you haven't implemented it already)
        document.querySelector('.close').addEventListener('click', function() {
            document.getElementById('processPaymentModal').style.display = 'none';
        });

        // Example function to handle form submit (Needs to be implemented)
        document.getElementById('processPaymentForm').addEventListener('submit', function(event) {
            event.preventDefault();
            // Implement payment processing here
        });

        // Close modal when clicking outside the modal (if not already implemented)
        window.onclick = function(event) {
            if (event.target == document.getElementById('processPaymentModal')) {
                document.getElementById('processPaymentModal').style.display = 'none';
            }
        };
    </script>

</body>
</html>
