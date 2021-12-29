package com.ute.webdaugia.controllers;


import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.AdminUserModel;
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
@WebServlet(name = "AdminDkiSeller", value = "/Admin/*")
public class AdminUser extends HttpServlet {
    private String message;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("authUser");
        if (!loggedUser.isAdmin()) {
            ServletUtils.forward("/views/403.jsp", request, response);
            return;
        }

        String path = request.getPathInfo();
        switch (path) {
            case "/DkiSeller/Index":
                List<User> list = AdminUserModel.findAllUser();
                request.setAttribute("users", list);
                ServletUtils.forward("/views/vwAdminUser/UptoSeller.jsp", request, response);
                break;
                case "/DkiSeller/Access":
                int id =0;
                id = Integer.parseInt(request.getParameter("id"));
                AdminUserModel.uptoSeller(id);
                String  urlz = "/Admin/DkiSeller/Index";
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
                List<Product> productbySeller = ProductModel.findByCatId(idseller);
                request.setAttribute("products",productbySeller);
                request.setAttribute("seller",user);
                ServletUtils.forward("/views/vwAdminUser/InfoSeller.jsp", request, response);
                break;
            case "/QuanLiSeller/DeleteSeller":
                int id_seller =0;
                id_seller = Integer.parseInt(request.getParameter("id"));
                AdminUserModel.deleteSeller(id_seller);
                String  url = "/Admin/QuanLiSeller/Index";
                ServletUtils.redirect(url, request, response);
                break;
            case "/QuanLiSanPham/Index":
                List<Product> listproduct = ProductModel.findAll();
                List<User> sellers = AdminUserModel.findAllSeller();
                request.setAttribute("sellers",sellers);
                request.setAttribute("products",listproduct);
                ServletUtils.forward("/views/vwAdminUser/ListProduct.jsp", request, response);
                break;
            case "/QuanLiSanPham/Info":
                int id_pro =0;
                id_pro = Integer.parseInt(request.getParameter("id"));
                Product product = ProductModel.findById(id_pro);
                User seller_pro = AdminUserModel.findById(product.getUserid());
                request.setAttribute("product",product);
                request.setAttribute("seller",seller_pro);
                ServletUtils.forward("/views/vwAdminUser/InfoProduct.jsp", request, response);
                break;
            case"/QuanLiSanPham/DeleteProduct":
                int id_product =0;
                id_product = Integer.parseInt(request.getParameter("id"));
                ProductModel.deteleProduct(id_product);
                String  urlproduct = "/Admin/QuanLiSanPham/Index";
                ServletUtils.redirect(urlproduct, request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
}
