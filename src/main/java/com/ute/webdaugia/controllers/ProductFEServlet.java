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

    final int itemsPerPage = 3;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/ByCat":
                int catId = Integer.parseInt(request.getParameter("id"));
                List<Product> products = ProductModel.findByCatId(catId);

                if (products == null) {
                    request.setAttribute("products", products);
                    request.setAttribute("pageNo", 1);
                    request.setAttribute("pages", 1);
                    ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
                    return;
                }

                int pageNo = 0;
                try {
                    pageNo = Integer.parseInt(request.getParameter("p"));
                } catch (NumberFormatException e) {
                }

                int pages = products.size() / itemsPerPage;
                if (products.size() % itemsPerPage != 0) {
                    ++pages;
                }

                if (pageNo > pages || pageNo <= 0) {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    return;
                }

                if (pages == 1) {
                    request.setAttribute("pageNo", pageNo);
                    request.setAttribute("products", products);
                    request.setAttribute("pages", pages);
                    ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
                    return;
                }

                List<Product> subList = null;
                if (pageNo == pages) {
                    subList = products.subList(itemsPerPage * (pageNo - 1), products.size());
                } else {
                    subList = products.subList(itemsPerPage * (pageNo - 1), itemsPerPage * pageNo);
                }
                request.setAttribute("pageNo", pageNo);
                request.setAttribute("pages", pages);

                request.setAttribute("products", subList);
                int userId = 0;
//            HttpSession session = request.getSession();
//            User user= (User) session.getAttribute("authUser");
                List<Wishlist> wlist1 = ProductModel.findAllWList(1);
                request.setAttribute("wlists", wlist1);
                ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
                break;

            case "/Detail":
                int proId = Integer.parseInt(request.getParameter("id"));
                Product product = ProductModel.findById(proId);
                if (product == null) {
                    ServletUtils.redirect("/Home", request, response);
                } else {
                    request.setAttribute("product", product);
                    int userId2 = 0;
//            HttpSession session = request.getSession();
//            User user= (User) session.getAttribute("authUser");
                    List<Wishlist> wlist2 = ProductModel.findAllWList(1);
                    request.setAttribute("wlists", wlist2);
                    ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                }
                break;

            case "/ByParentCatID":
                int PaCaID = Integer.parseInt(request.getParameter("id"));
                List<Product> productsByParentID = ProductModel.findbyparentID(PaCaID);
                List<User> list2 = AdminUserModel.findAllUser_verpa();
                List<Orders> list3 = OrderModel.find_all_product_per1();

                if (productsByParentID == null) {
                    request.setAttribute("products", productsByParentID);
                    request.setAttribute("pageNo", 1);
                    request.setAttribute("pages", 1);
                    ServletUtils.forward("/views/vwProduct/ByParentID.jsp", request, response);
                    return;
                }

                int proByParentIdPageNo = 0;
                try {
                    proByParentIdPageNo = Integer.parseInt(request.getParameter("p"));
                } catch (NumberFormatException e) {
                }

                int proByParentIdPages = productsByParentID.size() / itemsPerPage;
                if (productsByParentID.size() % itemsPerPage != 0) {
                    ++proByParentIdPages;
                }

                if (proByParentIdPageNo > proByParentIdPages || proByParentIdPageNo <= 0) {
                    ServletUtils.forward("/views/404.jsp", request, response);
                    return;
                }

                if (proByParentIdPages == 1) {
                    request.setAttribute("pageNo", proByParentIdPageNo);
                    request.setAttribute("products", productsByParentID);
                    request.setAttribute("pages", proByParentIdPages);
                    ServletUtils.forward("/views/vwProduct/ByParentID.jsp", request, response);
                    return;
                }

                List<Product> proByParentIDSubList = null;
                if (proByParentIdPageNo == proByParentIdPages) {
                    proByParentIDSubList = productsByParentID.subList(itemsPerPage * (proByParentIdPageNo - 1), productsByParentID.size());
                } else {
                    proByParentIDSubList = productsByParentID.subList(itemsPerPage * (proByParentIdPageNo - 1), itemsPerPage * proByParentIdPageNo);
                }
                request.setAttribute("pageNo", proByParentIdPageNo);
                request.setAttribute("pages", proByParentIdPages);

                request.setAttribute("products_PaCaID", proByParentIDSubList);
                request.setAttribute("list_user", list2);
                request.setAttribute("list_date_update", list3);
                ServletUtils.forward("/views/vwProduct/ByParentID.jsp", request, response);
                break;

            case "/addwatlist":
