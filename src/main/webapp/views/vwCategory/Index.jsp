<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="parentCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ParentCategory>"/>
<jsp:useBean id="childCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ChildCategory>"/>

<t:adminUser>
  <jsp:body>
    <div class="card">
      <h4 class="card-header d-flex justify-content-between">
        Main Categories
        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/Add" role="button">
          <i class="fa fa-plus" aria-hidden="true"></i>
          Add Main Category
        </a>
      </h4>
      <c:choose>
        <c:when test="${parentCategories.size() == 0}">
          <div class="card-body">
            <p class="card-text">Không có dữ liệu.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="card-body">
            <table class="table table-hover">
              <thead>
              <tr>
                <th>#</th>
                <th colspan="2">Category</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${parentCategories}" var="parentCat">
                <tr>
                  <td style="width: 15%">${parentCat.id}</td>
                  <td colspan="2" style="width: 70%">${parentCat.name}</td>
                  <td style="width: 15%" class="text-right">
                    <a class="btn btn-sm btn-success"
                       href="${pageContext.request.contextPath}/Admin/Category/AddChild?parentid=${parentCat.id}" role="button">
                      <i class="fa fa-plus" aria-hidden="true"></i>
                    </a>
                    <a class="btn btn-sm btn-primary"
                       href="${pageContext.request.contextPath}/Admin/Category/Edit?parentid=${parentCat.id}" role="button">
                      <i class="fa fa-pencil" aria-hidden="true"></i>
                    </a>
                    <a class="btn btn-sm btn-outline-secondary" data-toggle="collapse"
                       href="#collapse-main-${parentCat.id}" role="button" aria-expanded="false"
                       aria-controls="collapse-main-${parentCat.id}">
                      <i class="fa fa-caret-down" aria-hidden="true"></i>
                    </a>
                  </td>
                </tr>

                <c:forEach items="${childCategories}" var="childCat">
                  <c:if test="${parentCat.id eq childCat.parent_id}">
                    <tr class="collapse" id="collapse-main-${parentCat.id}">
                      <td style="width: 15%">&nbsp;</td>
                      <td style="width: 10%">${childCat.id}</td>
                      <td style="width: 60%">
                        ${childCat.name}
                      </td>
                      <td style="width: 15%">
                        <a class="btn btn-sm btn-outline-primary"
                           href="${pageContext.request.contextPath}/Admin/Category/Edit?childid=${childCat.id}" role="button">
                          <i class="fa fa-pencil" aria-hidden="true"></i>
                        </a>
                      </td>
                    </tr>
                  </c:if>
                </c:forEach>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </jsp:body>
</t:adminUser>