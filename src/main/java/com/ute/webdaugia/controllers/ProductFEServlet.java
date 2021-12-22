package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static com.ute.webdaugia.models.ProductModel.addWatchList;


@WebServlet(name = "ProductFEServlet", value = "/Product/*")
public class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/ByCat":
            int catId = Integer.parseInt(request.getParameter("id"));
            List<Product> list = ProductModel.findByCatId(catId);
            request.setAttribute("products", list);
            ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
            break;

            case "/Detail":
                int proId = Integer.parseInt(request.getParameter("id"));
                Product product = ProductModel.findById(proId);
                if (product == null) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("product", product);
                    ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                }
                break;
            case "/addwatlist":
                int userId =0;
                HttpSession session = request.getSession();
                User user= (User) session.getAttribute("authUser");
                int watId =0;
                watId = Integer.parseInt(request.getParameter("id_product"));
                addWatchList(user.getIdUser(),watId);
                String  urlproduct = "/Product/ByCat?id=2#";
                ServletUtils.redirect(urlproduct, request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/addwatlist":
                int userId = 1;
                int watId = 5;
                addWatchList(userId,watId);
                ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
                break;
            case "/WatLDetail":
                int userId1 = 1;
                int watId1 = Integer.parseInt(request.getParameter("id"));
                addWatchList(userId1,watId1);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
}

