<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:catch var="catchException">
<jsp:useBean id="authUser" scope="session" type="com.ute.webdaugia.beans.User" />
<jsp:useBean id="top_product" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="top_product2" scope="request" type="java.util.List<com.ute.webdaugia.beans.Orders>"/>
<jsp:useBean id="top_product3" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
</c:catch>
<t:Account>
    <jsp:body>
        <c:choose>
            <c:when test="${auth}">
                <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Hi, <b>${authUser.name}!</b>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Profile">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            Profile
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript: $('#frmLogout').submit()">
                            <i class="fa fa-sign-out" aria-hidden="true"></i>
                            Sign Out
                        </a>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Account/Register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Account/Login">Login</a>
                </li>
            </c:otherwise>
        </c:choose>
        <div class="card">
            <h4 class="card-header">
                Top 5 Highest Products
            </h4>
            <c:choose>
                <c:when test="${top_product.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${top_product}" var="c">
                                <div class="col-sm-4 mb-3">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.idProduct}/main_thumbs.jpg"
                                             alt="${c.name}" title="${c.name}" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card$-title">${c.name}</h6>
                                            <h5 class="card-title text-danger">
                                                <fmt:formatNumber value="${c.current_Price}" type="number"/>
                                            </h5>
                                            <p class="card-text">${c.detail_tiny}</p>
                                        </div>
                                        <div class="card-footer text-muted">
                                            <a class="btn btn-sm btn-outline-primary"
                                               href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}"
                                               role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Details
                                            </a>
                                            <a class="btn btn-sm btn-outline-success" href="#" role="button">
                                                <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                Add to cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="card">
            <h4 class="card-header">
                Top 5 Highest Order Turns
            </h4>
            <c:choose>
                <c:when test="${top_product2.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${top_product2}" var="top_id">
                                <c:forEach items="${products}" var="c">
                                    <c:if test="${top_id.id_Product eq c.idProduct}">
                                        <div class="col-sm-4 mb-3">
                                            <div class="card h-100">
                                                <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.idProduct}/main_thumbs.jpg"
                                                     alt="${c.name}" title="${c.name}" class="card-img-top">
                                                <div class="card-body">
                                                    <h6 class="card-title">${c.name}</h6>
                                                    <h5 class="card-title text-danger">
                                                        <fmt:formatNumber value="${c.current_Price}" type="number"/>
                                                    </h5>
                                                    <p class="card-text">${c.detail_tiny}</p>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn btn-sm btn-outline-primary"
                                                       href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}"
                                                       role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                                    <a class="btn btn-sm btn-outline-success" href="#" role="button">
                                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                        Add to cart
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="card">
            <h4 class="card-header">
                Top 5 Expired Products
            </h4>
            <c:choose>
                <c:when test="${top_product3.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${top_product3}" var="top_id">
                                <c:forEach items="${products}" var="c">
                                    <c:if test="${top_id.idProduct eq c.idProduct}">
                                        <div class="col-sm-4 mb-3">
                                            <div class="card h-100">
                                                <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.idProduct}/main_thumbs.jpg"
                                                     alt="${c.name}" title="${c.name}" class="card-img-top">
                                                <div class="card-body">
                                                    <h6 class="card-title">${c.name}</h6>
                                                    <h5 class="card-title text-danger">
                                                        <fmt:formatNumber value="${c.current_Price}" type="number"/>
                                                    </h5>
                                                    <p class="card-text">${c.detail_tiny}</p>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn btn-sm btn-outline-primary"
                                                       href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}"
                                                       role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                                    <a class="btn btn-sm btn-outline-success" href="#" role="button">
                                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                        Add to cart
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:Account>