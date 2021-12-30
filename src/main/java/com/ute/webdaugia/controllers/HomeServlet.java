package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.Orders;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.beans.Wishlist;
import com.ute.webdaugia.beans.SoLuotDauGia;
import com.ute.webdaugia.models.OrderModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Home", value = "/Home/*")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if(path == null || path.equals("/")){
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                HttpSession session2 = request.getSession();
                User user2= (User) session2.getAttribute("authUser");
                List<Product> list = ProductModel.find_top_highest_price();
                List<SoLuotDauGia> list2= OrderModel.find_top_count_order();
                List<Product> list3=ProductModel.find_top_gonna_expire();
                List<Product> list1 = ProductModel.findAll();
                request.setAttribute("top_product", list);
                request.setAttribute("top_product2",list2);
                request.setAttribute("top_product3",list3);
                request.setAttribute("products", list1);
                List<Wishlist> wlist2=ProductModel.findAllWList(user2.getIdUser());
                request.setAttribute("wlists",wlist2);
                ServletUtils.forward("/views/vwHome/Home.jsp", request, response);
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
