<jsp:useBean id="authUser" scope="session" type="com.ute.webdaugia.beans.User"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="abc" scope="request" type="java.util.List<com.ute.webdaugia.beans.ChildCategory>"/>

<t:main>
    <jsp:attribute name="css">
    <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all"
          rel="stylesheet" type="text/css"/>
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdn.tiny.cloud/1/72cy11ulks4a1ppl672suqffj22srp1aa8ovhwo7vflzvn18/tinymce/5/tinymce.min.js"
            referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#txtFullDes',
            height: 450,
            plugins: 'paste image link autolink lists table media',
            menubar: false,
            toolbar: [
                'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media'
            ],
        });
    </script>
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

            $('#fuMain1').fileinput({
                theme: 'fa',
                language: 'vi',
                dropZoneEnabled: true,
                allowedFileExtensions: ['jpg', 'png', 'gif']
            });
        </script>
  </jsp:attribute>
    <jsp:body>
        <form action="" method="post" enctype="multipart/form-data">
            <div class="card">
                <h4 class="card-header">
                    New Category
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatName">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="txtCatName" name="ProName" autofocus>
                        <label for="txtStartPrice">Giá khởi điểm</label>
                        <input type="text" class="form-control" id="txtStartPrice" name="StartPrice">
                        <label for="txtImmePrice">Giá mua ngay</label>
                        <input type="text" class="form-control" id="txtImmePrice" name="ImmePrice">
                        <label for="txtbuocnhay">Bước nhảy</label>
                        <input type="text" class="form-control" id="txtbuocnhay" name="buocnhay">
                    </div>
                    <select name="cata">
                        <c:forEach items="${abc}" var="c">
                            <option> ${c.id}.${c.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="card">
                <h4 class="card-header">
                    WYSIWYG HTML Editor
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtTinyDes">Description</label>
                        <input type="text" class="form-control" id="txtTinyDes" name="TinyDes" autofocus/>
                    </div>
                    <div class="form-group">
                        <label for="txtFullDes">Full Description</label>
                        <textarea id="txtFullDes" name="FullDes"></textarea>
                    </div>
                </div>
                <div class="card-footer">
                </div>
            </div>

            <div class="card">
                <h4 class="card-header">
                    Upload main picture
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <input id="fuMain" name="fuMain" type="file"  />
                    </div>
                </div>

                <h4 class="card-header">
                    Upload 3 lead pictures
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <input id="fuMain1" name="fuMain1" type="file" multiple />
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