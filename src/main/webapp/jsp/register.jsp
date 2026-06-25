<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Community Issue Tracker</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>

    <div class="container">
        <h2>Create an Account</h2>
        <p>Join your community to report and track local issues.</p>

        <%
            String msg = request.getParameter("msg");
            if("error".equals(msg)) {
                out.println("<p style='color:red;'>Registration failed. Email might already exist.</p>");
            }
        %>

        <form action="../RegisterServlet" method="post">
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="name" required placeholder="Enter your full name">
            </div>

            <div class="form-group">
                <label>Email Address:</label>
                <input type="email" name="email" required placeholder="name@example.com">
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required placeholder="Create a strong password">
            </div>

            <button type="submit" class="btn">Register</button>
        </form>

        <p class="footer-link">Already have an account? <a href="login.jsp">Login here</a></p>
    </div>

</body>
</html>