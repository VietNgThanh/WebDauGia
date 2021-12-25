<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="parentCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ParentCategory>"/>
<jsp:useBean id="childCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ChildCategory>"/>

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
                <a href="#" class="link p-3">Home</a>
              </li>
              <li class="nav-item">
                <a href="" class="link p-3">Shop</a>
                <ul id="shop" class="sub-menu">
                  <c:set var="x" value="0"/>
                  <c:forEach items="${parentCategories}" var="parentCat">
                    <li>
                    <a class="w-100 h-100 d-flex align-items-center pl-4" href="${pageContext.request.contextPath}/Product/ByParentCatID?id=${parentCat.id}&p=1">${parentCat.name}</a>
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
                <a href="#" class="link p-3">About</a>
              </li>
              <li class="nav-item">
                <a href="#" class="link p-3">Contact</a>
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
            <a href="#" id="user" class="container-fluid" role="button">
              <i class="fa fa-user fa-lg mx-4" aria-hidden="true"></i>
              <span class="h-75 user-font">
                <p class="my-0 user-size">Tài Khoản</p>
                <p class="my-0">Hi, Guest</p>
              </span>
            </a>
          </span>
    </div>
  </nav>
</header>