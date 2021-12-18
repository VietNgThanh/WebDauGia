package com.ute.webdaugia.controllers;


import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.AccountModel;
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
import java.io.PrintWriter;

@WebServlet(name = "AdminDkiSeller", value = "/Admin/Dkiseller/*")
public class AdminUser extends HttpServlet {
    private String message;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Index":
                ServletUtils.forward("/views/vwAccount/ChangePassWord.jsp", request, response);
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
