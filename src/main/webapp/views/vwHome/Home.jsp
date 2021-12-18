<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="authUser" scope="session" type="com.ute.ecwebapp.beans.User" />

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
    </jsp:body>
</t:Account>