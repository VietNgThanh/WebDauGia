package com.ute.webdaugia.filters;

import com.ute.webdaugia.beans.ParentCategory;
import com.ute.webdaugia.beans.ChildCategory;
import com.ute.webdaugia.models.ParentCategoryModel;
import com.ute.webdaugia.models.ChildCategoryModel;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LayoutFilter", value = "/*")
public class LayoutFilter implements Filter {
  public void init(FilterConfig config) throws ServletException {
  }

  public void destroy() {
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    List<ParentCategory> parentCategoryList = ParentCategoryModel.findAll();
    request.setAttribute("parentCategories", parentCategoryList);

    List<ChildCategory> childCategoryList = ChildCategoryModel.findAll();
    request.setAttribute("childCategories", childCategoryList);

    chain.doFilter(request, response);
  }
}
