<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="sellers" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>

<t:adminUser>
  <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Danh Sach Sản Phẩm
            </h4>
        <c:choose>
            <c:when test="${products.size() == 0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Tên </th>
                            <th>Người bán</th>
                            <th>Giá khởi điểm</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="c">
                            <tr>
                                <td>${c.name}</td>
                                <c:forEach items="${sellers}" var="sl">
                                    <c:if test="${sl.idUser == c.userid}">
                                        <td>${sl.name}</td>
                                    </c:if>
                                </c:forEach>
                                <td> <fmt:formatNumber value="${c.start_price}" /></td>
                                <td class="text-right">
                                    <a class="btn btn-outline-danger btn-sm " href="${pageContext.request.contextPath}/Admin/QuanLiSanPham/DeleteProduct?id=${c.idProduct}" role="button">
                                        <i class=" fa fa-trash" aria-hidden="true"></i>
                                    </a>
                                    <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/QuanLiSanPham/Info?id=${c.idProduct}" role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
        </div>
    </jsp:body>
</t:adminUser>