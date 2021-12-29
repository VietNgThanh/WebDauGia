<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="profile" scope="request" type="com.ute.webdaugia.beans.User"/>
<jsp:useBean id="dsachban" scope="request" type="java.util.List<com.ute.webdaugia.beans.Product>"/>
<jsp:useBean id="auth" scope="session" type="java.lang.Boolean"/>
<jsp:useBean id="bangdanhgia1" scope="request" type="java.util.List<com.ute.webdaugia.beans.Danh_Gia_NguoiDung>"/>
<jsp:useBean id="listuser1" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>
<t:main>
    <jsp:body>
        <c:if test="${auth == true}">
        <form action="" method="post" >

            <div class="card mt-4">
                <div class="card-header">
                    <h4 >
                        Các sản phẩm đang bán
                    </h4>
                </div>

                <c:choose>
                <c:when test="${empty dsachban}">
                    <div class="card-body">
                        <p class="card-text">Không có Sản phẩm đang bán.</p>
                    </div>
                </c:when>
                <c:otherwise>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Giá ban đầu</th>
                        <th>Bước Nhảy</th>
                        <th>Giá Hiện tại</th>
                        <th>Giá Cao Nhất</th>
                        <th>Thời Gian Kết thúc</th>
                        <th>Đã bán</th>
                        <th></th>
                    </tr>
                    </thead>
                    <c:forEach items="${dsachban}" var="c">
                    <tbody>
                    <c:if test="${c.availability==1}">
                        <tr>
                            <td scope="row">${c.name}</td>
                            <td>${c.start_price}</td>
                            <td>${c.buoc_nhay}</td>
                            <td>${c.current_Price}</td>
                            <td>${c.highest_price}</td>
                            <td>${c.time_to_close.toLocalDate()} ${c.time_to_close.toLocalTime()}</td>
                            <td>
                                <c:if test="${c.availability ==1}">
                                    Chưa Bán
                                </c:if>
                                <c:if test="${c.availability ==0}">
                                    Đã Bán <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                </c:if>
                            </td>
                            <td> <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}" role="button">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </a></td>
                        </tr>
                    </c:if>

                    </tbody>
                    </c:forEach>
                </table>
                </c:otherwise>
                </c:choose>
            </div>

            <div class="card mt-4">
                <h4 class="card-header">
                   Các Sản Phẩm Đã Bán
                </h4>
                <c:choose>
                    <c:when test="${empty dsachban}">
                        <div class="card-body">
                            <p class="card-text">Không có Sản phẩm đã bán.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Giá ban đầu</th>
                                <th>Bước Nhảy</th>
                                <th>Giá Hiện tại</th>
                                <th>Giá Cao Nhất</th>
                                <th>Thời Gian Kết thúc</th>
                                <th>Đã bán</th>
                                <th>Người Mua</th>
                                <th>Đánh Giá Người Mua</th>
                                <th></th>
                            </tr>
                            </thead>
                            <c:forEach items="${dsachban}" var="c">
                                <tbody>
                                <c:if test="${c.availability==0}">
                                    <tr>
                                        <td scope="row">${c.name}</td>
                                        <td>${c.start_price}</td>
                                        <td>${c.buoc_nhay}</td>
                                        <td>${c.current_Price}</td>
                                        <td>${c.highest_price}</td>
                                        <td>${c.time_to_close.toLocalDate()} ${c.time_to_close.toLocalTime()}</td>
                                        <td>
                                            <c:if test="${c.availability ==0}">
                                                Đã Bán <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:forEach items="${listuser1}" var="d">
                                                <c:if test="${d.idUser == c.id_Bidder_current}">
                                                    *****${d.name.substring(d.name.lastIndexOf(' '),d.name.length())}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td style="text-align: center">
                                            <a href="${pageContext.request.contextPath}/Account/DanhGia?id=${c.id_Bidder_current}" role="button">
                                                <i class="fa fa-commenting-o" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <td> <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Product/Detail?id=${c.idProduct}" role="button">
                                            <i class="fa fa-eye" aria-hidden="true"></i>
                                        </a></td>
                                    </tr>
                                </c:if>

                                </tbody>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="card mt-4">
                <div class="card-header">
                    <h4 >
                        Điểm Đánh Giá: ${profile.mark}
                    </h4>
                    <h6>Top 10 đánh giá mới nhất</h6>
                </div>

                <c:choose>
                    <c:when test="${empty bangdanhgia1}">
                        <div class="card-body">
                            <p class="card-text">Không có đánh giá.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Comment</th>
                                <th>Trạng Thái</th>
                            </tr>
                            </thead>
                            <c:forEach items="${bangdanhgia1}" var="c">
                                <tbody>
                                <tr>

                                    <td id="maskten">
                                        <c:forEach items="${listuser1}" var="d">
                                            <c:if test="${d.idUser == c.id_nguoidanhgia}">
                                                *****${d.name.substring(d.name.lastIndexOf(' '),d.name.length())}
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${c.comment}</td>
                                    <td> <c:if test="${c.trangthai ==1}">
                                        <i class="fa fa-thumbs-up" aria-hidden="true"></i>
                                    </c:if>
                                        <c:if test="${c.trangthai ==0}">
                                            <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                                        </c:if>
                                    </td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
        </c:if>
    </jsp:body>
</t:main>
