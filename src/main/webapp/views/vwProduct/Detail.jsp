<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:catch var="catchException">
    <jsp:useBean id="product" scope="request" type="com.ute.webdaugia.beans.Product" />
    <jsp:useBean id="mark" scope="request" type="com.ute.webdaugia.beans.User"/>
    <jsp:useBean id="wlists" scope="request" type="java.util.List<com.ute.webdaugia.beans.Wishlist>"/>
</c:catch>

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
            .quantity {
                display: flex;
                justify-content: center;
            }

            .quantity button {
                width: 45px;
                height: 45px;
                border: 1px solid #000;
                color: #000;
                border-radius: 0;
                background: #fff
            }

            .quantity input {
                border: none;
                border-top: 1px solid #000;
                border-bottom: 1px solid #000;
                text-align: center;
                width: 100px;
                font-size: 20px;
                color: #000;
                font-weight: 300;
            }

            .total-price {
                text-align: center;
                font-size: 30px;
                color: #fff;
            }

            .total-price .fa-rupee {
                display: inline-block;
                font-size: 90%;
                margin-right: 5px;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            function changeImage(id){
                let imagePath = document.getElementById(id).getAttribute('src');
                document.getElementById('main-image').setAttribute('src',imagePath);
            }
                //setting default attribute to disabled of minus button
                document.querySelector(".minus-btn").setAttribute("disabled", "disabled");

                //taking value to increment decrement input value
                let valueCount;
            let buocnhay = parseInt(document.getElementById("buocnhay").value) ;

            document.querySelector(".plus-btn").addEventListener("click", function() {
                //getting value of input
                valueCount =document.getElementById("quantity").value;

                //input value increment by 1
                valueCount = valueCount - -${product.buoc_nhay};

                //setting increment input value
                document.getElementById("quantity").value = valueCount;

                if (valueCount > 1) {
                    document.querySelector(".minus-btn").removeAttribute("disabled");
                    document.querySelector(".minus-btn").classList.remove("disabled")
                }
            })
                //plus button
                document.querySelector(".minus-btn").addEventListener("click", function() {
                //getting value of input
                valueCount = document.getElementById("quantity").value;

                //input value increment by 1
                valueCount = valueCount - ${product.buoc_nhay};

                //setting increment input value
                document.getElementById("quantity").value = valueCount

                if (valueCount == ${product.current_Price}) {
                document.querySelector(".minus-btn").setAttribute("disabled", "disabled")
            }
            })
            function validate(form) {
                if(!valid) {
                    alert('Please correct the errors in the form!');
                    return false;
                }
                else {
                    return confirm('Do you really want to submit the form?');
                }
            }

            var p = document.querySelector('p');
            <%--let ngay = ${product.name};--%>
            var ngayconlai = document.getElementById("dongho1").innerHTML;
            console.warn(ngayconlai);
            let str = document.getElementById("dongho1").innerHTML;
            let res = str.replace(/T/g," ");
            let res1 = res.replace(/-/g,"/");
            document.getElementById("dongho1").innerHTML = res1;
            var tet = new Date(res1).getTime();
           // var tet = new Date("Feb 5,2019 24:00:00").getTime();
            //Tổng số giây
            var countDown = setInterval(run,1000);
            function run(){
                var now = new Date().getTime();
                //Số s đến thời gian hiện tại
                var timeRest = tet - now;
                //Số s còn lại để đến tết;
                var day = Math.floor(timeRest/(1000*60*60*24));
                //Số ngày còn lại
                var hours = Math.floor(timeRest%(1000*60*60*24)/(1000*60*60));
                // Số giờ còn lại
                var minute = Math.floor(timeRest%(1000*60*60)/(1000*60));
                // Số phút còn lại
                var sec = Math.floor(timeRest%(1000*60)/(1000));
                // Số giây còn lại
                dongho.innerHTML ='Thời gian còn lại: '+ day+' DAY '+hours+' : ' + minute + ' : ' + sec +"  ";
                if(timeRest <= 0){
                    clearInterval(counDown);
                    dongho.innerHTML = "HPNY";
                }
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
            <div class="card-header">
            <h4 >
                    ${product.name}
            </h4>
            <div class="banner">
                <hr>
                <p id="dongho"></p>
                <div>Thời gian trong DB: <span id="dongho1">${product.time_to_close}</span></div>
            </div>
            </div>
            <form action="" method="post"onSubmit="if(!confirm('Bạn có chắn chắn muốn Ra Giá cho sản phẩm này?')){return false;}">
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
                        <p class="card-text">Giá Hiện Tại: <span class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${product.current_Price + product.buoc_nhay}" /> </span></p>
                        <p class="card-text">Điểm Đánh Giá: <span class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${mark.mark}" /> </span></p>
                    </div>
                </div>
            </div>
        <div class="card-footer text-muted">
            <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Product/ByCat?id=${product.idCat}" role="button">
                <i class="fa fa-backward" aria-hidden="true"></i>
                List
            </a>
            <c:set scope="request" var="check_diem" value="" />
            <c:if test="${mark.mark> 30}">
                <c:set scope="request" var="check_diem" value="true" />
            </c:if>
            <c:if test="${check_diem.length() == 0}">
                <a  class="btn btn-outline-danger" href="${pageContext.request.contextPath}/Product/addwatlist?id_product=${c.idProduct}" role="button">
                    <i class="fa fa-times-circle"></i>
                    Không được Đấu giá
                </a>
            </c:if>
            <c:if test="${check_diem.length() != 0}">
                <a  class="btn  btn-outline-warning" href="${pageContext.request.contextPath}/Product/delwatlist?id_product=${c.idProduct}" role="button">
                    <i class="fa fa-check-circle"></i>
                    Được Đấu Giá
                </a>

            </c:if>
            <c:set scope="request" var="check" value="" />
            <c:forEach items="${wlists}" var="wl">
                <c:if test="${product.idProduct == wl.id_product}">
                    <c:set scope="request" var="check" value="true" />
                </c:if>
            </c:forEach>
            <c:if test="${check.length() == 0}">
                <a  class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Product/addwatlist?id_product=${c.idProduct}" role="button">
                    <i class="fa fa-heart" aria-hidden="true"></i>
                </a>
            </c:if>
            <c:if test="${check.length() != 0}">
                <a  class="btn  btn-outline-primary" href="${pageContext.request.contextPath}/Product/delwatlist?id_product=${c.idProduct}" role="button">
                    Unlike
                </a>
                <c:set scope="request" var="check" value="" />
            </c:if>
        </div>
        <div class="card-body">
            <c:if test="${check_diem.length() != 0}">
            <div>Bước nhảy: <span id="buocnhay">${product.buoc_nhay}</span></div>
                <div class="quantity">
                    <button class="btn minus-btn disabled" type="button">-</button>
                    <input type="text" id="quantity" name="Price" value="${product.current_Price}">
                    <button class="btn plus-btn" type="button">+</button>
                </div>
                </div>
                <c:set scope="request" var="check_diem" value="" />
            </c:if>
        </div>
                <button type="submit" class="btn btn-primary">
                    Ra Giá
                </button>
            </form>
        </div>


    </jsp:body>

</t:main>