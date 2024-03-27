<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
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
            max-width: 400px;
            margin: 80px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 16px;
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

        input[type="text"], input[type="password"] {
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
            background-color: #f29602;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #db8502;
        }

        .employee-signin {
            text-align: center;
            margin-top: 20px;
        }

        .employee-signin a {
            color: #f29602;
            text-decoration: none;
            padding: 8px 15px;
            border: 2px solid #f29602; /* Outline added */
            border-radius: 8px; /* Rounded corners for a button-like appearance */
            display: inline-block; /* Allows padding and border to take effect */
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .employee-signin a:hover {
            background-color: #f29602; /* Fill color on hover */
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

    <%
    String message = (String) session.getAttribute("message");
    if(message != null){
        session.removeAttribute("message");
    %>
        <div id="popup-message" class="popup" style="display: none;">
            <div class="popup-content">
                <span class="close-btn" onclick="closePopup()">&times;</span>
                <p><%= message %></p>
            </div>
        </div>
    <%
    }
    %>

    <script>
    window.onload = function() {
        // Automatically show the popup
        var popup = document.getElementById("popup-message");
        if (popup) {
            popup.style.display = 'block';
        }

        // Automatically close the popup after 1 second
        setTimeout(function() {
            closePopup();
        }, 1000);
    };

    // Function to close the popup
    function closePopup() {
        var popup = document.getElementById("popup-message");
        if (popup) {
            popup.style.display = 'none';
        }
    }
    </script>

<div class="container">
    <h2>Sign In</h2>
    <form action="login" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Sign In">
    </form>
    <div class="employee-signin">
        <a href="employeeSignin.jsp">Employee Sign In</a>
    </div>
</div>

</body>
</html>
