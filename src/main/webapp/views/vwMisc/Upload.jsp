<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
  <jsp:attribute name="css">
    <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
  </jsp:attribute>
  <jsp:attribute name="js">
    <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/themes/fa/theme.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>
    <script>
      $('#fuMain').fileinput({
        theme: 'fa',
        language: 'vi',
        dropZoneEnabled: true,
        allowedFileExtensions: ['jpg', 'png', 'gif']
      });
    </script>
  </jsp:attribute>
  <jsp:body>
    <form method="post" enctype="multipart/form-data">
      <div class="card">
        <h4 class="card-header">
          Upload
        </h4>
        <div class="card-body">
          <div class="form-group">
            <label for="txtProName">Product</label>
            <input type="text" class="form-control" id="txtProName" name="ProName" autofocus>
          </div>
          <div class="form-group">
            <input id="fuMain" name="fuMain" type="file" />
          </div>
        </div>
        <div class="card-footer">
          <button type="submit" class="btn btn-primary">
            <i class="fa fa-check" aria-hidden="true"></i>
            Save
          </button>
        </div>
      </div>
    </form>
  </jsp:body>
</t:main>