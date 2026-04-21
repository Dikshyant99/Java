package com.kickoff.controller;

import com.kickoff.model.User;
import com.kickoff.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check session - redirect to login if not logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect(request.getContextPath() + "/Pages/Auth/login.jsp");
            return;
        }

        // Get logged in user's email from session
        String email = session.getAttribute("email").toString();

        // Fetch full user details from database
        User user = userService.getUserByEmail(email);

        // If user not found redirect to login
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/Pages/Auth/login.jsp");
            return;
        }

        // Attach user object to request for JSP rendering
        request.setAttribute("user", user);

        // Forward to Profile JSP
        request.getRequestDispatcher("/Pages/User/Profile.jsp")
               .forward(request, response);
    }
}