<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:Account>
  <jsp:attribute name="css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $('#frmRegister').on('submit', function (e) {
            e.preventDefault();
            const username = $('#txtUsername').val();
            const name = $('#txtName').val();
            const rawpw =$('#txtPassword').val();
            const cfpw =$('#txtConfirm').val();
            const email =$('#txtEmail').val();
            const add =$('#txtAddress').val();

            if (name.length === 0||rawpw.length ===0 || cfpw.length===0 || email.length ===0 ||add.length ===0) {
                alert('Inv  avalible username.');
                return;
            }
            if(rawpw != cfpw){
                alert('Mật khẩu xác nhận chưa đúng');
                return;
            }

            $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?username=' + username, function (data){
                if(data === true){
                    $('#frmRegister').off('submit').submit();
                }
                else {
                    alert('Số điện thoại này đã được đăng kí');
                }
            });
        });
        $('#txtUsername').select();
    </script>
  </jsp:attribute>
    <jsp:body>
        <form action="" method="post" id="frmRegister">
            <div class="card">
                <h4 class="card-header">
                    Account Registration
                </h4>
                <div class="card-body">
                    <h5>Account</h5>
                    <div class="form-group">
                        <label for="txtUsername">Username</label>
                        <input type="text" class="form-control" id="txtUsername" name="username">
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <input type="password" class="form-control" id="txtPassword" name="rawpwd">
                    </div>
                    <div class="form-group">
                        <label for="txtConfirm">Confirm</label>
                        <input type="password" class="form-control" id="txtConfirm">
                    </div>
                    <h5 class="mt-4">Personal Information</h5>
                    <div class="form-group">
                        <label for="txtName">Name</label>
                        <input type="text" class="form-control" id="txtName" name="name">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <input type="text" class="form-control" id="txtEmail" name="email">
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <input type="text" class="form-control" id="txtAddress" name="address">
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Register
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:Account>