<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.community.model.User" %>
<%@ page import="com.community.model.Issue" %>
<%@ page import="com.community.dao.IssueDAO" %>
<%@ page import="java.util.List" %>

<%
    // 1. Session Protection
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Community Tracker</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <div class="container">
        <div class="header-flex">
            <h2 style="margin:0;">Welcome, <%= user.getName() %>!</h2>
            <a href="login.jsp?msg=logout" style="color: #ef4444; font-weight:600; text-decoration:none;">Logout</a>
        </div>

        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 30px;">
            <h3 style="margin:0; color: #334155;">Your Reported Issues</h3>
            <a href="reportIssue.jsp" class="btn-green">+ Report New Issue</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    IssueDAO issueDao = new IssueDAO();
                    // Fetch issues from DB for this specific user
                    List<Issue> issues = issueDao.getIssuesByUser(user.getId());
                    
                    if (issues == null || issues.isEmpty()) {
                %>
                    <tr>
                        <td colspan="4" style="text-align:center; color: var(--text-muted); padding: 40px;">
                            No issues reported yet. Click the green button to start!
                        </td>
                    </tr>
                <%
                    } else {
                        for (Issue issue : issues) {
                            // Logic for dynamic status coloring
                            String status = (issue.getStatus() != null) ? issue.getStatus().toLowerCase() : "pending";
                            String statusClass = status.equals("resolved") ? "status-resolved" : "status-open";
                %>
                    <tr>
                        <td>#<%= issue.getId() %></td>
                        <td><strong><%= issue.getTitle() %></strong></td>
                        <td><%= issue.getDescription() %></td>
                        <td>
                            <span class="status-pill <%= statusClass %>">
                                <%= issue.getStatus() %>
                            </span>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>