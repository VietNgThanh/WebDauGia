<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:catch var="catchException">
<jsp:useBean id="profile" scope="request" type="com.ute.webdaugia.beans.User"/>
<jsp:useBean id="bangdanhgia" scope="request" type="java.util.List<com.ute.webdaugia.beans.Danh_Gia_NguoiDung>"/>
<jsp:useBean id="listuser" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>
</c:catch>
<t:main>
    <jsp:body>
        <c:if test="${auth == true}">
            <form action="" method="post" >
                <div class="card mt-4">
                    <div class="card-header">
                        <h4 >
                            Điểm Đánh Giá của *****${profile.name.substring(profile.name.lastIndexOf(' '),profile.name.length())}: ${profile.mark}
                        </h4>
                        <h6>Top 10 đánh giá mới nhất</h6>
                    </div>

                    <c:choose>
                        <c:when test="${empty bangdanhgia}">
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
                                <c:forEach items="${bangdanhgia}" var="c">
                                    <tbody>
                                    <tr>

                                        <td id="maskten">
                                            <c:forEach items="${listuser}" var="d">
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

