<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:catch var="catchException">
<jsp:useBean id="seller" scope="request" type="com.ute.webdaugia.beans.User"/>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
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
                <div class="d-flex mb-2">
                    <div>
                        <a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/Index" role="button">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            Quit
                        </a>
                    </div>
                    <div class="flex-fill ml-1">
                        <a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/DeleteSeller?id=${seller.idUser}" role="button">
                            <i class="fa fa-sign-in" aria-hidden="true"></i>
                            Không cho bán hàng
                        </a>
                    </div>
                </div>
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Thong Tin Seller
                    </h4>
                    <div class="card-body d-flex justify-content-between ">
                        <div class="container-fluid h-100">
                                <form>
                                    <div class="form-group">
                                        <label for="txtId">ID</label>
                                        <input type="text" class="form-control" name="idsl" id="txtId" readonly value="${seller.idUser}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="txtName">Họ và tên</label>
                                        <input type="text" class="form-control" id="txtName" readonly value="${seller.name}">
                                    </div>
                                    <div class="form-group">
                                        <label for="txtAddress">Địa Chỉ</label>
                                        <input type="text" class="form-control" id="txtAddress" readonly value="${seller.address}">
                                    </div>
                                    <div class="form-group d-flex ml-6">
                                        <div>
                                            <a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/Index" role="button">
                                                <i class="fa fa-home" aria-hidden="true"></i>
                                                Quit
                                            </a>
                                        </div>
                                        <div class="flex-fill ml-1">
                                            <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/DeleteSeller?id=${seller.idUser}" role="button">
                                                <i class="fa fa-sign-in" aria-hidden="true"></i>
                                                Không cho bán hàng
                                            </a>
                                        </div>
                                        <div class="flex-fill">
                                            <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/DeleteUser?id=${seller.idUser}" role="button">
                                                <i class="fa fa-sign-in" aria-hidden="true"></i>
                                                Xoá tài khoản
                                            </a>
                                        </div>
                                        <div class="flex-fill">
                                            <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/ResetPassWord?id=${seller.idUser}" role="button">
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
                Các Sản Phẩm Đang Bán
            </h4>
            <c:choose>
                <c:when test="${products.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body d-flex justify-content-between ">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Tên </th>
                                <th>Giá khởi điểm</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="c">
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