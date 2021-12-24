<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/20/2021
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="card">
    <h4 class="card-header">
        Admin Features
    </h4>
    <div class="card-body list-group-flush py-0 px-3">
        <a href="${pageContext.request.contextPath}/Admin/Category/Index" class="list-group-item list-group-item-action">Quản Lí Catagories</a>
        <a href="${pageContext.request.contextPath}/Admin/QuanLiSanPham/Index" class="list-group-item list-group-item-action">Quản Lí Product</a>
        <a href="${pageContext.request.contextPath}/Admin/QuanLiSeller/Index" class="list-group-item list-group-item-action">Quản Lí Seller</a>
        <a href="${pageContext.request.contextPath}/Admin/DkiSeller/Index" class="list-group-item list-group-item-action">Danh Sách Đăng Kí Bán Hàng</a>
    </div>
<%--    <div class="list-group list-group-flush">--%>
<%--        <c:forEach items="${parentCategories}" var="c" >--%>
<%--            <tr class="collapse" id="collapse-main-${c.id}">--%>
<%--                <td>${c.id}</td>--%>
<%--                <td>${c.name}</td>--%>
<%--                <td><a class="btn btn-sm btn-outline-secondary" data-toggle="collapse"--%>
<%--                       href="#collapse-main-${c.id}" role="button" aria-expanded="false"--%>
<%--                       aria-controls="collapse-main-${c.id}">--%>
<%--                    <i class="fa fa-caret-down" aria-hidden="true"></i>--%>
<%--                </a></td>--%>
<%--            </tr>--%>
<%--            <c:forEach items="${childCategories}" var="child">--%>
<%--                <c:if test="${c.id eq child.parent_id}">--%>
<%--                    <tr>--%>
<%--                        <td rowspan="2">--%>
<%--                            <a href="${pageContext.request.contextPath}/Product/ByCat?id=${child.id}" class="list-group-item list-group-item-action">--%>
<%--                                <i class="fa fa-caret-right" aria-hidden="true"></i>--%>
<%--                                    ${child.name}--%>
<%--                            </a>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
</div>

