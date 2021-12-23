<%@ page import="java.util.List" %>
<%@ page import="com.ute.webdaugia.beans.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:catch var="catchException">
  <jsp:useBean id="txtSearch" scope="request" type="java.lang.String"/>
  <jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
  <jsp:useBean id="pageNo" scope="request" type="java.lang.Integer"/>
  <jsp:useBean id="pages" scope="request" type="java.lang.Integer"/>
</c:catch>

<t:main>

  <jsp:attribute name="css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/paging/styles.css">
  </jsp:attribute>

  <jsp:body>
    <div class="card">
      <h4 class="card-header">
        Products
      </h4>
      <c:choose>
        <c:when test="${empty products}">
          <div class="card-body">
            <p class="card-text">Không có dữ liệu.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="card-body">
            <div class="row">
              <c:forEach items="${products}" var="c">
                <div class="col-sm-4 mb-3">
                  <div class="card h-100">
                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.idProduct}/main_thumbs.jpg"
                         alt="${c.name}" title="${c.name}" class="card-img-top">
                    <div class="card-body">
                      <h6 class="card-title">${c.name}</h6>
                      <h5 class="card-title text-danger">
                        <fmt:formatNumber value="${c.start_price}" type="number"/>
                      </h5>
                      <p class="card-text">${c.detail_tiny}</p>
                    </div>
                    <div class="card-footer text-muted">
                      <a class="btn btn-sm btn-outline-primary"
                         href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}" role="button">
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
    <footer class="d-flex justify-content-center align-items-center my-5">
      <nav>
        <ul class="pagination">
          <li class="page-item">
            <a class="page-link"
               <c:if test="${pageNo eq 1}">style="pointer-events: none;" </c:if>
               href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=${pageNo-1}">
              Previous
            </a>
          </li>
          <li class="page-item">
            <a class="page-link"
               <c:if test="${pageNo eq 1}">style="pointer-events: none;" </c:if>
               href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=1">
              1
            </a>
          </li>
          <c:forEach begin="2" end="${pages}" step="1" var="i">
            <li class="page-item">
              <a class="page-link"
                 <c:if test="${pageNo eq i}">style="pointer-events: none;"</c:if>
                 href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=${i}">
                  ${i}
              </a>
            </li>
          </c:forEach>
          <li class="page-item">
            <a class="page-link"
               <c:if test="${pageNo eq pages}">style=" pointer-events: none;"</c:if>
               href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=${pageNo+1}">
              Next
            </a>
          </li>
        </ul>
      </nav>
    </footer>

  </jsp:body>
</t:main>