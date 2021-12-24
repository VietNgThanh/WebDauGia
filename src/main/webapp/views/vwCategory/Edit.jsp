<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:catch var="catchException">
  <jsp:useBean id="parentCategory" scope="request" type="com.ute.webdaugia.beans.ParentCategory"/>
  <jsp:useBean id="childCategory" scope="request" type="com.ute.webdaugia.beans.ChildCategory"/>
</c:catch>


<t:adminUser>
  <jsp:body>
    <form action="" method="post">
      <div class="card">
        <h4 class="card-header">
          Category
        </h4>
        <div class="card-body">
          <div class="form-group">
            <label for="txtCatID">#</label>
            <c:if test="${not empty parentCategory}">
              <input type="text" class="form-control" id="txtCatID" name="CatID" readonly value="${parentCategory.id}">
            </c:if>
            <c:if test="${not empty childCategory}">
              <input type="text" class="form-control" id="txtCatID" name="CatID" readonly value="${childCategory.id}">
            </c:if>

          </div>
          <div class="form-group">
            <label for="txtCatName">Category</label>
            <c:if test="${not empty parentCategory}">
              <input type="text" class="form-control" id="txtCatName" name="CatName" autofocus onfocus="this.select()"
                     value="${parentCategory.name}">
            </c:if>
            <c:if test="${not empty childCategory}">
              <input type="text" class="form-control" id="txtCatName" name="CatName" autofocus onfocus="this.select()"
                     value="${childCategory.name}">
            </c:if>
          </div>
        </div>
        <div class="card-footer">
          <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
            <i class="fa fa-backward" aria-hidden="true"></i>
            List
          </a>
          <button type="submit" class="btn btn-danger"
                  <c:if test="${not empty parentCategory}">
                    formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                  </c:if>
                  <c:if test="${not empty childCategory}">
                    formaction="${pageContext.request.contextPath}/Admin/Category/DeleteChild">
                  </c:if>
          <i class="fa fa-trash-o" aria-hidden="true"></i>
            Delete
          </button>
          <button type="submit" class="btn btn-primary"
                  <c:if test="${not empty parentCategory}">
                    formaction="${pageContext.request.contextPath}/Admin/Category/Update">
                  </c:if>
                  <c:if test="${not empty childCategory}">
                    formaction="${pageContext.request.contextPath}/Admin/Category/UpdateChild">
                  </c:if>
          <i class="fa fa-check" aria-hidden="true"></i>
            Save
          </button>
        </div>
      </div>
    </form>
  </jsp:body>
</t:adminUser>