package com.ute.webdaugia.controllers;


import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.webdaugia.beans.Danh_Gia_NguoiDung;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.models.AccountModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.models.SendMail;
import com.ute.webdaugia.utils.*;
import com.ute.webdaugia.beans.User;

import javax.mail.MessagingException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Account", value = "/Account/*")
public class Acccount extends HttpServlet {
    private String message;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/DanhGia":
                int proId = Integer.parseInt(request.getParameter("id"));
                ServletUtils.forward("/views/vwAccount/Comment.jsp", request, response);
                break;
                case "/Register":
                ServletUtils.forward("/views/vwAccount/Register.jsp", request, response);
                break;
                case "/Login":
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                break;
                case "/IsAvailable":
                    String username = request.getParameter("username");
                    User user = AccountModel.findByusername(username);
                    boolean isAvailable = (user == null);
                    PrintWriter out = response.getWriter();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("utf-8");
                    out.print(isAvailable);
                    out.flush();
               break;
            case "/IsEmail":
                String email = request.getParameter("email");
                User c = AccountModel.findByEmail(email);
                boolean IsEmail = (c == null);
                PrintWriter outem = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                outem.print(IsEmail);
                outem.flush();
                break;
            case "/Verify":
                ServletUtils.forward("/views/vwAccount/RegisterVerify.jsp", request, response);
                break;
            case "/FogotPassWord":
                ServletUtils.forward("/views/vwAccount/FogotPassWord.jsp", request, response);
                break;
            case "/OTPFogotPassWord":
                ServletUtils.forward("/views/vwAccount/OTPFogotPassWord.jsp", request, response);
                break;
            case "/NewPassWord":
                ServletUtils.forward("/views/vwAccount/NewPassWord.jsp", request, response);
                break;
            case "/ChangePassWord":
                ServletUtils.forward("/views/vwAccount/ChangePassWord.jsp", request, response);
                break;
            case "/Profile":
                HttpSession session3 = request.getSession();
                User user3= (User) session3.getAttribute("authUser");
                User profile = AccountModel.findByidUser(user3.getIdUser());
                request.setAttribute("profile", profile);
                List<Danh_Gia_NguoiDung> bangdanhgia = AccountModel.HienthiDanhGia(user3.getIdUser());
                request.setAttribute("bangdanhgia",bangdanhgia);
                List<Product> dsachsanpham = AccountModel.HienThiSanPhamDangDauGia(user3.getIdUser());
                request.setAttribute("dsachsanpham",dsachsanpham);
                List<Product> dsachdathang = AccountModel.HienThiSanPhamDaThang(user3.getIdUser());
                request.setAttribute("dsachdathang",dsachdathang);
                List<User> listuser=AccountModel.danhsachtenUser();
                request.setAttribute("listuser",listuser);
                ServletUtils.forward("/views/vwAccount/Profile.jsp", request, response);
                break;

            case "/Seller_Profile":
                HttpSession session4 = request.getSession();
                User user4= (User) session4.getAttribute("authUser");
                User profile1 = AccountModel.findByidUser(user4.getIdUser());
                request.setAttribute("profile", profile1);
                List<Product> dsachban = AccountModel.HienThiSanPhamDangBan(user4.getIdUser());
                request.setAttribute("dsachban",dsachban);
                List<Danh_Gia_NguoiDung> bangdanhgia1 = AccountModel.HienthiDanhGia(user4.getIdUser());
                request.setAttribute("bangdanhgia1",bangdanhgia1);
                List<User> listuser1=AccountModel.danhsachtenUser();
                request.setAttribute("listuser1",listuser1);
                ServletUtils.forward("/views/vwAccount/Seller_profile.jsp",request,response);
                break;
            case "/URLDanhGia":
                int id = Integer.parseInt(request.getParameter("id"));
//                HttpSession session3 = request.getSession();
//                User user3= (User) session3.getAttribute("authUser");
                User profile2 = AccountModel.findByidUser(id);
                request.setAttribute("profile", profile2);
                List<Danh_Gia_NguoiDung> bangdanhgia2 = AccountModel.HienthiDanhGia(id);
                request.setAttribute("bangdanhgia",bangdanhgia2);
                List<User> listuser2=AccountModel.danhsachtenUser();
                request.setAttribute("listuser",listuser2);
                ServletUtils.forward("/views/vwAccount/URLDanhGia.jsp",request,response);
                break;
            case "/Uptoseller":
                HttpSession session5 = request.getSession();
                User user5= (User) session5.getAttribute("authUser");
                AccountModel.uptoSeller(user5);
                String  urlproduct = "/Account/Profile";
                ServletUtils.redirect(urlproduct, request, response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                try {
                    registerUser(request, response);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "/Login":
                loginUser(request,response);
                break;
            case "/Logout":
                logout(request, response);
                break;
            case "/Verify":
                verify(request,response);
                break;
            case "/FogotPassWord":
                try {
                    Fogot(request,response);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "/OTPFogotPassWord":
                otpFogot(request,response);
                break;
            case "/NewPassWord":
                newPassWord(request,response);
                break;
            case "/ChangePassWord":
                changePassWord(request,response);
                break;
            case "/Profile":
                updateProfile(request,response);
                break;
            case "/DanhGia":
                addDanhGia(request,response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }

    }
    private void addDanhGia(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("authUser");

        String comment = request.getParameter("comment");
        int trangthai = Integer.parseInt(request.getParameter("trangthai"));
        int  id_nguoi_duoc_danhgia = Integer.parseInt(request.getParameter("id"));

        Danh_Gia_NguoiDung c = new Danh_Gia_NguoiDung(user.getIdUser(),id_nguoi_duoc_danhgia,comment,trangthai);
        AccountModel.addDanhGia(c);
        String  urlproduct = "/Account/DanhGia?id=" + Integer.toString(id_nguoi_duoc_danhgia);
        ServletUtils.redirect(urlproduct, request, response);
    }
    private void updateProfile(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("authUser");

        String name = request.getParameter("name");
        String email = request.getParameter("email1");
        String address = request.getParameter("address");
        User c = new User(user.getIdUser(),user.getUsername(),user.getPassword(),name,email,address,user.getPermission());
        AccountModel.updateProfile(c);
        String  urlproduct = "/Account/Profile";
        ServletUtils.redirect(urlproduct, request, response);
    }

    private void changePassWord(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String rawpw = request.getParameter("rawpw");
        String cfmpw = request.getParameter("cfmpw");
        String oldpassword = request.getParameter("oldpw");
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("authUser");
        BCrypt.Result result = BCrypt.verifyer().verify(oldpassword.toCharArray(), user.getPassword());
        if(rawpw.equals(cfmpw)){
            if(result.verified){
                String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpw.toCharArray());
                user.setPassword(bcryptHashString);
                AccountModel.updateUserFogotPassword(user);
                session.setAttribute("authUser",user);
                String  urlz = "/Home/Index";
                ServletUtils.redirect(urlz, request, response);
            }else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Sai");
                ServletUtils.forward("/views/vwAccount/ChangePassWord.jsp", request, response);
            }
        }
        else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Sai");
            ServletUtils.forward("/views/vwAccount/ChangePassWord.jsp", request, response);
        }
    }

    private void newPassWord(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String rawpw = request.getParameter("rawpw");
        String cfmpw = request.getParameter("cfmpw");
        String password = BCrypt.withDefaults().hashToString(12, rawpw.toCharArray());
        if(rawpw.equals(cfmpw)){
            HttpSession session = request.getSession();
            User user= (User) session.getAttribute("FogotEmail");
            user.setPassword(password);
            AccountModel.updateUserFogotPassword(user);

        }
        else{
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Sai");
            ServletUtils.forward("/views/vwAccount/NewPassWord.jsp", request, response);
        }

    }

    private void otpFogot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String codecf = request.getParameter("code");
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("FogotEmail");
        String rawpwd = user.getPassword();
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        String username = user.getUsername();
        String name = user.getName();
        String email = user.getEmail();
        String address = user.getAddress();
        int permission = user.getPermission();
        int id = user.getIdUser();
        User c = new User(id,username,bcryptHashString,name,email,address,permission);
        String code = (String) session.getAttribute("FogotCodeAccess");
        if(codecf.equals(code)){
            session.setAttribute("FogotEmail",c);
            String  urlz = "/Account/NewPassWord";
            ServletUtils.redirect(urlz, request, response);
        }
        else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Sai");
            ServletUtils.forward("/views/vwAccount/OTPFogotPassWord.jsp", request, response);
        }
    }

    private void Fogot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MessagingException {
        String email = request.getParameter("email");
        User user =  AccountModel.findByEmail(email);
        if(user != null){
            SendMail sendMail = new SendMail();
            String code = sendMail.getRandom();
            boolean sm = sendMail.Sendmail(email,code);
            if(sm){
                HttpSession session  = request.getSession();
                session.setAttribute("FogotEmail", user);
                session.setAttribute("FogotCodeAccess",code);
                String  urlz = "/Account/OTPFogotPassWord";
                ServletUtils.redirect(urlz, request, response);
            }
        }
        else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Sai");
            ServletUtils.forward("/views/vwAccount/FogotPassWord.jsp", request, response);
        }
    }

    private void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codecf = request.getParameter("code");
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("authcode");
        String code = (String) session.getAttribute("codex");
        String rawpwd = user.getPassword();
        String username = user.getUsername();
        String name = user.getName();
        String email = user.getEmail();
        String address = user.getAddress();
        int permission = 0;
        if(codecf.equals(code)){
            User c = new User(0, username,rawpwd,name,email,address,permission);
            AccountModel.add(c);
            String  urlz = "/Account/Login";
            ServletUtils.redirect(urlz, request, response);
        }
        else{
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/RegisterVerify.jsp", request, response);
        }
    }

    public void registerUser (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MessagingException {
        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int permission = 0;
        int mark =0;
        SendMail sendMail = new SendMail();
        String code = sendMail.getRandom();
        User c = new User(0, username,bcryptHashString,name,email,address,permission,mark);
        boolean sm = sendMail.Sendmail(c.getEmail(),code);
        if(sm){
            HttpSession session  = request.getSession();
            session.setAttribute("authcode", c);
            session.setAttribute("codex",code);
            String  urlz = "/Account/Verify";
            ServletUtils.redirect(urlz, request, response);
        }else{
//            out.println("Failed to send verification email");
        }
//        ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
    }
    public void loginUser (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = AccountModel.findByusername(username);
        if (user != null) {
            if(user.getPassword().isEmpty()){
                if(password.isEmpty()){
                    HttpSession session = request.getSession();
                    session.setAttribute("auth", true);
                    session.setAttribute("authUser", user);
                    String ulr ="/Home1/Index";
                    ServletUtils.redirect(ulr,request,response);
                }
                else {
                    request.setAttribute("hasError", true);
                    request.setAttribute("errorMessage", "Invalid login.");
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                }
            }
            else
            {
                BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
                if (result.verified) {
                    HttpSession session = request.getSession();
                    session.setAttribute("auth", true);
                    session.setAttribute("authUser", user);
                    String ulr ="/Home1/Index";
                    ServletUtils.redirect(ulr,request,response);
                }
                else {
                    request.setAttribute("hasError", true);
                    request.setAttribute("errorMessage", "Invalid login.");
                    ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
                }
            }
        }
        else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        //String urlz = request.getHeader("referer");
        //if (urlz == null)
        String  urlz = "/Home/Index";
        ServletUtils.redirect(urlz, request, response);
    }
}