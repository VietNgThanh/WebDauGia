<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<t:Account>
    <jsp:attribute name="css">
          <style>
              #login-Body {
                  margin-top: 100px;
                  height: 120vh;
              }
              body {
                  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAxMC8yOS8xMiKqq3kAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAABHklEQVRIib2Vyw6EIAxFW5idr///Qx9sfG3pLEyJ3tAwi5EmBqRo7vHawiEEERHS6x7MTMxMVv6+z3tPMUYSkfTM/R0fEaG2bbMv+Gc4nZzn+dN4HAcREa3r+hi3bcuu68jLskhVIlW073tWaYlQ9+F9IpqmSfq+fwskhdO/AwmUTJXrOuaRQNeRkOd5lq7rXmS5InmERKoER/QMvUAPlZDHcZRhGN4CSeGY+aHMqgcks5RrHv/eeh455x5KrMq2yHQdibDO6ncG/KZWL7M8xDyS1/MIO0NJqdULLS81X6/X6aR0nqBSJcPeZnlZrzN477NKURn2Nus8sjzmEII0TfMiyxUuxphVWjpJkbx0btUnshRihVv70Bv8ItXq6Asoi/ZiCbU6YgAAAABJRU5ErkJggg==);
              }
          </style>
    </jsp:attribute>
    <jsp:body>
        <div id="login-Body" class="container-fluid h-100">
            <div class="row h-100 justify-content-center align-items-center">
                <div class="col-sm-4">
                    <c:if test="${hasError}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <strong>Login failed!</strong> ${errorMessage}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <form action="" method="post">
                        <div class="form-group">
                            <label class="sr-only" for="txtUsername">Username</label>
                            <div class="input-group">
                                <input type="text" class="form-control form-control-lg border-right-0" id="txtUsername" name="username" autofocus placeholder="Username">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-white">
                                      <i class="fa fa-user" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="txtPassword">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control form-control-lg border-right-0" id="txtPassword" name="password" placeholder="Password">
                                <div class="input-group-append">
                <span class="input-group-text bg-white">
                  <i class="fa fa-key" aria-hidden="true"></i>
                </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group d-flex">
                            <div>
                                <a class="btn btn-lg btn-outline-info" href="${pageContext.request.contextPath}/Home" role="button">
                                    <i class="fa fa-home" aria-hidden="true"></i>
                                    Home
                                </a>
                            </div>
                            <div class="flex-fill ml-1">
                                <button type="submit" class="btn btn-lg btn-info btn-block">
                                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                                    Sign In
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:Account>