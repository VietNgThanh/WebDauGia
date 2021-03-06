<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:catch var="catchException">
<jsp:useBean id="bidder" scope="request" type="com.ute.webdaugia.beans.User"/>
<jsp:useBean id="productdangdaugia" scope="request" type="java.util.ArrayList<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="productsus" scope="request" type="java.util.ArrayList<com.ute.webdaugia.beans.Product>"/>
</c:catch>
<t:adminUser>
  <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col">
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Thong Tin Seller
                    </h4>
                    <div class="card-body d-flex justify-content-between ">
                        <div class="container-fluid h-100">
                                <form>
                                    <div class="form-group">
                                        <label for="txtId">ID</label>
                                        <input type="text" class="form-control" name="idsl" id="txtId" readonly value="${bidder.idUser}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="txtName">H??? v?? t??n</label>
                                        <input type="text" class="form-control" id="txtName" readonly value="${bidder.name}">
                                    </div>
                                    <div class="form-group">
                                        <label for="txtAddress">?????a Ch???</label>
                                        <input type="text" class="form-control" id="txtAddress" readonly value="${bidder.address}">
                                    </div>
                                    <div class="form-group d-flex ml-6">
                                        <div>
                                            <a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/Index" role="button">
                                                <i class="fa fa-home" aria-hidden="true"></i>
                                                Quit
                                            </a>
                                        </div>
                                        <div class="flex-fill ml-1">
                                            <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/DeleteUser?id=${bidder.idUser}" role="button">
                                                <i class="fa fa-sign-in" aria-hidden="true"></i>
                                                Xo?? ng?????i d??ng
                                            </a>
                                        </div>
                                        <div class="flex-fill ml-1">
                                            <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/ResetPassWord?id=${bidder.idUser}" role="button">
                                                <i class="fa fa-sign-in" aria-hidden="true"></i>
                                                Reset Password
                                            </a>
                                        </div>
                                    </div>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mt-3">
            <h4 class="card-header d-flex justify-content-between">
                C??c S???n Ph???m ??ang Dau Gia
            </h4>
            <c:choose>
                <c:when test="${productdangdaugia.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Kh??ng c?? d??? li???u.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body d-flex justify-content-between ">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>T??n </th>
                                <th>Gi?? kh???i ??i???m</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productdangdaugia}" var="c">
                                <tr>
                                    <td>${c.name}</td>
                                    <td> <fmt:formatNumber value="${c.start_price}" /></td>
                                    <td class="text-right">
                                        <a class="btn btn-outline-danger btn-sm " href="${pageContext.request.contextPath}/Admin/Dkiseller/Access?id=${c.idProduct}" role="button">
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
        <div class="card mt-3">
            <h4 class="card-header d-flex justify-content-between">
                C??c S???n Ph???m ?????u gi?? th??nh c??ng
            </h4>
            <c:choose>
                <c:when test="${productsus.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Kh??ng c?? d??? li???u.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body d-flex justify-content-between ">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>T??n </th>
                                <th>Gi?? kh???i ??i???m</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productsus}" var="c">
                                <tr>
                                    <td>${c.name}</td>
                                    <td> <fmt:formatNumber value="${c.start_price}" /></td>
                                    <td class="text-right">
                                        <a class="btn btn-outline-danger btn-sm " href="${pageContext.request.contextPath}/Admin/Dkiseller/Access?id=${c.idProduct}" role="button">
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