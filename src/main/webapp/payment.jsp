<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Screen</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
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
            background-color: #f29602;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #FFAF45;
        }
    </style>
</head>
<body>

<div class="payment-container">
    <h1>Payment Screen</h1>
    <!-- Payment form inputs -->
    <form>
        <label for="credit-card-number">Credit Card Number:</label>
        <input type="text" id="credit-card-number" required><br><br>
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" required><br><br>
        <label for="expiry-date">Expiry Date:</label>
        <input type="text" id="expiry-date" required><br><br>
        <button type="submit">Submit Payment</button>
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
