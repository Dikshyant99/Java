package com.kickoff.controller;

import com.kickoff.model.ground;
import com.kickoff.service.GroundService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = {"/GroundServlet"})
public class GroundServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private GroundService groundService;

    @Override
    public void init() {
        groundService = new GroundService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<ground> grounds = groundService.getAllGrounds();
            request.setAttribute("grounds", grounds);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }

        request.getRequestDispatcher("/Pages/Root/grounds.jsp")
                .forward(request, response);
    }
}