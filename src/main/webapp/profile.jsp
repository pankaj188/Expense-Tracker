<head>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
    rel="stylesheet">
    <script
    
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    $("#off").click(function() {
    /* const type = $("#password").getAttribute('type') === 'password' ? 'text' :
    'password';
    $("#password").setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('visibility_on'); */
    if ($(this).text() == "visibility_off") {
    $(this).text("visibility");
    $("#password").attr("type", "text");
    } else {
    $(this).text("visibility_off");
    $("#password").attr("type", "password");
    }
    
    });
    });
    </script>
    </head>
    
    <%@include file="head.jsp"%>
    
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <div style="height: 90vh;">
    <form action="profileProcess" method="post"
    enctype="multipart/form-data">
    <div class="row" style="margin: 1px;">
    
    <div class="col-sm-1"></div>
    
    <div class="col-sm-10"
    style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;">
    
    <h1 align="center">Profile Here</h1>
    <hr>
    
    <div align="center">
    <%-- <img class="rounded-circle"
    src="<spring:url value="/images/abc.jpg"/>" width="150"
    height="150"> --%>
    
    <p:choose>
    <p:when test="${sessionScope.user.profileimage ne null}">
    
    <img class="img-circle"
    src="<spring:url value="/profileimage/${sessionScope.user.profileimage}"/>"
    height="150" width="170">
    </p:when>
    
    <p:otherwise>
    <img class="img-circle"
    src="<spring:url value="/images/abc.jpg"/>" width="170"
    height="150">
    </p:otherwise>
    </p:choose>
    
    </div>
    <br>
    <div class="col-md-2"></div>
    
    <div class="col-md-4">
    <br>
    <div class="form-group">
    <label for="name">Full Name:</label> <input type="text"
    class="form-control" id="name" value="${sessionScope.user.name}"
    placeholder="Enter Name" autocomplete="off" name="name" required="required">
    </div>
    <div class="form-group">
    <label for="price">Email Id:</label> <input type="email"
    class="form-control" id="email" value="${sessionScope.user.email}"
    placeholder="Enter Email" name="price" readonly="readonly">
    </div>
    </div>
    
    
    <div class="col-md-4">
    <br>
    <div class="form-group">
    <label for="quantity">Password</label>
    <div
    style="display: flex; align-items: center; border: 1px lightgray solid; border-radius: 5px;">
    <input type="password" class="form-control" style="border: 0;"
    id="password" name="pass" placeholder="Enter Password" required="required"
    value="${sessionScope.user.pass}"><span id="off"
    style="cursor: default; margin-right: 12px;"
    class="material-icons md-24">visibility_off</span>
    </div>
    </div>
    <div class="form-group">
    <label for="file">Upload Profile Image</label> <input type="file"
    class="form-control" id="customFile" name="imageprofile">
    </div>
    
    </div>
    
    
    <div class="form-inline">
    
    <div class="row"
    style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;">
    <div class="col-sm-3"></div>
    <div class="col-sm-6" align="center">
    <br>
    <button type="submit" class="btn btn-primary" style="width: 100%;">Update
    Profile</button>
    <br> <br> <br>
    </div>
    <div class="col-sm-2"></div>
    </div>
    </div>
    
    </div>
    
    </div>
    
    </form>
    <br>
    <%@include file="foot.jsp"%>
    </div>