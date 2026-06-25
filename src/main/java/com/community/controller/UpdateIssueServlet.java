package com.community.controller;

import com.community.dao.IssueDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateIssueServlet")
public class UpdateIssueServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
       
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        
        IssueDAO issueDao = new IssueDAO();
        
        boolean success = issueDao.updateIssue(id, title, description, status);

        
        if (success) {
            response.sendRedirect("jsp/dashboard.jsp?msg=updated");
        } else {
            response.sendRedirect("jsp/dashboard.jsp?msg=update_fail");
        }
    }
}