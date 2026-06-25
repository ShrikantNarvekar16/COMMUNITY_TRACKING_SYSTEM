<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.community.model.User" %>
<%@ page import="com.community.model.Issue" %>
<%@ page import="com.community.dao.IssueDAO" %>
<%@ page import="java.util.List" %>

<%
    // 1. Admin Protection: Ensure only logged-in ADMINS can see this
    User user = (User) session.getAttribute("user");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Community Tracker</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        .admin-container { width: 90%; margin: 30px auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #343a40; color: white; }
        .status-pending { background-color: #fff3cd; color: #856404; padding: 4px 8px; border-radius: 4px; font-size: 0.85rem; }
        .status-resolved { background-color: #d4edda; color: #155724; padding: 4px 8px; border-radius: 4px; font-size: 0.85rem; }
        .resolve-btn { background-color: #007bff; color: white; text-decoration: none; padding: 5px 10px; border-radius: 4px; font-size: 0.8rem; }
        .resolve-btn:hover { background-color: #0056b3; }
    </style>
</head>
<body>

    <div class="admin-container">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <h2>Administrator Control Panel</h2>
            <a href="login.jsp?msg=logout" style="color: red; text-decoration: none;">Logout</a>
        </div>
        
        <p>Logged in as: <strong><%= user.getName() %></strong></p>
        <hr>

        <h3>Global Issue List</h3>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    IssueDAO issueDao = new IssueDAO();
                    // This fetches ALL issues for the admin
                    List<Issue> allIssues = issueDao.getAllIssues();
                    
                    if (allIssues.isEmpty()) {
                %>
                    <tr>
                        <td colspan="6" style="text-align:center;">No issues found in the system.</td>
                    </tr>
                <%
                    } else {
                        for (Issue issue : allIssues) {
                %>
                    <tr>
                        <td><%= issue.getId() %></td>
                        <td>User #<%= issue.getUserId() %></td>
                        <td><%= issue.getTitle() %></td>
                        <td><%= issue.getDescription() %></td>
                        <td>
                            <span class="status-pill status-<%= issue.getStatus().toLowerCase() %>">
                            <%= issue.getStatus() %>
                            </span>
                        </td>
                        <td>
                        <% if(!"Resolved".equals(issue.getStatus())) { %>
                        <a href="../ResolveIssueServlet?id=<%= issue.getId() %>" class="btn btn-secondary" style="padding: 5px 10px; font-size: 0.8rem;">Mark Resolved</a>
                        <% } else { %>
                        <span style="color: var(--text-muted); font-style: italic;">No Action</span>
                        <% } %>
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