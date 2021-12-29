package com.ute.webdaugia.controllers;

import com.ute.webdaugia.beans.ChildCategory;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.ChildCategoryModel;
import com.ute.webdaugia.beans.ParentCategory;
import com.ute.webdaugia.models.ParentCategoryModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

    @WebServlet(name = "AdminCategoryServlet", value = "/Admin/Category/*")
public class AdminCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("authUser");
        if (!loggedUser.isAdmin()) {
            ServletUtils.forward("/views/403.jsp", request, response);
            return;
        }

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
            case "/Edit":
                int parentId = 0;
                int childId = 0;
                try {
                    parentId = Integer.parseInt(request.getParameter("parentid"));
                } catch (NumberFormatException e) {
                }
                try {
                    childId = Integer.parseInt(request.getParameter("childid"));
                } catch (NumberFormatException e) {
                }
                ParentCategory parentCategory = ParentCategoryModel.findById(parentId);
                ChildCategory childCategory = ChildCategoryModel.findById(childId);
                if (parentCategory != null) {
                    request.setAttribute("parentCategory", parentCategory);

                    if (path.equals("/AddChild")) {
                        ServletUtils.forward("/views/vwCategory/AddChildCategory.jsp", request, response);
                    }
                    else {
                        ServletUtils.forward("/views/vwCategory/Edit.jsp", request, response);
                    }

                } else if (childCategory != null){
                    request.setAttribute("childCategory", childCategory);
                    ServletUtils.forward("/views/vwCategory/Edit.jsp", request, response);
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

            case "/CanDelete":
                int childIdDelete = 0;
                int parentIdDelete = 0;
                boolean canDelete = false;

                try {
                    childIdDelete = Integer.parseInt(request.getParameter("childId"));
                }
                catch (NumberFormatException e) {
                }

                if (childIdDelete == 0) {
                    try {
                        parentIdDelete = Integer.parseInt(request.getParameter("parentId"));
                    } catch (NumberFormatException e) {
                    }

                    canDelete = !(ParentCategoryModel.hasProduct(parentIdDelete));
                }
                else {
                    canDelete = !(ChildCategoryModel.hasProduct(childIdDelete));
                }

                PrintWriter outD = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                outD.print(canDelete);
                outD.flush();
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("authUser");
        if (!loggedUser.isAdmin()) {
            ServletUtils.forward("/views/403.jsp", request, response);
            return;
        }

        String path = request.getPathInfo();
        switch (path) {
            case "/Add":
                addParentCategory(request, response);
                break;

            case "/AddChild":
                addChildCategory(request, response);
                break;

            case "/Update":
                updateParentCategory(request, response);
                break;

            case "/UpdateChild":
                updateChildCategory(request, response);
                break;

            case "/Delete":
                deleteParentCategory(request, response);
                break;

            case "/DeleteChild":
                deleteChildCategory(request, response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void addParentCategory(HttpServletRequest request, HttpServletResponse response) throws
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

    private void updateParentCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("CatID"));
        } catch (NumberFormatException e) {
        }

        String name = request.getParameter("CatName");
        ParentCategory c = new ParentCategory(id, name);
        ParentCategoryModel.update(c);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void updateChildCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("CatID"));
        } catch (NumberFormatException e) {
        }

        String name = request.getParameter("CatName");
        ChildCategory c = new ChildCategory(id, name);
        ChildCategoryModel.update(c);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteParentCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int parentId = Integer.parseInt(request.getParameter("CatID"));
        List<ChildCategory> childs = ChildCategoryModel.findByParentId(parentId);
        for (ChildCategory c : childs) {
            ChildCategoryModel.delete(c.getId());
        }
        ParentCategoryModel.delete(parentId);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteChildCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("CatID"));
        ChildCategoryModel.delete(id);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
}
