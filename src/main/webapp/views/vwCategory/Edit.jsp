<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:catch var="catchException">
  <jsp:useBean id="parentCategory" scope="request" type="com.ute.webdaugia.beans.ParentCategory"/>
  <jsp:useBean id="childCategory" scope="request" type="com.ute.webdaugia.beans.ChildCategory"/>
</c:catch>


<t:adminUser>
  <jsp:attribute name="js">
    <script>
        $('#btnSave').click(function (e) {
            e.preventDefault();
            const catName = $('#txtCatName').val().trim();

            if (catName.length === 0) {
                alert('Please enter category name.');
                $('#txtCatName').select();
            }
            else {
                $('#btnSave').off('click').click();
            }
        });

        $('#btnDelete').click(function (e) {
            e.preventDefault();
            const id = $('#txtCatID').val();
            let editChildOrParent = 'childId';
            if ($('#headerr').text().includes('Main')) {
                editChildOrParent = 'parentId';
            }

            $.getJSON('${pageContext.request.contextPath}/Admin/Category/CanDelete?' + editChildOrParent + '=' + id, function (data) {
                if (data === true) {
                    $('#btnDelete').off('click').click();
                } else {
                    alert('This category has product(s) and cannot be delete.');
                    $('#btnDelete').select();
                }
            });
        });
    </script>
  </jsp:attribute>

  <jsp:body>
    <form id="frmEditCategory" action="" method="post">
      <div class="card">
        <h4 id="headerr" class="card-header">
          <c:if test="${not empty parentCategory}">
            Edit Main Category
          </c:if>
          <c:if test="${not empty childCategory}">
            Edit Child Category
          </c:if>
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
          <button id="btnDelete" type="submit" class="btn btn-danger"
                  <c:if test="${not empty parentCategory}">
                    formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                  </c:if>
                  <c:if test="${not empty childCategory}">
                    formaction="${pageContext.request.contextPath}/Admin/Category/DeleteChild">
                  </c:if>
          <i class="fa fa-trash-o" aria-hidden="true"></i>
            Delete
          </button>
          <button id="btnSave" type="submit" class="btn btn-primary"
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