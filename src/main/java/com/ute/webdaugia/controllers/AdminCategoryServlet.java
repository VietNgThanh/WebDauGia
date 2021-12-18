package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.ChildCategory;
import com.ute.webdaugia.models.ChildCategoryModel;
import com.ute.webdaugia.beans.ParentCategory;
import com.ute.webdaugia.models.ParentCategoryModel;
import com.ute.webdaugia.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AdminCategoryServlet", value = "/Admin/Category/*")
public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                ServletUtils.forward("/views/vwCategory/Index.jsp", request, response);
                break;

            case "/Add":
                ServletUtils.forward("/views/vwCategory/AddParentCategory.jsp", request, response);
                break;

            case "/AddChild":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("parentid"));
                } catch (NumberFormatException e) {
                }
                ParentCategory parentCategory = ParentCategoryModel.findById(id);
                if (parentCategory != null) {
                    request.setAttribute("parentCategory", parentCategory);
                    ServletUtils.forward("/views/vwCategory/AddChildCategory.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Category", request, response);
                }
                break;

            case "/IsAvailable":
                String name = request.getParameter("mainCat");
                ParentCategory p = ParentCategoryModel.findByName(name);
                boolean isAvailable = (p == null);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
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
            case "/Add":
                addMainCategory(request, response);
                break;

            case "/AddChild":
                addChildCategory(request, response);
                break;
//
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void addMainCategory(HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
        String name = request.getParameter("ParentCategory");
        ParentCategory c = new ParentCategory(name);
        ParentCategoryModel.add(c);

        String rawChildCategories = request.getParameter("ChildCategories");
        String[] childCategories = rawChildCategories.split("\n");
        ParentCategory parentCat = ParentCategoryModel.findByName(name);
        int parentId = parentCat.getId();

        for (String s : childCategories) {
            s = s.trim();
            ChildCategory child = new ChildCategory(s.trim(), parentId);
            ChildCategoryModel.add(child);
        }
        ServletUtils.forward("/views/vwCategory/AddParentCategory.jsp", request, response);
    }

    private void addChildCategory(HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
        String parentName = request.getParameter("txtParentname");
        String childName = request.getParameter("txtChildname");

        ParentCategory parent = ParentCategoryModel.findByName(parentName);
        assert parent != null;
        ChildCategory c = new ChildCategory(childName, parent.getId());
        ChildCategoryModel.add(c);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
}
