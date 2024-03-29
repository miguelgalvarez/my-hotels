<%@ page import="java.util.ArrayList,java.util.List" %>
<%@ page import="com.hotels.BookingService" %>
<%@ page import="com.hotels.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Hotel Bookings</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --main-colour: #2596be; /* Blue color */
            --lighter-colour: #36bbeb;
            --darker-colour: #1f7999;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 16px;
            display: flex;
            flex-direction: column;
            gap: 10px;

        }

        .booking-title {
            margin-top: 20px;
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .booking-card {
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            margin-bottom: 20px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        .hotel-name {
            font-size: 22px;
            color: var(--main-colour);
            margin-bottom: 10px;
        }

        .dates {
            font-size: 18px;
            color: #666;
        }

        .details {
            font-size: 18px;
            color: #666;
        }

        .price {
            font-size: 24px;
            color: #333;
            font-weight: bold;
            margin-bottom: 0;
        }

        .booking-info {
            flex: 1;
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
            background-color: var(--main-colour);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            transition: background-color 0.3s;
            box-sizing: border-box;
            width: 200px;
            text-align: center;
        }

        .auth-buttons a:hover {
            background-color: var(--darker-colour); /* Darker shade for hover state */
        }

        .cancel-booking-btn {
            padding: 10px 20px;
            background-color: #ff4d4d; /* Red color for cancel button */
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: background-color 0.3s;
            float: right; /* Align to the right */
            margin-top: 20px;
        }

        .cancel-booking-btn:hover {
            background-color: #cc0000; /* Darker shade for hover state */
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
            border-radius: 12px;
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

        .auth-button.cancel-confirm-btn {
            background-color: #ff4d4d; /* Red color */
        }

        .auth-button.cancel-confirm-btn:hover {
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

<jsp:include page="navbar.jsp" />
<jsp:include page="popup.jsp" />

<div class="container">
    <h2 class="booking-title">Your Bookings</h2>
    <% if (session.getAttribute("username") != null) { %>
        <%-- User is logged in, display bookings --%>
        <%
            BookingService bookingServe = new BookingService();

            Integer customerID = (Integer) session.getAttribute("customerID");

            //getting all bookings of a customer
            List<Booking> bookings = bookingServe.getBookings(customerID);

            // Displaying bookings
            for (Booking booking : bookings) {
        %>
            <div class="booking-card">
                <div class="booking-info">
                    <div class="hotel-name">Hotel: <%= bookingServe.getHotelName(booking.getHotelID())%></div>
                    <div class="details">Booking ID: <%= booking.getBookingID() %></div>
                    <div class="details">Check-in: <%= booking.getCheckIn() %></div>
                    <div class="details">Check-out: <%= booking.getCheckOut() %></div>
                </div>
                <div class="price">$<%= String.format("%.2f", booking.getPricePaid()) %></div>
                <button class="cancel-booking-btn" data-booking-id="<%= booking.getBookingID() %>">Cancel Booking</button>
            </div>

            <!-- Cancellation Confirmation Modal -->
            <div id="cancelConfirmationModal" class="modal" style = "display: none;">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2>Confirm Cancellation</h2>
                    <p>Are you sure you want to cancel your booking?</p>
                    <div class="auth-buttons">
                        <a href="bookings.jsp" class="auth-button cancel-confirm-btn" data-booking-id="<%= booking.getBookingID() %>">Yes, Cancel It</a>
                        <a href="#" class="auth-button close-modal-btn">No, Go Back</a>
                    </div>
                </div>
            </div>
        <%
            }
        %>
    <% } else { %>
        <%-- No user is logged in, display login and register buttons --%>
        <div class="booking-title">
            Please log in or register to view your bookings.
        </div>
        <div class="auth-buttons">
            <a href="login.jsp" class = "login-btn">Log In</a>
            <a href="register.jsp" class="register-btn">Register</a>
        </div>
    <% } %>


</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const cancelButtons = document.querySelectorAll('.cancel-booking-btn');
        const modal = document.getElementById('cancelConfirmationModal');
        const yesButton = modal.querySelector('.cancel-confirm-btn');
        const closeModalButtons = document.querySelectorAll('.close, .close-modal-btn');

        // Function to open modal
        function openModal(bookingId) {
            yesButton.setAttribute('data-booking-id', bookingId);
            modal.style.display = 'block';
        }

        // Function to close modal
        function closeModal() {
            modal.style.display = 'none';
        }

        cancelButtons.forEach(button => {
            button.addEventListener('click', function() {
                const bookingId = this.getAttribute('data-booking-id');
                openModal(bookingId);
            });
        });

        yesButton.addEventListener('click', function() {
            const bookingId = this.getAttribute('data-booking-id');
            fetch('deleteBooking', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'BookingID=' + bookingId
            })
            .then(response => response.text())
            .then(data => {
                window.location.href = 'bookings.jsp'; // Redirect to the bookings page
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


