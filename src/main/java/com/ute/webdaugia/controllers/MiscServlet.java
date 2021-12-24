package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.ChildCategory;
import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.models.ChildCategoryModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
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
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getPathInfo();
    switch (path) {
      case "/Editor":
        List<ChildCategory> list1= ChildCategoryModel.findAll();
        request.setAttribute("laycata",list1);
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

      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  private void postUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println(request.getParameter("ProName"));

    // Collection<Part> parts = request.getParts();
    // System.out.println(parts.size());

    for (Part part : request.getParts()) {
      // System.out.println(part.getName());
      // for (String headerName : part.getHeaderNames()) {
      //   System.out.println(headerName);
      // }

      if (part.getName().equals("fuMain")) {
        String contentDisposition = part.getHeader("content-disposition");
        // System.out.println(contentDisposition);
        String[] items = contentDisposition.split(";");
        for (String s : items) {
          String tmp = s.trim();
          if (tmp.startsWith("filename")) {
            int idx = tmp.indexOf("=") + 2;
            String filename = tmp.substring(idx, tmp.length() - 1);

            String targetDir = this.getServletContext().getRealPath("public/user-avatars");
            File dir = new File(targetDir);
            if (!dir.exists()) {
              dir.mkdir();
            }
            String destination = targetDir + "/" + filename;
            part.write(destination);
          }
        }
      }
    }
    ServletUtils.forward("/views/vwMisc/Upload.jsp", request, response);
  }

  private void postEditor(HttpServletRequest request, HttpServletResponse response) throws
    ServletException, IOException {

    System.out.println(request.getParameter("ProName"));
    for (Part part : request.getParts()) {
      if (part.getName().equals("fuMain")) {
        String contentDisposition = part.getHeader("content-disposition");
        // System.out.println(contentDisposition);
        String[] items = contentDisposition.split(";");
        for (String s : items) {
          String tmp = s.trim();
          if (tmp.startsWith("filename")) {
            int idx = tmp.indexOf("=") + 2;
            String filename = tmp.substring(idx, tmp.length() - 1);
            String targetDir = this.getServletContext().getRealPath("public/imgs");
            File dir = new File(targetDir);
            if (!dir.exists()) {
              dir.mkdir();
            }
            String destination = targetDir + "/" + filename;
            part.write(destination);
          }
        }
      }
      String namePro=request.getParameter("ProName");
      System.out.println(namePro);


      int startP=  Integer.parseInt(request.getParameter("StartPrice"));
      System.out.println(startP);

      String txtProType =  request.getParameter("cata");
      String txtIdProType = txtProType.split("\\.")[0];
      int idCat = Integer.parseInt(txtIdProType);

      int immeP=  Integer.parseInt(request.getParameter("ImmePrice"));
      System.out.println(immeP);

      int buocnhay=  Integer.parseInt(request.getParameter("buocnhay"));
      System.out.println(buocnhay);

      String tinyDesc = request.getParameter("TinyDes");
      System.out.println(tinyDesc);

      String desc = request.getParameter("FullDes");
      System.out.println(desc);


      Product a=new Product(idCat,startP,immeP,buocnhay,namePro,tinyDesc,desc);
      ProductModel.Add_Seller_Product(a);
      ServletUtils.forward("/views/vwMisc/Editor.jsp", request, response);
    }
  }
}
