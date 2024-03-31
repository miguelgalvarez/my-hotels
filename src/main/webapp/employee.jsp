<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page import="java.util.List" %>
    <%@ page import="com.hotels.BookingService, com.hotels.Booking" %>
    <%@ page import="com.hotels.RentingService, com.hotels.Renting" %>
    <%@ page import="com.hotels.CustomerService" %>

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
            border-radius: 5px;
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
            border-radius: 5px;
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
            background-color: #a3a3a3; /* grey color */
        }

        .auth-button.close-modal-btn:hover {
            background-color: #8c8b8b; /* A darker shade of grey for hover state */
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
                    //int employeeId = session.getAtribute("employeeNumber");
                    //EmployeeService employeeService = new EmployeeService();
                    //Employee employee = employeeService.getEmployeeById(employeeId);
                    //int hotelID = employee.getHotelID();

                    BookingService bookingService = new BookingService();
                    List<Booking> bookings = bookingService.getAllBookings(CustomerService.fetchHotelID(Integer.parseInt(session.getAttribute("employeeNumber").toString())));

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
                                        <button class="process-payment-btn" data-booking-id="<%= booking.getBookingID() %>">Process Payment</button>

                                        <!-- Payment Confirmation Modal -->
                                        <div id="paymentConfirmationModal" class="modal" style = "display: none;">
                                            <div class="modal-content">
                                                <span class="close">&times;</span>
                                                <h2>Confirm Payment</h2>
                                                <p>Are you sure you want to process the payment?</p>
                                                <form action="processPayment" method="POST">
                                                    <!-- Hidden input for rentingID, value will be set dynamically with JavaScript -->
                                                    <input type="hidden" name="bookingID" id= "bookingID" value= <%= booking.getBookingID() %>>
                                                    <div class="auth-buttons">
                                                        <button type="submit" class="auth-button payment-confirm-btn">Yes, Process It</button>
                                                        <a href="#" class="auth-button close-modal-btn">No, Go Back</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                    <% } else { %>
                                        <button class="convert-renting-btn" data-booking-id="<%= booking.getBookingID() %>">Convert To Renting</button>
                                        <!-- Payment Confirmation Modal -->
                                        <div id="convertRentingConfirmation" class="modal" style = "display: none;">
                                            <div class="modal-content">
                                                <span class="close">&times;</span>
                                                <h2>Confirm Booking to Renting</h2>
                                                <p>Are you sure you want to convert the booking to a renting?</p>
                                                <form action="convertToRenting" method="POST">
                                                    <!-- Hidden input for rentingID, value will be set dynamically with JavaScript -->
                                                    <input type="hidden" name="bookingID" id= "bookingID" value= <%= booking.getBookingID() %>>
                                                    <div class="auth-buttons">
                                                        <button type="submit" class="auth-button convert-renting-confirm-btn">Yes, Convert It</button>
                                                        <a href="#" class="auth-button close-modal-btn">No, Go Back</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
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

             <!-- Deletion Confirmation Modal -->
                <div id="deleteConfirmationModal" class="modal" style = "display: none;">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Confirm Deletion</h2>
                        <p>Are you sure you want to delete the renting?</p>
                        <form action="deleteRenting" method="POST">
                            <!-- Hidden input for rentingID, value will be set dynamically with JavaScript -->
                            <input type="hidden" name="rentingID" id= "rentingID" value= <%= renting.getRentingID() %>>
                            <div class="auth-buttons">
                                <button type="submit" class="auth-button delete-confirm-btn">Yes, Delete It</button>
                                <a href="#" class="auth-button close-modal-btn">No, Go Back</a>
                            </div>
                        </form>
                    </div>
                </div>
        <% } %>

    </tbody>
</table>            </tbody>
        </table>
            <h2>Add a renting</h2>
            <table id="additional-rentings-table">
                <thead>
                    <tr>
                        <th>Customer Full Name</th>
                        <th>Room ID</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="rentingID" id="rentingID"></td>
                        <td><input type="text" name="customerID" id="customerID"></td>
                        <td><input type="date" name="checkInDate" id="checkInDate"></td>
                        <td><input type="date" name="checkOutDate" id="checkOutDate"></td>
                        <td><button id="addRentingBtn">Add Renting</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

<script>
   document.addEventListener("DOMContentLoaded", function() {
       // For Delete Renting
       const deleteButtons = document.querySelectorAll('.delete-renting-btn');
       const deleteModal = document.getElementById('deleteConfirmationModal');

       // For Process Payment
       const paymentButtons = document.querySelectorAll('.process-payment-btn');
       const paymentModal = document.getElementById('paymentConfirmationModal');

      // For Convert Renting
      const convertButtons = document.querySelectorAll('.convert-renting-btn');
      const convertModal = document.getElementById('convertRentingConfirmation');

       const closeModalButtons = document.querySelectorAll('.close, .close-modal-btn');

       // Open Modal Generic Function
       function openModal(modal, idInput, id) {
           document.getElementById(idInput).value = id; // Set the ID in the form's hidden input
           modal.style.display = 'block'; // Display the modal
       }

       // Function to close modal
       function closeModal() {
           // Hide both modals
           deleteModal.style.display = 'none';
           paymentModal.style.display = 'none';
           convertModal.style.display = 'none';

       }

       // Attach event listeners to Delete buttons
       deleteButtons.forEach(button => {
           button.addEventListener('click', function() {
               const rentingID = this.getAttribute('data-renting-id');
               openModal(deleteModal, 'rentingID', rentingID);
           });
       });

       // Attach event listeners to Payment buttons
       paymentButtons.forEach(button => {
           button.addEventListener('click', function() {
               const bookingID = this.getAttribute('data-booking-id');
               openModal(paymentModal, 'bookingID', bookingID);
           });
       });

       // Attach event listeners to Convert buttons
      convertButtons.forEach(button => {
          button.addEventListener('click', function() {
              const bookingID = this.getAttribute('data-booking-id');
              openModal(convertModal, 'bookingID', bookingID);
          });
      });

       // Close modals on close button click or when clicking outside the modal
       closeModalButtons.forEach(button => {
           button.addEventListener('click', function(event) {
               event.preventDefault(); // Prevent default action for links, if any
               closeModal();
           });
       });

        // Close modal when clicking outside of it
       window.onclick = function(event) {
           if (event.target == deleteModal || event.target == paymentModal || event.target == convertModal) {
               closeModal();
           }
       };
   });

</script>

</body>
</html>
