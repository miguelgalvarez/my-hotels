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

    </style>
</head>
<body>

<jsp:include page = "navbar.jsp" />

<div class="container">
    <h2>Sign In</h2>
    <form action="login.jsp" method="post">
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
