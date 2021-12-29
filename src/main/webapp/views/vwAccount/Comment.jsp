<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<t:main>
    <jsp:body>
        <form action="" method="post" >
            <div class="card">
                <h5 class="card-header">Đánh Giá</h5>
                <div class="card-body">
                    <h5 class="card-title">Đánh Giá</h5>
                    <textarea class="form-control" name="comment"></textarea>
                    <p>Mời bạn chọn:</p>
                    <input type="radio" id="html" name="trangthai" value="1">
                    <label for="html"><i class="fa fa-thumbs-up" aria-hidden="true"></i></label><br>
                    <input type="radio" id="css" name="trangthai" value="0">
                    <label for="css"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></label><br>
                </div>
                <button type="submit" class="btn btn-primary">
                    Send
                </button>
            </div>
        </form>
    </jsp:body>
</t:main>