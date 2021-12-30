<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:catch var="catchException">
<jsp:useBean id="top_product" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="top_product2" scope="request" type="java.util.List<com.ute.webdaugia.beans.SoLuotDauGia>"/>
<jsp:useBean id="top_product3" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="auth" scope="session" type="java.lang.Boolean"/>
</c:catch>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                Top 6 Highest Products
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
                                                <fmt:formatNumber value="${c.current_Price}" type="number"/> VNĐ
                                            </h5>
                                            <p class="card-text">${c.detail_tiny}</p>
                                        </div>
                                        <div class="card-footer text-muted">
                                            <a class="btn btn-outline-primary"
                                               href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}"
                                               role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Details
                                            </a>
                                            <c:if test="${auth == true}">
                                            <c:set scope="request" var="check" value="" />
                                            <c:forEach items="${wlists}" var="wl">
                                                <c:if test="${c.idProduct == wl.id_product}">
                                                    <c:set scope="request" var="check" value="true" />
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${check.length() == 0}">
                                                <a  class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Product/addwatlistHome?id_product=${c.idProduct}" role="button">
                                                    <i class="fa fa-heart" aria-hidden="true"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${check.length() != 0}">
                                                <a  class="btn  btn-outline-primary" href="${pageContext.request.contextPath}/Product/delwatlistHome?id_product=${c.idProduct}" role="button">
                                                    Unlike
                                                </a>
                                                <c:set scope="request" var="check" value="" />
                                            </c:if>
                                            </c:if>
<%--                                            <a class="btn btn-sm btn-outline-success" href="#" role="button">--%>
<%--                                                <i class="fa fa-cart-plus" aria-hidden="true"></i>--%>
<%--                                                Add to cart--%>
<%--                                            </a>--%>
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
                Top 6 Highest Order Turns
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
                                    <c:if test="${top_id.idProduct eq c.idProduct}">
                                        <div class="col-sm-4 mb-3">
                                            <div class="card h-100">
                                                <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.idProduct}/main_thumbs.jpg"
                                                     alt="${c.name}" title="${c.name}" class="card-img-top">
                                                <div class="card-body">
                                                    <h6 class="card-title">${c.name}</h6>
                                                    <h5 class="card-title text-danger">
                                                        <fmt:formatNumber value="${c.current_Price}" type="number"/> <span>VNĐ</span>
                                                    </h5>
                                                    <p class="card-text">${c.detail_tiny}</p>
                                                    <p class="card-text"> Số lượt ra giá:${top_id.soluotragia}</p>
<%--                                                    <p class="card-text">Số lượt ra giá:--%>
<%--                                                        <c:set scope="request" var="ragia" value=""/>--%>
<%--                                                        <c:forEach items="${listragia}" var="l">--%>
<%--                                                            <c:if test="${l.idProduct == c.idProduct}">--%>
<%--                                                                <c:set scope="request" var="ragia" value="true"/>--%>
<%--                                                            </c:if>--%>
<%--                                                        </c:forEach>--%>
<%--                                                        <c:if test="${ragia.length() == 0}">--%>
<%--                                                            0--%>
<%--                                                        </c:if>--%>
<%--                                                        <c:if test="${ragia.length() != 0}">--%>
<%--                                                            <c:forEach items="${listragia}" var="l">--%>
<%--                                                                <c:if test="${l.idProduct == c.idProduct}">--%>
<%--                                                                    ${l.soluotragia}--%>
<%--                                                                </c:if>--%>
<%--                                                                <c:set scope="request" var="ragia" value=""/>--%>
<%--                                                            </c:forEach>--%>
<%--                                                        </c:if>--%>
<%--                                                    </p>--%>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn  btn-outline-primary"
                                                       href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}"
                                                       role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                    <c:if test="${auth == true}">
                                                    <c:set scope="request" var="check" value="" />
                                                    <c:forEach items="${wlists}" var="wl">
                                                        <c:if test="${c.idProduct == wl.id_product}">
                                                            <c:set scope="request" var="check" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${check.length() == 0}">
                                                        <a  class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Product/addwatlistHome?id_product=${c.idProduct}" role="button">
                                                            <i class="fa fa-heart" aria-hidden="true"></i>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${check.length() != 0}">
                                                        <a  class="btn  btn-outline-primary" href="${pageContext.request.contextPath}/Product/delwatlistHome?id_product=${c.idProduct}" role="button">
                                                            Unlike
                                                        </a>
                                                        <c:set scope="request" var="check" value="" />
                                                    </c:if>
                                    </c:if>
<%--                                                    <a class="btn btn-sm btn-outline-success" href="#" role="button">--%>
<%--                                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>--%>
<%--                                                        Add to cart--%>
<%--                                                    </a>--%>
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
                Top 6 Expired Products
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
                                                        <fmt:formatNumber value="${c.current_Price}" type="number"/> VNĐ
                                                    </h5>
                                                    <p class="card-text">${c.detail_tiny}</p>
                                                    <p class="card-text">Ngày Kết Thúc: ${c.time_to_close.toLocalDate()} ${c.time_to_close.toLocalTime()}</p>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn btn-outline-primary"
                                                       href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}"
                                                       role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                    <c:if test="${auth == true}">
                                                    <c:set scope="request" var="check" value="" />
                                                    <c:forEach items="${wlists}" var="wl">
                                                        <c:if test="${c.idProduct == wl.id_product}">
                                                            <c:set scope="request" var="check" value="true" />
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${check.length() == 0}">
                                                        <a  class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Product/addwatlistHome?id_product=${c.idProduct}" role="button">
                                                            <i class="fa fa-heart" aria-hidden="true"></i>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${check.length() != 0}">
                                                        <a  class="btn  btn-outline-primary" href="${pageContext.request.contextPath}/Product/delwatlistHome?id_product=${c.idProduct}" role="button">
                                                            Unlike
                                                        </a>
                                                        <c:set scope="request" var="check" value="" />
                                                    </c:if>
                                    </c:if>
<%--                                                    <a class="btn btn-sm btn-outline-success" href="#" role="button">--%>
<%--                                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>--%>
<%--                                                        Add to cart--%>
<%--                                                    </a>--%>
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
</t:main>