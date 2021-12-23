<%@ page import="com.ute.webdaugia.beans.Orders" %>
<%@ page import="java.time.Duration" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="z" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<jsp:useBean id="products_PaCaID" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="list_user" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>
<jsp:useBean id="list_date_update" scope="request" type="java.util.List<com.ute.webdaugia.beans.Orders>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                Products
            </h4>
            <c:choose>
                <c:when test="${products_PaCaID.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${products_PaCaID}" var="c">
                                <div class="col-sm-4 mb-3">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.idProduct}/main_thumbs.jpg"
                                             alt="${c.name}" title="${c.name}" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title">${c.name}</h6>
                                            <h5 class="card-title text-danger"
                                                style="display: flex;justify-content: space-between">
                                                <c:forEach items="${list_user}" var="c1">
                                                    <c:if test="${c.id_Bidder_current eq c1.idUser}">
                                                        <fmt:formatNumber value="${c.current_Price}" type="number"/>
                                                        ${c1.name}

                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${list_date_update}" var="c2">
                                                    <c:if test="${c.idProduct eq c2.id_Product}">
                                                        <fmt:parseDate value="${ c2.time_make_price }"
                                                                       pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                                                                       type="both"/>
                                                        <fmt:formatDate pattern="dd.MM.yyyy HH:mm"
                                                                        value="${ parsedDateTime }"/>
<%--                                                                                                                <script>var startDate = ${c2.time_to_close};--%>
<%--                                                                                                                // Do your operations--%>
<%--                                                                                                                var today = new Date();--%>
<%--                                                                                                                var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();--%>
<%--                                                                                                                var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();--%>
<%--                                                                                                                var dateTime = date+' '+time;--%>
<%--                                                                                                                var seconds = (dateTime.getTime() - startDate.getTime());--%>
<%--                                                                                                                document.getElementById(`date`).innerHTML=seconds;--%>
<%--                                                                                                                </script>--%>

                                                    </c:if>
                                                </c:forEach>
                                                <p class="card-text"> Giá mua ngay ${c.imme_Price} </p>
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


    </jsp:body>
</t:main>