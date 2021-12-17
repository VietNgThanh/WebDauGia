package com.ute.ecwebapp.controllers;


import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.ecwebapp.models.AccountModel;
import com.ute.ecwebapp.models.SendMail;
import com.ute.ecwebapp.utils.*;
import com.ute.ecwebapp.beans.User;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Account", value = "/Account/*")
public class Acccount extends HttpServlet {
    private String message;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String path = request.getPathInfo();
        switch (path) {
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
               case "/Verify":
                   ServletUtils.forward("/views/vwAccount/RegisterVerify.jsp", request, response);
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
        }

    }

    private void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codecf = request.getParameter("code");
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("authcode");
        String code = user.getCode();
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
            System.out.println(codecf);
            System.out.println(code);
        }
        else{
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/RegisterVerify.jsp", request, response);
            System.out.println(codecf);
            System.out.println(code);
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
        SendMail sendMail = new SendMail();
        String code = sendMail.getRandom();
        User c = new User(0, username,bcryptHashString,name,email,address,permission,code);
        boolean sm = sendMail.Sendmail(c);
        if(sm){
            HttpSession session  = request.getSession();
            session.setAttribute("authcode", c);
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
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
                String ulr ="/Home/Index";
                ServletUtils.redirect(ulr,request,response);
            }
            else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
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