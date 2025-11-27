package org.example.jspl;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer(1,"Mai Văn Hoàn", "1983-08-20", "Hà Nội", "img/anh1.jpg"));
        customers.add(new Customer(2,"Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "img/anh2.jpg"));
        customers.add(new Customer(3,"Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "img/anh3.jpg"));
        customers.add(new Customer(4,"Trần Đăng Khoa", "1983-08-17", "Hà Tây", "img/anh4.jpg"));
        customers.add(new Customer(5,"Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "img/anh5.jpg"));

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
