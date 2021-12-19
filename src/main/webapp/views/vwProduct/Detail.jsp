<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="product" scope="request" type="com.ute.webdaugia.beans.Product" />


<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                    ${product.name}
            </h4>
            <div class="card-body">
                <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.idProduct}/main.jpg" alt="${product.name}" title="${product.name}">
                <p class="card-text mt-3">
                    Giá bán:
                    <span class="text-danger font-weight-bold">
            <fmt:formatNumber value="${product.start_price}" />
          </span>
                </p>
                <p class="card-text">Giá mua ngay: <span class="text-danger font-weight-bold">
        <fmt:formatNumber value="${product.imme_Price}" /> </span></p>
                <p class="card-text">${product.detail_full}</p>
                <p class="card-text"></p>
            </div>
            <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Product/ByCat?id=${product.idCat}" role="button">
                <i class="fa fa-backward" aria-hidden="true"></i>
                List
            </a>
        </div>
    </jsp:body>
</t:main>