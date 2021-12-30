<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/20/2021
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="parentCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ParentCategory>"/>
<jsp:useBean id="childCategories" scope="request" type="java.util.List<com.ute.webdaugia.beans.ChildCategory>"/>
<div class="card">
<c:choose>
    <c:when test="${parentCategories.size() == 0}">
        <div class="card-body">
            <p class="card-text">Không có dữ liệu.</p>
        </div>
    </c:when>
    <c:otherwise>
        <div class="card-body">
            <table class="table table-hover">
                <tbody>
                <c:forEach items="${parentCategories}" var="parentCat">
                    <tr>
                        <td colspan="2" style="width: 85%" >
                            <a style="width: 90%" class="btn btn-sm btn-outline-secondary w-100 alert alert-primary"  href="${pageContext.request.contextPath}/Product/ByParentCatID?id=${parentCat.id}&p=${1}">${parentCat.name}
<%--                            <a style="width: 10%" class="btn btn-sm btn-outline-secondary w-100 alert alert-primary" data-toggle="collapse"--%>
<%--                                                                 href="#collapse-main-${parentCat.id}" role="button" aria-expanded="false"--%>
<%--                                                                  aria-controls="collapse-main-${parentCat.id}">--%>
<%--                                <i class="fa fa-caret-down" aria-hidden="true"></i>--%>
<%--                            </a>--%>

                        </a>

                        </td>
                                    <%--                        <td style="width: 15%" class="text-right">--%>
<%--                            <a class="btn btn-sm btn-outline-secondary w-100 alert alert-primary" data-toggle="collapse"--%>
<%--                               href="#collapse-main-${parentCat.id}" role="button" aria-expanded="false"--%>
<%--                               aria-controls="collapse-main-${parentCat.id}">--%>
<%--                                <i class="fa fa-caret-down" aria-hidden="true"></i>--%>
<%--                            </a>--%>
<%--                        </td>--%>
                    </tr>
                    <c:forEach items="${childCategories}" var="childCat">
                        <c:if test="${parentCat.id eq childCat.parent_id}">
                            <tr class="text-right" id="collapse-main-${parentCat.id}">
                                    <td style="width: 15%">&nbsp;</td>
                                    <td style="width: 70%">
                                        <a href="${pageContext.request.contextPath}/Product/ByCat?id=${childCat.id}&p=${1}" class="btn btn-sm btn-outline-secondary w-100 alert alert-info" >${childCat.name}</a>
                                    </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                </tbody>
                <thead>
                <tr>
                    <th >#</th>
                    <th colspan="2" > <a href="${pageContext.request.contextPath}/Product/WatList">Watch List</a></th>
                </tr>
                </thead>
            </table>
        </div>
    </c:otherwise>
</c:choose>
<%--    <div class="list-group list-group-flush">--%>
<%--        <c:forEach items="${parentCategories}" var="c" >--%>
<%--            <tr class="collapse" id="collapse-main-${c.id}">--%>
<%--                <td>${c.id}</td>--%>
<%--                <td>${c.name}</td>--%>
<%--                <td><a class="btn btn-sm btn-outline-secondary" data-toggle="collapse"--%>
<%--                       href="#collapse-main-${c.id}" role="button" aria-expanded="false"--%>
<%--                       aria-controls="collapse-main-${c.id}">--%>
<%--                    <i class="fa fa-caret-down" aria-hidden="true"></i>--%>
<%--                </a></td>--%>
<%--            </tr>--%>
<%--            <c:forEach items="${childCategories}" var="child">--%>
<%--                <c:if test="${c.id eq child.parent_id}">--%>
<%--                    <tr>--%>
<%--                        <td rowspan="2">--%>
<%--                            <a href="${pageContext.request.contextPath}/Product/ByCat?id=${child.id}" class="list-group-item list-group-item-action">--%>
<%--                                <i class="fa fa-caret-right" aria-hidden="true"></i>--%>
<%--                                    ${child.name}--%>
<%--                            </a>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
</div>

