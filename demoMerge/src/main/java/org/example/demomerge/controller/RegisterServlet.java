package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.CustomerDAO;
import org.example.demomerge.dto.Customer;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Customer cus = new Customer();

            cus.setName(request.getParameter("name"));
            cus.setNIC(request.getParameter("nic"));
            cus.setEmail(request.getParameter("email"));
            cus.setPhone(request.getParameter("phone"));
            cus.setPassword(request.getParameter("password"));

            CustomerDAO dao = new CustomerDAO();
            dao.register(cus);

            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);

        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}