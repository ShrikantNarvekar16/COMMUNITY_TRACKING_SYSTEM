<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.community.model.User" %>

<%
    // Session Protection: Only logged-in users can report issues
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report New Issue - Community Tracker</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>

    <div class="container">
        <a href="dashboard.jsp" style="text-decoration: none; font-size: 0.8rem; color: #666;"><- Back to Dashboard</a>
        <h2 style="margin-top: 10px;">Report an Issue</h2>
        <p>Provide details about the community problem.</p>

        <%
            String msg = request.getParameter("msg");
            if("error".equals(msg)) {
                out.println("<p style='color:red;'>Something went wrong. Please try again.</p>");
            }
        %>

        <form action="../AddIssueServlet" method="post">
            <div class="form-group">
                <label>Issue Title:</label>
                <input type="text" name="title" required placeholder="Short title (e.g. Street light broken)">
            </div>

            <div class="form-group">
                <label>Description:</label>
                <textarea name="description" required placeholder="Describe the issue in detail..." 
                          style="width: 100%; height: 100px; padding: 10px; border: 1px solid #ddd; border-radius: 4px;"></textarea>
            </div>

            <button type="submit" class="btn">Submit Issue</button>
        </form>
    </div>

</body>
</html>