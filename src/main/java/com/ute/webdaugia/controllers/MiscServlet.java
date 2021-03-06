package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.ChildCategory;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.ChildCategoryModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MiscServlet", value = "/Misc/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)

public class MiscServlet extends HttpServlet {
  public  int counter=0;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    User loggedUser = (User) session.getAttribute("authUser");
    if (!loggedUser.isSeller()) {
      ServletUtils.forward("/views/403.jsp", request, response);
      return;
    }
    String path = request.getPathInfo();
    switch (path) {

      case "/Editor":
        List<ChildCategory> list1= ChildCategoryModel.findAll();
        List<Product> list2=ProductModel.findAll();
        request.setAttribute("abc",list1);
        ServletUtils.forward("/views/vwMisc/Editor.jsp", request, response);
        break;

      case "/Upload":
        ServletUtils.forward("/views/vwMisc/Upload.jsp", request, response);
        break;

      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");

    String path = request.getPathInfo();
    switch (path) {
      case "/Editor":
        postEditor(request, response);
        break;

      case "/Upload":
        postUpload(request, response);
        break;

      case "/AddFullDes":
        addDescription(request, response);
        break;

      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  private void postUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println(request.getParameter("ProName"));

//    for (Part part : request.getParts()) {
//      if (part.getName().equals("fuMain")) {
//        String contentDisposition = part.getHeader("content-disposition");
//        // System.out.println(contentDisposition);
//        String[] items = contentDisposition.split(";");
//        for (String s : items) {
//          String tmp = s.trim();
//          if (tmp.startsWith("filename")) {
//            int idx = tmp.indexOf("=") + 2;
//            String filename = tmp.substring(idx, tmp.length() - 1);
//
//            String targetDir = this.getServletContext().getRealPath("public/user-avatars");
//            File dir = new File(targetDir);
//            if (!dir.exists()) {
//              dir.mkdir();
//            }
//            String destination = targetDir + "/" + filename;
//            part.write(destination);
//          }
//        }
//      }
//    }
//    ServletUtils.forward("/views/vwMisc/Upload.jsp", request, response);
  }

  private void postEditor(HttpServletRequest request, HttpServletResponse response) throws
          ServletException, IOException
  {

    String namePro=request.getParameter("ProName");
    System.out.println(namePro);


    int startP=  Integer.parseInt(request.getParameter("StartPrice"));
    System.out.println(startP);

    String txtProType =  request.getParameter("cata");
    String txtIdProType = txtProType.split("\\.")[0];
    int idCat = Integer.parseInt(txtIdProType);
    System.out.println(txtIdProType);
    int checkdelay=Integer.parseInt(request.getParameter("check_delay1"));
//    String[] abc=request.getParameterValues("check_delay");
//    String abc=request.getParameterValues("check_delay").toString();
//    if(abc!=null)
//    {
//         checkdelay=1;
//    }
    int immeP=  Integer.parseInt(request.getParameter("ImmePrice"));
    System.out.println(immeP);

    int buocnhay=  Integer.parseInt(request.getParameter("buocnhay"));
    System.out.println(buocnhay);

    String tinyDesc = request.getParameter("TinyDes");
    System.out.println(tinyDesc);

    String desc = request.getParameter("FullDes");
    System.out.println(desc);

    HttpSession session = request.getSession();
    User user= (User) session.getAttribute("authUser");

    System.out.println("Check delay 3");
    System.out.println(checkdelay);

    System.out.println("Check delay 3");
    System.out.println(checkdelay);
    int  countImage= 1;
    for ( Part part : request.getParts()){
      if (part.getName().equals("fuMain")) {
        countImage = countImage + 1;
      }
    }
    Product a=new Product(idCat,startP,immeP,buocnhay,namePro,tinyDesc,desc, user.getIdUser(), checkdelay,1,0,countImage-1);
    ProductModel.Add_Seller_Product(a);
    counter=ProductModel.Max_idpro();
    String b=String.valueOf(counter);
    countImage=1;
    for ( Part part : request.getParts()){
      if (part.getName().equals("fuMain")) {

        String targetDir = this.getServletContext().getRealPath("public/imgs/" + b);

        File dir = new File(targetDir);
        if (!dir.exists()) {
          dir.mkdir();
        }
        String filename = String.valueOf(countImage) + ".jpg";
        String destination = targetDir + "/" + filename;
        part.write(destination);
        countImage = countImage + 1;
      }
    }
    String  urlz = "/Product/ByCat?id="+idCat;
    ServletUtils.redirect(urlz, request, response);
  }


  private void addDescription(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int proId = 0;
    String txtAddFullDes = request.getParameter("txtAddFullDes").trim();
    try {
        proId = Integer.parseInt(request.getParameter("id"));
    }
    catch (NumberFormatException e){}
    if (proId == 0 || txtAddFullDes == null) {
        return;
    }

    ProductModel.addFullDes(proId, txtAddFullDes);
    ServletUtils.redirect("/Product/Detail?id=" + proId, request, response);
  }
}
