<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="seller" scope="request" type="com.ute.webdaugia.beans.User"/>

<t:Account>
  <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Thong Tin Seller
                    </h4>
                    <div class="card-body d-flex justify-content-between ">
                        <div class="container-fluid h-100">
                                <form>
                                    <div class="form-group">
                                        <label for="txtId">ID</label>
                                        <input type="text" class="form-control" name="idsl" id="txtId" readonly value="${seller.idUser}" >
                                    </div>
                                    <div class="form-group">
                                        <label for="txtName">Họ và tên</label>
                                        <input type="text" class="form-control" id="txtName" readonly value="${seller.name}">
                                    </div>
                                    <div class="form-group">
                                        <label for="txtAddress">Địa Chỉ</label>
                                        <input type="text" class="form-control" id="txtAddress" readonly value="${seller.address}">
                                    </div>
                                    <div class="form-group d-flex">
                                        <div>
                                            <a class="btn btn-lg btn-outline-info" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/Index" role="button">
                                                <i class="fa fa-home" aria-hidden="true"></i>
                                                Quit
                                            </a>
                                        </div>
                                        <div class="flex-fill ml-1">
                                            <a class="btn btn-lg btn-outline-info" href="${pageContext.request.contextPath}/Admin/QuanLiSeller/DeleteSeller?id=${seller.idUser}" role="button">
                                                <i class="fa fa-sign-in" aria-hidden="true"></i>
                                                Không cho bán hàng
                                            </a>
                                        </div>
                                    </div>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
            </div>
        </div>
    </jsp:body>
</t:Account>