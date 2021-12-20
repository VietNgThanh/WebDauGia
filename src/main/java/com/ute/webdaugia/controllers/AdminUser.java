package com.ute.webdaugia.controllers;


import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.AdminUserModel;
import com.ute.webdaugia.utils.ServletUtils;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "AdminDkiSeller", value = "/Admin/*")
public class AdminUser extends HttpServlet {
    private String message;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Dkiseller/Index":
                List<User> list = AdminUserModel.findAllUser();
                request.setAttribute("users", list);
                ServletUtils.forward("/views/vwAdminUser/UptoSeller.jsp", request, response);
            case "/Dkiseller/Access":
                int id =0;
                id = Integer.parseInt(request.getParameter("id"));
                AdminUserModel.uptoSeller(id);
                AdminUserModel.deteleDki(id);
                String  urlz = "/Admin/Dkiseller/Index";
                ServletUtils.redirect(urlz, request, response);
                break;
            case"/QuanLiSeller/Index":
                List<User> listseller = AdminUserModel.findAllSeller();
                request.setAttribute("sellers",listseller);
                ServletUtils.forward("/views/vwAdminUser/ListSeller.jsp", request, response);
                break;
            case"/QuanLiSeller/Info":
                int idseller =0;
                idseller = Integer.parseInt(request.getParameter("id"));
                User user = AdminUserModel.findById(idseller);
                request.setAttribute("seller",user);
                ServletUtils.forward("/views/vwAdminUser/InfoSeller.jsp", request, response);
                break;
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                break;
        }
    }
}
