package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.Orders;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.OrderModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "OrderServlet", value = "/Home1/*")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Index":
                List<Product> list = ProductModel.find_top_highest_price();
                List<Orders> list2=OrderModel.find_top_count_order();
                List<Product> list3=ProductModel.find_top_gonna_expire();
                List<Product> list1 = ProductModel.findAll();
                request.setAttribute("top_product", list);
                request.setAttribute("top_product2",list2);
                request.setAttribute("top_product3",list3);
                request.setAttribute("products", list1);
                ServletUtils.forward("/views/vwHome/Home1.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}


