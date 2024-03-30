<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log In</title>
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

        .big-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 12px;
            display: flex;
            flex-direction: column; /* Stack the title and cards-container vertically */
            align-items: center; /* Center-align the child elements */
        }

        .cards-container {
            display: flex;
            justify-content: center; /* Center-align the cards */
            gap: 20px; /* Add some space between the cards */
        }

        .container {
            /* Set widths to make the cards equal width and adjust as necessary */
            flex-basis: calc(50% - 10px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
            padding: 20px;
            width: 350px;

        }

        .title {
            margin-bottom: 30px; /* Adjust this value as needed for spacing */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        input[type="text"], input[type="password"], input[type = "email"] {
            font-size: 16px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            font-size: 18px;
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

        .employee-signin {
            text-align: center;
            margin-top: 20px;
        }

        .employee-signin a {
            color: var(--main-colour);
            text-decoration: none;
            padding: 8px 15px;
            border: 2px solid var(--main-colour); /* Outline added */
            border-radius: 8px; /* Rounded corners for a button-like appearance */
            display: inline-block; /* Allows padding and border to take effect */
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .employee-signin a:hover {
            background-color: var(--main-colour);/* Fill color on hover */
            color: white; /* Text color change for better visibility */
        }

        //popup message window
        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0, 0, 0.5); /* Dimmed background */
        }

        .popup-content {
            background-color: #fff;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .close-btn {
            float: right;
            font-size: 1.5em;
            cursor: pointer;
        }

    </style>
</head>
<body>

<jsp:include page = "navbar.jsp" />

<jsp:include page = "popup.jsp" />

<div class = "big-container">
    <h2 class="title">Please Login or Register to Book a Hotel</h2>
    <div class = "cards-container">
        <div class="container">
            <h2>Log In</h2>
            <form action="login" method="post">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="hidden" name="returnUrl" value="<%= request.getParameter("returnUrl") %>">
                <input type="submit" value="Log In">
            </form>
        </div>

        <div class="container">
            <h2>Register</h2>
            <form method="post" action="register">
                <input type="text" name="full name" placeholder="Full Name" required>
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="text" name="address" placeholder="Address" required>
                <input type="text" name="type of ID" placeholder="Type of ID" required>
                <input type="hidden" name="returnUrl" value="<%= request.getParameter("returnUrl") %>">
                <input type="submit" value="Register">
            </form>
        </div>
    </div>
</div>

</body>
</html>
