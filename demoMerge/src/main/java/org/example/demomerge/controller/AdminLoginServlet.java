package org.example.demomerge.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.AdminDAO;
import org.example.demomerge.dao.CustomerDAO;

import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", value = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("adminemail");
        String password = request.getParameter("adminpass");

        AdminDAO aDAO = new AdminDAO();
        if (aDAO.adminLogin(email, password)) {

            // Create a session
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            response.sendRedirect("RetrieveAdminMovieServlet");

        } else {
            // Set error message in the request
            request.setAttribute("loginError", "Invalid email or password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);

        }
    }
}