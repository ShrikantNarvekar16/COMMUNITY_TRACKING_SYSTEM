<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Community Issue Tracking System</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        .hero {
            text-align: center;
            padding: 50px 20px;
        }
        .hero h1 {
            font-size: 2.5rem;
            color: #2c3e50;
        }
        .hero p {
            color: #04031a;
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        .btn-group {
            display: flex;
            gap: 20px;
            justify-content: center;
        }
        .btn-secondary {
            background-color: #28e10b;
        }
        .btn-secondary:hover {
            background-color: #00ff0d;
        }
    </style>
</head>
<body>

    <div class="container hero" style="width: 500px;">
        <h1>Welcome!</h1>
        <p>Make your community better by reporting issues and tracking their resolution in real-time.</p>
        
        <div class="btn-group">
            <a href="jsp/login.jsp" class="btn" style="text-decoration: none; display: inline-block;">Login</a>
            <a href="jsp/register.jsp" class="btn btn-secondary" style="text-decoration: none; display: inline-block;">Register</a>
        </div>
    </div>

</body>
</html>