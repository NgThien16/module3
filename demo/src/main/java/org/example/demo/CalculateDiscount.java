package org.example.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="CalculateDiscount", value="/discount")

public class CalculateDiscount extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int listPrice = Integer.parseInt(request.getParameter("listPrice"));
        int discount = Integer.parseInt(request.getParameter("discountPercent"));
        int discountAmount = listPrice * discount* 1/100;
        request.setAttribute("discountAmount", discountAmount);
        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }
}