//                int userId1 =1;
                int catId1 = 0;
//                HttpSession session1 = request.getSession();
//                User user1= (User) session1.getAttribute("authUser");
                int watId = 0;
                watId = Integer.parseInt(request.getParameter("id_product"));
                addWatchList(1, watId);
                catId1 = findidCatByidproduct(watId);
                String urlproduct = "/Product/ByCat?id=" + Integer.toString(catId1);
                ServletUtils.redirect(urlproduct, request, response);
                break;
            case "/delwatlist":
                int catId2 = 0;
//                HttpSession session1 = request.getSession();
//                User user1= (User) session1.getAttribute("authUser");
                int watId2 = 0;
                watId2 = Integer.parseInt(request.getParameter("id_product"));
                delWatchList(1, watId2);
                catId2 = findidCatByidproduct(watId2);
                String urlproduct2 = "/Product/ByCat?id=" + Integer.toString(catId2);
                ServletUtils.redirect(urlproduct2, request, response);
                break;

            case "/WatList":
                List<Product> wlist = ProductModel.findByIdWatList();
                request.setAttribute("products", wlist);
                ServletUtils.forward("/views/vwProduct/WatList.jsp", request, response);

            case "/Search":
                String txtSearch = request.getParameter("txtSearch");
                int searchPageNo = 0;
                try {
                    searchPageNo = Integer.parseInt(request.getParameter("p"));
                } catch (NumberFormatException e) {
                }
                pagingSearchResult(request, response, txtSearch, searchPageNo);
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
            case "/Search":
                String txtSearch = request.getParameter("search-box");
                int pageNo = 0;
                try {
                    pageNo = Integer.parseInt(request.getParameter("p"));
                } catch (NumberFormatException e) {
                }
                pagingSearchResult(request, response, txtSearch, pageNo);
                break;

            case "/addwatlist":
                int userId = 1;
                int watId = 5;
                addWatchList(userId, watId);
                ServletUtils.forward("/views/vwProduct/ByCat.jsp", request, response);
                break;
            case "/WatLDetail":
                int userId1 = 1;
                int watId1 = Integer.parseInt(request.getParameter("id"));
                addWatchList(userId1, watId1);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void pagingSearchResult(HttpServletRequest request, HttpServletResponse response, String txtSearch, int pageNo) throws ServletException, IOException {
        List<Product> products = ProductModel.findBySearch(txtSearch);

        if (products == null) {
            request.setAttribute("products", products);
            ServletUtils.forward("/views/vwProduct/Search.jsp", request, response);
            return;
        }
        int pages = products.size() / itemsPerPage;
        if (products.size() % itemsPerPage != 0) {
            ++pages;
        }

        if (pageNo > pages || pageNo <= 0) {
            ServletUtils.forward("/views/404.jsp", request, response);
            return;
        }

        if (pages == 1) {
            request.setAttribute("pageNo", pageNo);
            request.setAttribute("products", products);
            request.setAttribute("pages", pages);
            ServletUtils.forward("/views/vwProduct/Search.jsp", request, response);
            return;
        }

        List<Product> subList = null;
        if (pageNo == pages) {
            subList = products.subList(itemsPerPage * (pageNo - 1), products.size());
        } else {
            subList = products.subList(itemsPerPage * (pageNo - 1), itemsPerPage * pageNo);
        }
        request.setAttribute("pageNo", pageNo);
        request.setAttribute("products", subList);
        request.setAttribute("txtSearch", txtSearch);
        request.setAttribute("pages", pages);
        ServletUtils.forward("/views/vwProduct/Search.jsp", request, response);
    }
}

