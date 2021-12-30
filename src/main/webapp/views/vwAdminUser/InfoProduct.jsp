<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="product" scope="request" type="com.ute.webdaugia.beans.Product" />
<jsp:useBean id="seller" scope="request" type="com.ute.webdaugia.beans.User" />

<t:adminUser>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                    ${product.name}
            </h4>
            <div class="card-body">
                <img src="${pageContext.request.contextPath}/public/imgs/${product.idProduct}/1.jpg" alt="${product.name}" title="${product.name}">
                <p class="card-text mt-3">
                    Giá bán:
                    <span class="text-danger font-weight-bold">
                        <fmt:formatNumber value="${product.start_price}" />
          </span>
                </p>
                <p class="card-text">Giá mua ngay: <span class="text-danger font-weight-bold">
                    <fmt:formatNumber value="${product.imme_Price}" /> </span></p>
                <p class="card-text">${product.detail_full}</p>
                <p class="card-text">Người bán: <span> ${seller.name}</span>
                </p>
                <p class="card-text"></p>
            </div>
        </div>
        <div class="form-group d-flex">
            <div>
                <a class="btn btn-lg btn-outline-info" href="${pageContext.request.contextPath}/Admin/QuanLiSanPham/Index" role="button">
                    <i class="fa fa-home" aria-hidden="true"></i>
                    Quit
                </a>
            </div>
            <div class="flex-fill ml-1">
                <a class="btn btn-lg  btn-outline-success" href="${pageContext.request.contextPath}/Admin/QuanLiSanPham/DeleteProduct?id=${product.idProduct}" role="button">
                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                        Xoá sản phẩm
                </a>
            </div>
        </div>
    </jsp:body>
</t:adminUser>