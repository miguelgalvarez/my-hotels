<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Screen</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --main-colour: #2596be;
            --lighter-colour: #36bbeb;
            --darker-colour: #1f7999;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .payment-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 400px;
            width: 100%;
            margin: 20px;

        }

        .back-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: var(--main-colour);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: var(--darker-colour);
        }

        input[type="text"]  {
            font-size: 16px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            color: white;
            background-color: var(--main-colour);
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: var(--darker-colour);
        }

        form {
            display: flex;
            flex-direction: column;
        }

    </style>
</head>
<body>

<jsp:include page ="popup.jsp"/>
<% System.out.println("checkIN in payment.jsp is" + request.getParameter("checkIN"));
System.out.println("checkOut in payment.jsp is" + request.getParameter("checkOut")); %>
<div class="payment-container">
    <h1>Payment Screen</h1>
    <!-- Payment form inputs -->
    <form id="payment-form" method="POST" action="PaymentServlet">
        <label for="credit-card-number">Credit Card Number:</label>
        <input type="text" id="credit-card-number" name="credit-card-number" placeholder="XXXXXXXXXXXXXXXX"required><br><br>
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" placeholder="XXX" required><br><br>
        <label for="expiry-date">Expiry Date:</label>
        <input type="text" id="expiry-date" name="expiryDate" placeholder="XXXX" required><br><br>
        <label for="full-name">Full Name:</label>
        <input type="text" id="full-name" name = "fullName" required><br><br>
        <input type="submit" value="Submit Payment">
        <input type="hidden" id="room-id" name="roomID" value="<%= request.getParameter("roomID") %>">
        <input type="hidden" id="number-of-days" name="numberOfDays" value="<%= request.getParameter("numberOfDays") %>">
        <input type="hidden" id="price" name="cost" value="<%= request.getParameter("cost") %>">
        <input type="hidden" id="checkIN" name="checkIN" value="<%= request.getParameter("checkIN") %>">
        <input type="hidden" id="checkOut" name="checkOut" value="<%= request.getParameter("checkOut") %>">
    </form>
    <button class="back-button" onclick="goBack()">Back</button>
</div>

<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
