package com.community.controller;

import com.community.dao.IssueDAO;
import com.community.model.Issue;
import com.community.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddIssueServlet")
public class AddIssueServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        
        if (user == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Issue issue = new Issue();
        issue.setTitle(title);
        issue.setDescription(description);
        issue.setUserId(user.getId()); 
        issue.setStatus("Pending");

        IssueDAO issueDao = new IssueDAO();
        if (issueDao.addIssue(issue)) {
            response.sendRedirect("jsp/dashboard.jsp?msg=added");
        } else {
            response.sendRedirect("jsp/reportIssue.jsp?msg=error");
        }
    }
}