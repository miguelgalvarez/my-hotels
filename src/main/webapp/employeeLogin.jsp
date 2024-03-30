<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Log In</title>
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

        input[type="text"], input[type="text"] {
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

    </style>
</head>
<body>

<jsp:include page = "navbar.jsp" />
<jsp:include page = "popup.jsp" />

<div class="container">
    <h2>Employee Log In</h2>
    <form action="employeeLogin" method="post">
        <input type="text" name="full name" placeholder="Full Name" required>
        <input type="text" name="Employee Number" placeholder="Employee Number" required>
        <input type="submit" value="Log In">
    </form>
</div>

</body>
</html>
