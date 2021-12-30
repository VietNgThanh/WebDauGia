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
  <jsp:useBean id="searchShow" scope="request" type="java.lang.String"/>
  <jsp:useBean id="searchSort" scope="request" type="java.lang.String"/>
  <jsp:useBean id="auth" scope="session" type="java.lang.Boolean"/>
  <jsp:useBean id="wlists" scope="request" type="java.util.List<com.ute.webdaugia.beans.Wishlist>"/>
  <jsp:useBean id="listuser1" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>
  <jsp:useBean id="listragia" scope="request" type="java.util.List<com.ute.webdaugia.beans.SoLuotDauGia>"/>
</c:catch>

<t:main>

  <jsp:attribute name="css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/paging/styles.css">
  </jsp:attribute>

  <jsp:body>
    <div class="card">
      <h4 class="card-header">
        Kết quả tìm kiếm cho '${txtSearch}'
      </h4>
      <c:choose>
        <c:when test="${empty products}">
          <div class="card-body">
            <div id="show-sort" class="pb-2">
              <div class="mb-2">
                <span>Hiển thị: </span>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&sort=${searchSort}"
                        <c:if test="${empty searchShow}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Tất Cả</a>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=name&sort=${searchSort}"
                        <c:if test="${searchShow == 'name'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Theo Tên</a>
                <a id="cat"
                   href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=cat&sort=${searchSort}"
                        <c:if test="${searchShow == 'cat'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Theo Danh Mục</a>
              </div>
              <div>
                <span>Sắp xếp: </span>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=${searchShow}&sort=priceasc"
                        <c:if test="${searchSort == 'priceasc'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Giá Thấp</a>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=${searchShow}&sort=pricedes"
                        <c:if test="${searchSort == 'pricedes'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Giá Cao</a>
                <a id="time"
                   href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=${searchShow}&sort=time"
                        <c:if test="${searchSort == 'time'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Sắp kết thúc</a>
              </div>
            </div>
            <h5 class="card-text">Không có dữ liệu.</h5>
          </div>
        </c:when>
        <c:otherwise>
          <div class="card-body">
            <div id="show-sort-2" class="pb-2">
              <div class="mb-2">
                <span>Hiển thị: </span>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&sort=${searchSort}"
                        <c:if test="${empty searchShow}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Tất Cả</a>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=name&sort=${searchSort}"
                        <c:if test="${searchShow == 'name'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Theo Tên</a>
                <a id="cat-2"
                   href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=cat&sort=${searchSort}"
                        <c:if test="${searchShow == 'cat'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Theo Danh Mục</a>
              </div>
              <div>
                <span>Sắp xếp: </span>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=${searchShow}&sort=priceasc"
                        <c:if test="${searchSort == 'priceasc'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Giá Thấp</a>
                <a href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=${searchShow}&sort=pricedes"
                        <c:if test="${searchSort == 'pricedes'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Giá Cao</a>
                <a id="time-2"
                   href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&show=${searchShow}&sort=time"
                        <c:if test="${searchSort == 'time'}">
                          style="color: #1a5394; border-bottom-color: #1a5394; font-weight: bolder;"
                        </c:if>>Sắp kết thúc</a>
              </div>
            </div>
            <div class="row">
              <c:forEach items="${products}" var="c">
                <div class="col-sm-4 mb-3">
                  <div class="card h-100">
                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${c.idProduct}/main_thumbs.jpg"
                         alt="${c.name}" title="${c.name}" class="card-img-top">
                    <div class="card-body">
                      <h6 class="card-title">${c.name}</h6>
                      <c:if test="${c.availability == 0}">
                        <p class="card-text"><span class="text-danger font-weight-bold">
                                                    Sản phẩm đã được bán </span></p>
                      </c:if>
                      <c:if test="${c.availability == 1}">
                        <h5 class="card-title text-danger">
                          <fmt:formatNumber value="${c.current_Price}" type="number"/>
                        </h5>
                        <p class="card-text">Giá mua ngay: ${c.imme_Price}</p>

                        <p class="card-text">Ngày Đăng Bán: ${c.ngay_bat_dau.toLocalDate()} ${c.ngay_bat_dau.toLocalTime()}</p>
                        <p class="card-text">Ngày Kết Thúc: ${c.time_to_close.toLocalDate()} ${c.time_to_close.toLocalTime()}</p>
                        <p class="card-text">Số lượt ra giá:
                        <c:set scope="request" var="ragia" value="" />
                        <c:forEach items="${listragia}" var="l">
                          <c:if test="${l.idProduct == c.idProduct}">
                            <c:set scope="request" var="ragia" value="true" />
                          </c:if>
                        </c:forEach>
                        <c:if test="${ragia.length() == 0}">
                          0
                        </c:if>
                        <c:if test="${ragia.length() != 0}">
                          <c:forEach items="${listragia}" var="l">
                            <c:if test="${l.idProduct == c.idProduct}">
                              ${l.soluotragia}
                            </c:if>
                            <c:set scope="request" var="ragia" value="" />
                          </c:forEach>
                          <p class="card-text">Bidder ra giá cao nhất:
                          <c:forEach items="${listuser1}" var="d">
                            <c:if test="${d.idUser == c.id_Bidder_current}">
                                                            <span id="maskten">
                                                                *****${d.name.substring(d.name.lastIndexOf(' '),d.name.length())}</span>
                            </c:if>
                          </c:forEach>

                        </c:if>
                        </p>
                      </c:if>
                    </div>
                    <div class="card-footer text-muted">
                      <a class="btn btn-sm btn-outline-primary"
                         href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}" role="button">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        Details
                      </a>
                      <c:set scope="request" var="check" value=""/>
                      <c:forEach items="${wlists}" var="wl">
                        <c:if test="${c.idProduct == wl.id_product}">
                          <c:set scope="request" var="check" value="true"/>
                        </c:if>
                      </c:forEach>
                      <c:if test="${auth == true}">
                      <c:if test="${c.availability==1}">
                      <c:if test="${check.length() == 0}">
                        <a class="btn btn-sm btn-outline-primary"
                           href="${pageContext.request.contextPath}/Product/addwatlist?id_product=${c.idProduct}&p=${pageNo}&show=${searchShow}&sort=${searchSort}&txtSearch=${txtSearch}"
                           role="button">
                          <i class="fa fa-heart" aria-hidden="true"></i>
                        </a>
                      </c:if>
                      <c:if test="${check.length() != 0}">
                      <a class="btn btn-sm btn-outline-primary"
                         href="${pageContext.request.contextPath}/Product/delwatlist?id_product=${c.idProduct}&p=${pageNo}&show=${searchShow}&sort=${searchSort}&txtSearch=${txtSearch}"
                         role="button">
                        Unlike
                      </a>
                      </c:if>
                      </c:if>
                      </c:if>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

    <%--    Paging--%>
    <c:if test="${not empty products}">
      <footer class="d-flex justify-content-center align-items-center my-5">
        <nav>
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link"
                 <c:if test="${pageNo eq 1}">style="display: none;" </c:if>
                 href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=${pageNo-1}&show=${searchShow}&sort=${searchSort}">
                Previous
              </a>
            </li>
            <li class="page-item">
              <a class="page-link"
                 <c:if test="${pageNo eq 1 || pages eq 1}">style="pointer-events: none;" </c:if>
                 href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=1&show=${searchShow}&sort=${searchSort}">
                1
              </a>
            </li>
            <c:forEach begin="2" end="${pages}" step="1" var="i">
              <li class="page-item">
                <a class="page-link"
                   <c:if test="${pageNo eq i}">style="pointer-events: none;"</c:if>
                   href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=${i}&show=${searchShow}&sort=${searchSort}">
                    ${i}
                </a>
              </li>
            </c:forEach>
            <li class="page-item">
              <a class="page-link"
                 <c:if test="${pageNo eq pages}">style="display: none;"</c:if>
                 href="${pageContext.request.contextPath}/Product/Search?txtSearch=${txtSearch}&p=${pageNo+1}">
                Next
              </a>
            </li>
          </ul>
        </nav>
      </footer>
    </c:if>

  </jsp:body>
</t:main>