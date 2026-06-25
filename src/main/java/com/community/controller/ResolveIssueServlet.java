package com.community.controller;

import com.community.dao.IssueDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ResolveIssueServlet")
public class ResolveIssueServlet extends HttpServlet {
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int issueId = Integer.parseInt(request.getParameter("id"));
        String newStatus = "Resolved";

        IssueDAO issueDao = new IssueDAO();
        boolean success = issueDao.updateIssueStatus(issueId, newStatus);

        if (success) {
            response.sendRedirect("jsp/adminPanel.jsp?msg=resolved");
        } else {
            response.sendRedirect("jsp/adminPanel.jsp?msg=fail");
        }
    }
}