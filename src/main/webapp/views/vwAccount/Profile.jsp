<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="profile" scope="request" type="com.ute.webdaugia.beans.User"/>
<t:main>
    <jsp:body>
        <div class="card">
        <h4 class="card-header">
            Profile
        </h4>
            <form action="" method="post" >
                <div class="form-group">
                    <label class="sr-only" for="txtName">Name</label>
                    <div class="input-group">
                        <input type="text" class="form-control form-control-lg border-right-0" id="txtName" name="name" value=${profile.name} autofocus >
                        <div class="input-group-append">
                                    <span class="input-group-text bg-white">
                                      <i class="fa fa-user" aria-hidden="true"></i>
                                    </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="sr-only" for="txtEmail">Email</label>
                    <div class="input-group">
                        <input type="text" class="form-control form-control-lg border-right-0" id="txtEmail" name="email1" value=${profile.email} >
                        <div class="input-group-append">
                <span class="input-group-text bg-white">
                  <i class="fa fa-envelope" aria-hidden="true"></i>
                </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="sr-only" for="txtAddress">Address</label>
                    <div class="input-group">
                        <input type="text" class="form-control form-control-lg border-right-0" id="txtAddress" name="address" value=${profile.address} >
                        <div class="input-group-append">
                <span class="input-group-text bg-white">
                  <i class="fa fa-key" aria-hidden="true"></i>
                </span>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">
                    Save Profile
                </button>
            </form>
        </div>
    </jsp:body>
</t:main>
