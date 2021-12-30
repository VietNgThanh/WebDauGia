package com.ute.webdaugia.controllers;


import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.AdminUserModel;
import com.ute.webdaugia.models.OrderModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.models.SendMail;
import com.ute.webdaugia.utils.ServletUtils;


import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
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
            case "/DkiSeller/NoAccess":
                int idx =0;
                idx = Integer.parseInt(request.getParameter("id"));
                AdminUserModel.nouptoSeller(idx);
                String  urlzx = "/Admin/DkiSeller/Index";
                ServletUtils.redirect(urlzx, request, response);
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
                List<Product> productbySeller = ProductModel.findByUser(idseller);
                request.setAttribute("products",productbySeller);
                request.setAttribute("seller",user);
                ServletUtils.forward("/views/vwAdminUser/InfoSeller.jsp", request, response);
                break;
            case "/QuanLiSeller/DeleteSeller":
                int id_seller =0;
                id_seller = Integer.parseInt(request.getParameter("id"));
                ArrayList<Product> pro_seller = ProductModel.findProductbySeller(id_seller);
                for(int i=0;i<pro_seller.size();i++){
                    Product pr = pro_seller.get(i);
                    OrderModel.deleteOrbyPr(pr.getIdProduct());
                    ProductModel.deteleProducttuchoi(pr.getIdProduct());
                    ProductModel.deteleProduct(pr.getIdProduct());
                }
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
                OrderModel.deleteOrbyPr(id_product);
                ProductModel.deteleProducttuchoi(id_product);
                ProductModel.deteleProduct(id_product);
                String  urlproduct = "/Admin/QuanLiSanPham/Index";
                ServletUtils.redirect(urlproduct, request, response);
                break;
            case "/QuanLiUser/Index":
                List<User> listbidder = AdminUserModel.findBidder();
                request.setAttribute("bidders",listbidder);
                ServletUtils.forward("/views/vwAdminUser/ListUser.jsp", request, response);
                break;
            case "/QuanLiUser/Info":
                int idbi = 0;
                idbi = Integer.parseInt(request.getParameter("id"));
                User bidder = AdminUserModel.findById(idbi);
                ArrayList<Product> productdangdaugia = new ArrayList<Product>();
                ArrayList<Product> productdadaugia = new ArrayList<Product>();
                ArrayList<Integer> productid = OrderModel.findproductbidderDaugia(idbi);
                if(productid != null)
                {
                    for(int i=0; i<productid.size();i++){
                        int x = productid.get(i);
                        if(ProductModel.findproductcontontai(x) != null){
                            productdangdaugia.add(ProductModel.findproductcontontai(x));
                        }
                        if(ProductModel.findproductdadaugia(x,idbi) != null){
                            productdadaugia.add(ProductModel.findproductdadaugia(x,idbi));
                        }
                    }
                }


                request.setAttribute("productdangdaugia",productdangdaugia);
                request.setAttribute("productsus",productdadaugia);
                request.setAttribute("bidder",bidder);
                ServletUtils.forward("/views/vwAdminUser/InfoBidder.jsp", request, response);
                break;
            case"/ResetPassWord":
                int idUser =0;
                idUser = Integer.parseInt(request.getParameter("id"));
                User UserReset = AdminUserModel.findById(idUser);
                String pw ="";
                String mess=" Mat Khau Tai khoan " + UserReset.getUsername() +" Da Duoc Reset";
                if(UserReset.getPermission()==1 || UserReset.getPermission()==4){
                    AdminUserModel.resetPassword(pw,idUser);
                    SendMail sendMail = new SendMail();
                    try {
                        sendMail.Sendmail(UserReset.getEmail(),mess);
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }

                    String ulr ="/Admin/QuanLiUser/Info?id=" + UserReset.getIdUser();
                    ServletUtils.redirect(ulr,request,response);
                }
                else {
                    AdminUserModel.resetPassword(pw,idUser);
                    SendMail sendMail = new SendMail();
                    try {
                        sendMail.Sendmail(UserReset.getEmail(),mess);
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }

                    String ulr ="/Admin/QuanLiSeller/Info?id=" + UserReset.getIdUser();
                    ServletUtils.redirect(ulr,request,response);
                }
                break;
            case"/DeleteUser":
                int idUserx =0;
                idUserx = Integer.parseInt(request.getParameter("id"));
                User deU = AdminUserModel.findById(idUserx);
                if(deU.getPermission() == 2){
                    ArrayList<Product> pro_sellerx = ProductModel.findProductbySeller(idUserx);
                    for(int i=0;i<pro_sellerx.size();i++){
                        Product pr = pro_sellerx.get(i);
                        OrderModel.deleteOrbyPr(pr.getIdProduct());
                        ProductModel.deteleProducttuchoi(pr.getIdProduct());
                        ProductModel.deteleProduct(pr.getIdProduct());
                    }
                    AdminUserModel.deletedanhgia(idUserx);
                    AdminUserModel.deleteUser(idUserx);
                }
                else{
                    OrderModel.deleteOrbyIdUser(idUserx);
                    AdminUserModel.deletedanhgia(idUserx);
                    AdminUserModel.deleteUser(idUserx);
                }
                String ulrz ="/Admin/QuanLiUser/Index" ;
                ServletUtils.redirect(ulrz,request,response);
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
