package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.beans.Wishlist;
import com.ute.webdaugia.beans.Orders;
import com.ute.webdaugia.models.AdminUserModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.models.OrderModel;
import com.ute.webdaugia.utils.ServletUtils;
import org.sql2o.converters.Convert;
import java.time.Duration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static com.ute.webdaugia.models.ProductModel.*;


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
            HttpSession session = request.getSession();
            User user= (User) session.getAttribute("authUser");
            List<Wishlist> wlist1=ProductModel.findAllWList(user.getIdUser());
            request.setAttribute("wlists",wlist1);
            ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
            break;

            case "/Detail":
                int proId = Integer.parseInt(request.getParameter("id"));
                Product product = ProductModel.findById(proId);
                if (product == null) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("product", product);
                    int userId2 =0;
            HttpSession session2 = request.getSession();
            User user2= (User) session2.getAttribute("authUser");
                    List<Wishlist> wlist2=ProductModel.findAllWList(user2.getIdUser());
                    request.setAttribute("wlists",wlist2);
                    ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                }
                break;
            case "/ByParentCatID":
                int PaCaID = Integer.parseInt(request.getParameter("id"));
                List<Product> list1 = ProductModel.findbyparentID(PaCaID);
                List<User> list2 = AdminUserModel.findAllUser_verpa();
                List<Orders> list3 = OrderModel.find_all_product_per1();
//                Duration a=Orders.main()
                request.setAttribute("products_PaCaID", list1);
                request.setAttribute("list_user", list2);
                request.setAttribute("list_date_update", list3);
                ServletUtils.forward("/views/vwProduct/ByParentID.jsp", request, response);
                break;
            case "/addwatlist":
                int catId1 = 0;
                HttpSession session3 = request.getSession();
                User user3= (User) session3.getAttribute("authUser");
                int watId =0;
                watId = Integer.parseInt(request.getParameter("id_product"));
                addWatchList(user3.getIdUser(),watId);
                catId1=findidCatByidproduct(watId);
                String  urlproduct = "/Product/ByCat?id=" +Integer.toString(catId1);
                ServletUtils.redirect(urlproduct, request, response);
                break;
            case "/delwatlist":
                int catId2 = 0;
                HttpSession session4 = request.getSession();
                User user4= (User) session4.getAttribute("authUser");
                int watId2 =0;
                watId2 = Integer.parseInt(request.getParameter("id_product"));
                delWatchList(user4.getIdUser(),watId2);
                catId2=findidCatByidproduct(watId2);
                String  urlproduct2 = "/Product/ByCat?id=" +Integer.toString(catId2);
                ServletUtils.redirect(urlproduct2, request, response);
                break;
            case "/delwatlistinWatList":
                HttpSession session5 = request.getSession();
                User user5= (User) session5.getAttribute("authUser");
                int watId3 =0;
                watId3 = Integer.parseInt(request.getParameter("id_product"));
                delWatchList(user5.getIdUser(),watId3);
                List<Product> wlist2 = ProductModel.findByIdWatList();
                request.setAttribute("products", wlist2);
                ServletUtils.forward("/views/vwProduct/WatList.jsp", request, response);
                break;
            case "/WatList":
                List<Product> wlist = ProductModel.findByIdWatList();
                request.setAttribute("products", wlist);
                ServletUtils.forward("/views/vwProduct/WatList.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
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

