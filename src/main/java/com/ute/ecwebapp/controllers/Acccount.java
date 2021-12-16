package com.ute.ecwebapp.controllers;


import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.ecwebapp.models.AccountModel;
import com.ute.ecwebapp.utils.*;
import com.ute.ecwebapp.beans.User;
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
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Register":
                registerUser(request, response);
                break;
            case "/Login":
                loginUser(request,response);
                break;

        }

    }
    public void registerUser (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String rawpwd = request.getParameter("rawpwd");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int permission = 0;
        User c = new User(0, username,bcryptHashString,name,email,address,permission);
        AccountModel.add(c);
        ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
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
}