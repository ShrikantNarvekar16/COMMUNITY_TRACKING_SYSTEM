<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Community Issue Tracker</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>

    <div class="container">
        <h2>Login</h2>
        <p>Access your dashboard to manage issues.</p>

        <%
            String msg = request.getParameter("msg");
            if("success".equals(msg)) {
                out.println("<p style='color:green;'>Registration successful! Please login.</p>");
            } else if("invalid".equals(msg)) {
                out.println("<p style='color:red;'>Invalid email or password.</p>");
            } else if("logout".equals(msg)) {
                out.println("<p style='color:blue;'>You have been logged out.</p>");
            }
        %>

        <form action="../LoginServlet" method="post">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required placeholder="Enter your registered email">
            </div>

            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" required placeholder="Enter your password">
            </div>

            <button type="submit" class="btn">Login</button>
        </form>

        <p class="footer-link">Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>

</body>
</html>