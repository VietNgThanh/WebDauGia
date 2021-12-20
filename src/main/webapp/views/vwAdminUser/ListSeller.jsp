<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="sellers" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>

<t:Account>
  <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </jsp:attribute>
    <jsp:body>
        <%--        <div class="card">--%>
        <%--            <h4 class="card-header d-flex justify-content-between">--%>
        <%--                Categories--%>
        <%--                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/Add" role="button">--%>
        <%--                    <i class="fa fa-plus" aria-hidden="true"></i>--%>
        <%--                    Add Category--%>
        <%--                </a>--%>
        <%--            </h4>--%>
        <c:choose>
            <c:when test="${sellers.size() == 0}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Upto Seller</th>
                            <th>&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sellers}" var="c">
                            <tr>
                                <td>${c.id}</td>
                                <td>${c.name}</td>
                                <td>${c.email}</td>
                                <td class="text-right">
                                    <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Dkiseller/Access?id=${c.id}" role="button">
                                        <i class=" fa fa-pencil" aria-hidden="true"></i>
                                    </a>
                                    <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/Info?id=${c.id}" role="button">
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
</t:Account>