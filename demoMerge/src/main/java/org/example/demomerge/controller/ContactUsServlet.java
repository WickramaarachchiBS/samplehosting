package org.example.demomerge.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.demomerge.dao.ConFeedDAO;
import org.example.demomerge.dto.Contact_Feedback;

import java.io.IOException;

@WebServlet(name = "ContactUsServlet", value = "/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Contact_Feedback cf = new Contact_Feedback();

            //retrieve data from form
            cf.setName(request.getParameter("name"));
            cf.setEmail(request.getParameter("email"));
            cf.setMessage(request.getParameter("message"));

            //save to database
            ConFeedDAO cfd = new ConFeedDAO();
            cfd.addContact(cf);

            request.setAttribute("popupMessage", "Your response has been saved.");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/contact_us.jsp");
            rd.forward(request, response);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}