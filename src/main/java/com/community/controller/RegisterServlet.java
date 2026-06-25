package com.community.controller;

import com.community.dao.UserDAO;
import com.community.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "USER"; 

       
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);

       
        UserDAO userDao = new UserDAO();
        boolean success = userDao.registerUser(user);

        
        if (success) {
            response.sendRedirect("jsp/login.jsp?msg=success");
        } else {
            response.sendRedirect("jsp/register.jsp?msg=error");
        }
    }
}