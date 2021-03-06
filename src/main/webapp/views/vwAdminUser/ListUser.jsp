<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="bidders" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>
<t:adminUser>
  <jsp:attribute name="css">
    <link rel="stylesheet" href ="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Danh Sach Bidder
            </h4>
            <c:choose>
                <c:when test="${bidders.size() == 0}">
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
                                <th>Name</th>
                                <th>Email</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bidders}" var="c">
                                <tr>
                                    <td>${c.idUser}</td>
                                    <td>${c.name}</td>
                                    <td>${c.email}</td>
                                    <td class="text-right">
                                        <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/DeleteUser?id=${c.idUser}" role="button">
                                            <i class=" fa fa-trash" aria-hidden="true"></i>
                                        </a>
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/QuanLiUser/Info?id=${c.idUser}" role="button">
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