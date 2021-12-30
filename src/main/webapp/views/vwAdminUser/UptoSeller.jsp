<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="users" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>
<t:adminUser>
  <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </jsp:attribute>
    <jsp:body>
        <div class="card">
            <div class="card-header">
                Up to Seller
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${users.size() == 0}">
                            <p class="card-text">Không có dữ liệu.</p>
                    </c:when>
                    <c:otherwise>
                        <div>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên</th>
                                    <th>Email</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${users}" var="c">
                                    <tr>
                                        <td>${c.idUser}</td>
                                        <td>${c.name}</td>
                                        <td>${c.email}</td>
                                        <td class="text-right">
                                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/DkiSeller/Access?id=${c.idUser}" role="button">
                                                <i class=" fa fa-check" aria-hidden="true"></i>
                                            </a>
                                            <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/DkiSeller/NoAccess?id=${c.idUser}" role="button">
                                                <i class=" fa fa-times" aria-hidden="true"></i>
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
        </div>
        </div>
    </jsp:body>
</t:adminUser>