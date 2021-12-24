<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:adminUser>
  <jsp:attribute name="js">
    <script>
        $('#frmAddMainCategory').on('submit', function (e) {
            e.preventDefault();

            const mainCatName = $('#txtMainCatName').val();
            const childCatNames = $('#txtAreaChildCat').val().trim();
            if (mainCatName.length === 0) {
                alert('Please enter Main Category.');
                $('#txtMainCatName').select();
                return;
            }

            if (childCatNames.length === 0) {
                alert('Please enter at least 1 Child Category.');
                $('#txtAreaChildCat').select();
                return;
            }

            $.getJSON('${pageContext.request.contextPath}/Admin/Category/IsAvailable?mainCat=' + mainCatName, function (data) {
                if (data === true) {
                    $('#frmAddMainCategory').off('submit').submit();
                } else {
                    alert('Main Category is already in database.');
                    $('#txtMainCatName').select();
                }
            });
        });
    </script>
  </jsp:attribute>
  <jsp:body>
    <form action="" method="post" id="frmAddMainCategory">
      <div class="card">
        <h4 class="card-header">
          New Category
        </h4>
        <div class="card-body">
          <div class="form-group">
            <label for="txtMainCatName">Main Category</label>
            <input type="text" class="form-control" id="txtMainCatName" name="ParentCategory" autofocus>
          </div>
          <div class="form-group">
            <label for="txtAreaChildCat">Child Category</label>
            <textarea class="form-control" id="txtAreaChildCat" name="ChildCategories" rows="3"></textarea>
          </div>
        </div>
        <div class="card-footer">
          <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
            <i class="fa fa-backward" aria-hidden="true"></i>
            List
          </a>
          <button type="submit" class="btn btn-primary">
            <i class="fa fa-check" aria-hidden="true"></i>
            Save
          </button>
        </div>
      </div>
    </form>
  </jsp:body>
</t:adminUser>