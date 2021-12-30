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
        function getranIndex(maxLength){
            return Math.floor(Math.random() * maxLength)
        }
        var cap;
        function getCapcha(){
            var canvas = document.getElementById('canvas');
            var pen = canvas.getContext('2d');
            var captch = Math.random().toString(36).substring(2,10);

            pen.font="30px Georgia";
            pen.fillStyle = "grey";
            pen.fillRect(0,0,400,400);
            pen.fillStyle = "orange";
            maxLength = captch.length;
            index1 = getranIndex(maxLength);
            index2 = getranIndex(maxLength);

            captch = captch.substring(0, index1-1)+captch[index1].toUpperCase()+captch.substring(index1+1,maxLength);
            captch = captch.substring(0, index2-1)+captch[index2].toUpperCase()+captch.substring(index2+1,maxLength);

            cap = captch;
            captch = captch.split('').join(' ');
            pen.fillText(captch,40,40);
        }
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

                if(data === false){
                    alert('Username này đã được đăng kí');
                }
                else {
                    $.getJSON('${pageContext.request.contextPath}/Account/IsEmail?email='+ email,function (dataem){
                        if(dataem === false){
                            alert('Email này đã được đăng kí');
                        }
                        else {
                            typedata = document.getElementById('typedText').value;
                            if(typedata === cap){
                                $('#frmRegister').off('submit').submit();
                            }
                            else {
                                alert('sai capcha');
                                document.getElementById('typedText').value = "";
                                getCapcha();
                            }

                        }
                    });
                }
            });
        });
    </script>
  </jsp:attribute>
    <jsp:body>
        <body onload="getCapcha()">
        <form action="" method="post" id="frmRegister" >
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
                <table style="border: 2px solid black" >
                    <tr>
                        <td>Capcha</td>
                        <td>
                            <canvas  width="220" height="60" id="canvas" style="border: 2px solid grey"></canvas>
                        </td>
                        <td>
                            <button type="button" onclick="getCapcha()"> Refresh</button>
                        </td>
                    </tr>
                    <td>Enter</td>
                    <td><input type="text" size="30" id="typedText"></td>
                </table>

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary" >
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Register
                    </button>
                </div>
            </div>
        </form>
        </body>

    </jsp:body>
</t:Account>