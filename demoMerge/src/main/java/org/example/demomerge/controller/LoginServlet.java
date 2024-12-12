package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.CustomerDAO;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        CustomerDAO cDAO = new CustomerDAO();
        if (cDAO.login(email, password)) {

            // Create a session
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            response.sendRedirect("index.jsp");

        } else {
            // Set error message in the request
            request.setAttribute("loginError", "Invalid email or password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);

        }
    }
}