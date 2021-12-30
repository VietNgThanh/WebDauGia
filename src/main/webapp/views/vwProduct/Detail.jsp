<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:catch var="catchException">
  <jsp:useBean id="product" scope="request" type="com.ute.webdaugia.beans.Product"/>
  <jsp:useBean id="mark" scope="request" type="com.ute.webdaugia.beans.User"/>
  <jsp:useBean id="wlists" scope="request" type="java.util.List<com.ute.webdaugia.beans.Wishlist>"/>
  <jsp:useBean id="lichsu" scope="request" type="java.util.List<com.ute.webdaugia.beans.Orders>"/>
  <jsp:useBean id="listuser" scope="request" type="java.util.List<com.ute.webdaugia.beans.User>"/>
  <jsp:useBean id="auth" scope="session" type="java.lang.Boolean"/>
  <jsp:useBean id="user" scope="request" type="java.lang.Integer"/>
  <jsp:useBean id="soluotragia" scope="request" type="java.lang.Integer"/>
  <jsp:useBean id="listtuchoi" scope="request" type="java.util.List<com.ute.webdaugia.beans.TuChoiBidder>"/>
</c:catch>

<t:main>
<jsp:attribute name="css">
        <style>

            /*ul li {*/
            /*    margin-left: 20px;*/
            /*    display: inline-block;*/
            /*    list-style: none;*/
            /*}*/

            ul, #main-img {
                float: left;
            }

            ul li img {
                width: 100px;
                cursor: pointer;
            }

            #main-img {
                width: 500px;
            }

            #main-img img {
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
    <script src="https://cdn.tiny.cloud/1/b1w3bpsdbm322siduetl70lw4g7io70p7yq2ejdggdwh73z5/tinymce/5/tinymce.min.js"
            referrerpolicy="origin">
    </script>
        <script>
            tinymce.init({
                selector: '#txtAddFullDes',
                height: 300,
                plugins: 'lists paste link autolink table',
                menubar: false,
                toolbar: [
                    'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link'
                ]
            });
        </script>
        <script>
            var p = document.querySelector('p');
            <%--let ngay = ${product.name};--%>

            var ngayconlai = document.getElementById("dongho1").innerHTML;
            console.warn(ngayconlai);
            let str = document.getElementById("dongho1").innerHTML;
            let res = str.replace(/T/g, " ");
            let res1 = res.replace(/-/g, "/");
            document.getElementById("dongho1").innerHTML = res1;
            var tet = new Date(res1).getTime();
            // var tet = new Date("Feb 5,2019 24:00:00").getTime();
            //Tổng số giây
            var countDown = setInterval(run, 1000);

            function run() {
                var now = new Date().getTime();
                //Số s đến thời gian hiện tại
                var timeRest = tet - now;
                //Số s còn lại để đến tết;
                var day = Math.floor(timeRest / (1000 * 60 * 60 * 24));
                //Số ngày còn lại
                var hours = Math.floor(timeRest % (1000 * 60 * 60 * 24) / (1000 * 60 * 60));
                // Số giờ còn lại
                var minute = Math.floor(timeRest % (1000 * 60 * 60) / (1000 * 60));
                // Số phút còn lại
                var sec = Math.floor(timeRest % (1000 * 60) / (1000));
                // Số giây còn lại
                if (day < 0) {
                    dongho.innerHTML = "Đã hết thời gian đấu giá";
                } else {
                    dongho.innerHTML = 'Thời gian còn lại: ' + day + ' DAY ' + hours + ' : ' + minute + ' : ' + sec + "  ";
                }
                if (timeRest <= 0) {
                    clearInterval(counDown);
                    dongho.innerHTML = "HPNY";
                }

            }

            function changeImage(id) {
                let imagePath = document.getElementById(id).getAttribute('src');
                document.getElementById('main-image').setAttribute('src', imagePath);
            }

            //setting default attribute to disabled of minus button
            document.querySelector(".minus-btn").setAttribute("disabled", "disabled");

            //taking value to increment decrement input value
            let valueCount;
            let buocnhay = parseInt(document.getElementById("buocnhay").value);

            document.querySelector(".plus-btn").addEventListener("click", function () {
                //getting value of input
                valueCount = document.getElementById("quantity").value;

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
            document.querySelector(".minus-btn").addEventListener("click", function () {
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
                if (!valid) {
                    alert('Please correct the errors in the form!');
                    return false;
                } else {
                    return confirm('Do you really want to submit the form?');
                }
            }


        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card">
        <div class="card-header">
            <h4>
                    ${product.name}
            </h4>
            <div class="banner">
                <hr>
                <p id="dongho"></p>
                <div style="visibility: hidden">Thời gian trong DB: <span id="dongho1">${product.time_to_close}</span>
                </div>
            </div>
        </div>
        <form action="" method="post"onSubmit="if(!confirm('Bạn có chắn chắn muốn Ra Giá cho sản phẩm này?')){return false;}">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-5">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100"
                                     src="${pageContext.request.contextPath}/public/imgs/${product.idProduct}/1.jpg"
                                    >
                            </div>
                            <c:forEach begin="2" end="${product.sohinhanh}" step="1" var="i">

                            <div class="carousel-item">
                                    <img class="d-block w-100"
                                         src="${pageContext.request.contextPath}/public/imgs/${product.idProduct}/${i}.jpg">
                            </div>
                            </c:forEach>

                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" style="color: black"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="col-sm-5">
                    <h3> ${product.name}</h3>
                    <c:if test="${product.availability == 1}">
                        <p class="card-text">Giá mua ngay: <span class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${product.imme_Price}"/> VNĐ </span></p>
                        <p class="card-text">${product.detail_tiny}</p>
                        <p class="card-text">Giá Hiện Tại: <span class="text-danger font-weight-bold">
                            <fmt:formatNumber value="${product.current_Price + product.buoc_nhay}"/> VNĐ </span></p>
                        <c:forEach items="${listuser}" var="d">
                            <c:if test="${d.idUser == product.userid}">
                                <p id="maskten">Người Bán:
                                    *****${d.name.substring(d.name.lastIndexOf(' '),d.name.length())}</p>
                            </c:if>
                        </c:forEach>
                        <c:if test="${auth==true}">
                            <a href="${pageContext.request.contextPath}/Account/URLDanhGia?id=${product.userid}"
                               role="button">
                                <p class="card-text">Điểm Đánh Giá của Người Bán:
                                    <span class="text-danger font-weight-bold">
                                <c:forEach items="${listuser}" var="d">
                                  <c:if test="${product.userid == d.idUser}">
                                    <fmt:formatNumber value="${d.mark}"/>
                                  </c:if>
                                </c:forEach>
                             </span>
                                </p>
                            </a>
                        </c:if>
                        <c:if test="${auth==false}">
                            <a href="${pageContext.request.contextPath}/Account/Login" role="button">
                                <p class="card-text">Điểm Đánh Giá của Người Bán:
                                    <span class="text-danger font-weight-bold">
                                <c:forEach items="${listuser}" var="d">
                                  <c:if test="${product.userid == d.idUser}">
                                    <fmt:formatNumber value="${d.mark}"/>
                                  </c:if>
                                </c:forEach>
                             </span>
                                </p>
                            </a>
                        </c:if>
                        <c:if test="${soluotragia != 0}">
                            <p class="card-text">Bidder ra giá cao nhất:
                            <c:forEach items="${listuser}" var="d">
                                <c:if test="${d.idUser == product.id_Bidder_current}">
                                    <td id="maskten">
                                        *****${d.name.substring(d.name.lastIndexOf(' '),d.name.length())}</td>
                                </c:if>
                            </c:forEach>
                            <c:if test="${auth==true}">
                                <a href="${pageContext.request.contextPath}/Account/URLDanhGia?id=${product.id_Bidder_current}"
                                   role="button">
                                    <p class="card-text">Điểm Đánh Giá của Bidder Giữ Giá Cao Nhất: <span
                                            class="text-danger font-weight-bold">
                                <c:forEach items="${listuser}" var="d">
                                  <c:if test="${product.id_Bidder_current == d.idUser}">
                                    <fmt:formatNumber value="${d.mark}"/>
                                  </c:if>
                                </c:forEach>
                             </span>
                                    </p>
                                </a>
                            </c:if>
                            <c:if test="${auth==false}">
                                <a href="${pageContext.request.contextPath}/Account/Login" role="button">
                                    <p class="card-text">Điểm Đánh Giá của Bidder Giữ Giá Cao Nhất: <span
                                            class="text-danger font-weight-bold">
                                <c:forEach items="${listuser}" var="d">
                                  <c:if test="${product.id_Bidder_current == d.idUser}">
                                    <fmt:formatNumber value="${d.mark}"/>
                                  </c:if>
                                </c:forEach>
                             </span></p>
                                </a>
                            </c:if>
                        </c:if>

                        <%--                            <p class="card-text">Điểm Đánh Giá của Bản Thân: <span class="text-danger font-weight-bold">--%>
                        <%--                            <fmt:formatNumber value="${mark.mark}" /> </span></p>--%>
                        <p class="card-text">Ngày Đăng: <span class="text-danger font-weight-bold">
                                ${product.ngay_bat_dau.toLocalDate()} ${product.ngay_bat_dau.toLocalTime()}
                            </span></p>
                        <p class="card-text">Số lượt ra giá: <span class="text-danger font-weight-bold">
                                ${soluotragia}
                        </span></p>
                    </c:if>
                    <c:if test="${product.availability == 0}">
                        <p class="card-text"><span class="text-danger font-weight-bold">
                            Sản phẩm đã được bán </span></p>
                    </c:if>


                </div>
            </div>
        </div>
        <div class="card-footer text-muted">
            <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Product/ByCat?id=${product.idCat}" role="button">
                <i class="fa fa-backward" aria-hidden="true"></i>
                List
            </a>
            <c:if test="${auth == true}">
                <c:set var="check_tuchoi" value=""/>
                <c:forEach items="${listtuchoi}" var="tuchoi">
                    <c:if test="${tuchoi.id_bidder == user && tuchoi.id_product == product.idProduct}">
                        <c:set var="check_tuchoi" value="true"/>
                    </c:if>
                </c:forEach>
                <c:if test="${check_tuchoi.length() !=0}">
                    <span  class="btn btn-outline-danger">
                        <i class="fa fa-times-circle"></i>
                        Không được Đấu giá
                    </span>
                </c:if>
                <c:if test="${check_tuchoi.length() ==0}">

                <c:forEach items="${listuser}" var="ls">
                    <c:if test="${ls.idUser==user}">
                        <c:if test="${ls.permission==1 || ls.permission==4}">
                            <c:set scope="request" var="check_diem" value="" />

                            <c:if test="${mark.mark>= 80}">
                                <c:set scope="request" var="check_diem" value="true" />
                            </c:if>
                            <c:if test="${product.availability == 1}">

                                <c:if test="${check_diem.length() == 0}">
                                    <a  class="btn btn-outline-danger" href="${pageContext.request.contextPath}/Product/addwatlist?id_product=${c.idProduct}" role="button">
                                        <i class="fa fa-times-circle"></i>
                                        Không được Đấu giá
                                    </a>
                                </c:if>
                                <c:if test="${check_diem.length() != 0}">
                                    <a  class="btn  btn-outline-warning" href="#" role="button">
                                        <i class="fa fa-check-circle"></i>
                                        Được Đấu Giá
                                    </a>

                                </c:if>
                            </c:if>
                        </c:if>
                    </c:if>
                </c:forEach>
                </c:if>
                <c:if test="${product.availability == 1}">
            <c:set scope="request" var="check" value="" />
            <c:forEach items="${wlists}" var="wl">
                <c:if test="${product.idProduct == wl.id_product}">
                    <c:set scope="request" var="check" value="true" />
                </c:if>
            </c:forEach>
            <c:if test="${check.length() == 0}">
                <a  class="btn btn-outline-primary" href="${pageContext.request.contextPath}/Product/addwatlistDetail?id_product=${product.idProduct}" role="button">
                    <i class="fa fa-heart" aria-hidden="true"></i>
                </a>
            </c:if>
            <c:if test="${check.length() != 0}">
                <a  class="btn  btn-outline-primary" href="${pageContext.request.contextPath}/Product/delwatlistDetail?id_product=${product.idProduct}" role="button">
                    Unlike
                </a>
                <c:set scope="request" var="check" value="" />
            </c:if>
            </c:if>
        </div>

      <c:set var="check_tuchoi" value=""/>
      <c:forEach items="${listtuchoi}" var="tuchoi">
        <c:if test="${tuchoi.id_bidder == user && tuchoi.id_product == product.idProduct}">
          <c:set var="check_tuchoi" value="true"/>
        </c:if>
      </c:forEach>
      <form action="" method="post"
      onSubmit="if(!confirm('Bạn có chắn chắn muốn Ra Giá cho sản phẩm này?')){return false;}">
      <c:if test="${check_tuchoi.length() ==0}">
        <c:forEach items="${listuser}" var="ls">
          <c:if test="${ls.idUser==user}">
            <c:if test="${ls.permission==1 || ls.permission==4}">
              <c:if test="${product.availability == 1 }">
                <div class="card-body">
                <c:if test="${check_diem.length() != 0}">
                  <div>Bước nhảy: <span id="buocnhay">${product.buoc_nhay} VNĐ</span></div>
                  <div class="quantity">
                    <button class="btn minus-btn disabled" type="button">-</button>
                    <input type="text" id="quantity" name="Price" value="${product.current_Price+product.buoc_nhay}">
                    <button class="btn plus-btn" type="button">+</button>
                  </div>
                  </div>
                  <c:set scope="request" var="check_diem" value=""/>
                </c:if>
                <button type="submit" class="btn btn-primary">
                  Ra Giá
                </button>
              </c:if>
            </c:if>
          </c:if>
        </c:forEach>
        <c:set var="check_tuchoi" value=""/>
      </c:if>
      </form>
      </c:if>
    </div>

    <div class="container my-5">
      <div class="px-5 py-0">
        <h3 class="text-center">Mô tả sản phẩm</h3>
        <p class="card-text">${product.detail_full}</p>
        <c:if test="${user==product.userid}">
          <p>
            <a class="btn btn-outline-success" data-toggle="collapse" href="#areaAddFullDes" role="button"
               aria-expanded="false"
               aria-controls="areaAddFullDes">
              Thêm mô tả
            </a>
          </p>
          <div class="collapse" id="areaAddFullDes">
            <div class="card card-body">
              <form id="frmAddFullDes" action="" method="post">
                <input id="proId" name="proId" type="hidden" value="${product.idProduct}">
                <textarea id="txtAddFullDes" name="txtAddFullDes">

                </textarea>
                <button type="submit"
                        formaction="${pageContext.request.contextPath}/Misc/AddFullDes?id=${product.idProduct}"
                        class="btn btn-primary">
                  <i class="fa fa-check" aria-hidden="true"></i>
                  Save
                </button>
              </form>
            </div>
          </div>
        </c:if>
      </div>
    </div>

    <c:if test="${auth==true}">
      <c:if test="${product.availability == 1}">
        <div class="card mt-4">
          <h4 class="card-header">
            Lịch sử Đấu giá
          </h4>
          <c:choose>
            <c:when test="${empty lichsu}">
              <div class="card-body">
                <p class="card-text">Không có lịch sử đấu giá.</p>
              </div>
            </c:when>
            <c:otherwise>
              <table class="table">
                <thead>
                <tr>
                  <th>Thời điểm</th>
                  <th>Người mua</th>
                  <th>Giá</th>
                  <c:if test="${user==product.userid}">
                    <th>Đánh Giá Người Mua</th>
                    <th>Từ chối Ra Giá</th>
                  </c:if>
                </tr>
                </thead>
                <c:forEach items="${lichsu}" var="c">
                  <tbody>
                  <tr>
                    <td scope="row">${c.time_make_price.toLocalDate()} ${c.time_make_price.toLocalTime()}</td>
                    <c:forEach items="${listuser}" var="d">
                      <c:if test="${d.idUser == c.id_User}">
                        <td id="maskten">*****${d.name.substring(d.name.lastIndexOf(' '),d.name.length())}</td>
                      </c:if>
                    </c:forEach>
                    <td>${c.current_price}</td>
                    <c:if test="${user==product.userid}">
                      <td>
                        <c:if test="${auth==true}">
                          <a href="${pageContext.request.contextPath}/Account/URLDanhGia?id=${c.id_User}" role="button">
                            <i class="fa fa-commenting-o" aria-hidden="true"></i>
                          </a>
                        </c:if>
                        <c:if test="${auth==false}">
                          <a href="${pageContext.request.contextPath}/Account/Login" role="button">
                            <i class="fa fa-commenting-o" aria-hidden="true"></i>
                          </a>
                        </c:if>
                      </td>
                      <td>
                        <a href="${pageContext.request.contextPath}/Product/addTuchoiBidderRagia?id_product=${product.idProduct}&id_bidder=${c.id_User}"
                           role="button">
                          <i class="fa fa-times" aria-hidden="true"></i>
                        </a>
                      </td>
                    </c:if>
                  </tr>
                  </tbody>
                </c:forEach>
              </table>
            </c:otherwise>
          </c:choose>
        </div>
      </c:if>
    </c:if>

  </jsp:body>

</t:main>