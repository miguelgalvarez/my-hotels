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




        .auth-buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;

        }

        .auth-buttons a {
            padding: 10px 20px;
            background-color: #f29602;
            color: white;
            text-decoration: none;
            border-radius: 12px;
            transition: background-color 0.3s;
            box-sizing: border-box;
            width: 200px;
            text-align: center;
        }

        .auth-buttons a:hover {
            background-color: #e08502; /* Darker shade for hover state */
        }

        .modal {
            position: fixed;   /* Stay in place */
            left: 0;
            top: 0;
            width: 100%;       /* Full width */
            height: 100%;      /* Full height */
            overflow: auto;    /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            display: none;     /* Initially hidden */
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 2px solid #888;
            width: 30%;
            border-radius: 6px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 100px;
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

        .auth-button.delete-confirm-btn {
            background-color: #ff4d4d; /* Red color */
        }

        .auth-button.delete-confirm-btn:hover {
            background-color: #cc0000; /* A darker shade of red for hover state */
        }

        .auth-button.close-modal-btn {
            background-color: #4CAF50; /* Green color */
        }

        .auth-button.close-modal-btn:hover {
            background-color: #388E3C; /* A darker shade of green for hover state */
        }
    </style>
</head>
<body>

<jsp:include page="employeePopup.jsp" />

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
                                        <form action="convertToRenting" method="post">
                                            <input type="hidden" name="roomID" value= <%= booking.getRoomID() %>>
                                            <button type="submit">Convert To Renting</button>
                                        </form>
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
                    <button class="delete-renting-btn" data-renting-id="<%= renting.getRentingID() %>">Delete Renting</button>
                </td>
            </tr>

             <!-- Cancellation Confirmation Modal -->
                <div id="deleteConfirmationModal" class="modal" style = "display: none;">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Confirm Deletion</h2>
                        <p>Are you sure you want to delete the renting?</p>
                        <div class="auth-buttons">
                            <a href="employee.jsp" class="auth-button delete-confirm-btn" data-renting-id="<%= renting.getRentingID() %>">Yes, Delete It</a>
                            <a href="#" class="auth-button close-modal-btn">No, Go Back</a>
                        </div>
                    </div>
                </div>

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
    document.addEventListener("DOMContentLoaded", function() {
        const deleteButtons = document.querySelectorAll('.delete-renting-btn');
        const modal = document.getElementById('deleteConfirmationModal');
        const yesButton = modal.querySelector('.delete-confirm-btn');
        const closeModalButtons = document.querySelectorAll('.close, .close-modal-btn');

        // Function to open modal
        function openModal(rentingID) {
            yesButton.setAttribute('data-renting-id', rentingID);
            modal.style.display = 'block';
        }

        // Function to close modal
        function closeModal() {
            modal.style.display = 'none';
        }

        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const rentingID = this.getAttribute('data-renting-id');
                openModal(rentingID);
            });
        });

        yesButton.addEventListener('click', function() {
            const rentingID = this.getAttribute('data-renting-id');
            fetch('deleteRenting', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'rentingID=' + rentingID
            })
            .then(response => response.text())
            .then(data => {
                window.location.href = 'employee.jsp'; // Redirect to the employee page
            })

            .catch(error => {
                console.error('Error:', error);
            });

            closeModal(); // Close the modal
        });

        closeModalButtons.forEach(button => {
            button.addEventListener('click', function(event) {
                event.preventDefault(); // Prevent link action
                closeModal();
            });
        });

        // Close modal when clicking outside of it
        window.onclick = function(event) {
            if (event.target == modal) {
                closeModal();
            }
        };
    });
</script>

</body>
</html>
