<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="parentCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ParentCategory>"/>
<jsp:useBean id="childCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ChildCategory>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.webdaugia.beans.User"/>

<header class="mb-3">
  <nav class="navbar navbar-expand-lg">
    <div class="container justify-content-between">
          <span>
            <a class="navbar-brand d-flex align-items-center" href="#">
              <img class="gavel mr-2" src="${pageContext.request.contextPath}/public/navbar/law.png" alt="gavel"/>
              <span class="ml-2">
                <h5 class="logo m-0">Auction</h5>
                <h5 class="logo m-0">Web</h5>
              </span>
            </a>
          </span>

      <span>
            <ul id="menu" class="navbar-nav">
              <li class="nav-item">
                <a href="${pageContext.request.contextPath}/Home" class="link p-3">Home</a>
              </li>
              <li class="nav-item">
                <a href="" style="pointer-events: none;" class="link p-3">Shop</a>
                <ul id="shop" class="sub-menu">
                  <c:set var="x" value="0"/>
                  <c:forEach items="${parentCategories}" var="parentCat">
                    <li>
                    <a class="w-100 h-100 d-flex align-items-center pl-4"
                       href="${pageContext.request.contextPath}/Product/ByParentCatID?id=${parentCat.id}&p=1">${parentCat.name}</a>
                    <ul class="sub-menu2" style="top: ${x}rem">
                      <c:set var="x" value="${x+2.5}"/>
                      <c:forEach items="${childCategories}" var="childCat">
                        <c:if test="${parentCat.id eq childCat.parent_id}">
                          <li>
                            <a class="w-100 h-100 d-flex align-items-center pl-3"
                               href="${pageContext.request.contextPath}/Product/ByCat?id=${childCat.id}&p=1">${childCat.name}</a>
                          </li>
                        </c:if>
                      </c:forEach>
                    </ul>
                  </li>
                  </c:forEach>
                </ul>
              </li>
              <li class="nav-item">
                <a href="https://hcmute.edu.vn/" target="_blank" class="link p-3">About</a>
              </li>
              <li class="nav-item">
                <a href="mailto:ltwdaugia2021@gmail.com" target="_blank" class="link p-3">Contact</a>
              </li>
            </ul>
          </span>

      <span class="d-flex align-items-center">
            <form action="${pageContext.request.contextPath}/Product/Search" method="post">
              <div class="input-group search-box">
                <input
                        name="search-box"
                        type="text"
                        class="form-control"
                        placeholder="Search item..."
                />
                <div class="input-group-append">
                  <button id="btn-search" class="btn" type="submit">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </button>
                </div>
              </div>
              <input type="hidden" id="p" name="p" value="1">
            </form>
                <ul class="navbar-nav">
      <c:choose>
        <c:when test="${auth}">
          <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
              <span class="text-light user-font ml-5">Hi, ${authUser.name.substring(authUser.name.lastIndexOf(" ")+1)}!</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <c:if test="${authUser.permission==1 || authUser.permission==4}">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Profile">
                <i class="fa fa-user" aria-hidden="true"></i>
                Profile
              </a>
              </c:if>
              <c:if test="${authUser.permission==2}">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Seller_Profile">
                <i class="fa fa-user" aria-hidden="true"></i>
                Profile
              </a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Misc/Editor">
                <i class="fa fa-upload" aria-hidden="true"></i>
                Upload Product
              </a>
              </c:if>
              <c:if test="${authUser.permission==3}">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Admin/Category">
                <i class="fa fa-user" aria-hidden="true"></i>
                Admin Tool
              </a>
              </c:if>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/ChangePassWord">
                <i class="fa fa-key" aria-hidden="true"></i>
                Change PassWord
              </a>
<%--              <div class="dropdown-divider"></div>--%>
              <a class="dropdown-item" href="javascript: $('#frmLogout').submit()">
                <i class="fa fa-sign-out" aria-hidden="true"></i>
                Sign Out
              </a>
            </div>
          </li>
        </c:when>
        <c:otherwise>
          <div class="user-font ml-5">
              <a class="nav-link p-1 text-light" href="${pageContext.request.contextPath}/Account/Register">Register</a>
              <a class="nav-link p-1 text-light" href="${pageContext.request.contextPath}/Account/Login">Login</a>
          </div>
        </c:otherwise>
      </c:choose>
          </span>
    </div>
  </nav>
</header>