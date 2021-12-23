<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="product" scope="request" type="com.ute.webdaugia.beans.Product" />


<t:main>
<jsp:attribute name="css">
        <style>

            ul li{
                margin-left: 20px;
                display: inline-block;
                list-style: none;
            }
            ul, #main-img{
                float: left;
            }
            ul li img{
                width: 100px;
                cursor: pointer;
            }
            #main-img{
                width: 500px;
            }
            #main-img img{
                width: 400px;
                margin-top: 10px;
                margin-left: 20px;
                margin-bottom: 20px;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            function changeImage(id){
                let imagePath = document.getElementById(id).getAttribute('src');
                document.getElementById('main-image').setAttribute('src',imagePath);
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                ABC
            </h4>
            <div class="card-body">
                <div class ="row">
                    <div class="col-sm-5">
                        <div id = "main-img">
                            <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.idProduct}/main.jpg"  id="main-image">
                        </div>
                        <ul>
                            <li><img src="${pageContext.request.contextPath}/public/imgs/sp/${product.idProduct}/main.jpg" onclick="changeImage('one')" id="one"></li>
                            <li><img src="${pageContext.request.contextPath}/public/imgs/sp/${product.idProduct}/1.jpg"     onclick="changeImage('two')" id="two"></li>
                            <li><img src="${pageContext.request.contextPath}/public/imgs/sp/${product.idProduct}/2.jpg"     onclick="changeImage('three')" id="three"></li>
                        </ul>
                    </div>
                    <div class="col-sm-5">
                        <h3>Tên Sản Phẩm: ${product.name}</h3>
                        <p class="card-text">Giá mua ngay: <span class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${product.imme_Price}" /> </span></p>
                        <p class="card-text">${product.detail_full}</p>
                        <p class="card-text"></p>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>