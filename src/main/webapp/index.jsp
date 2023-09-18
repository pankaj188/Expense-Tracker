<head>
    <script
    
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
    
    src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function() {
    $("#regbtn").click(function() {
    $("#login").css("display", "none");
    $("#register").css("display", "block");
    });
    
    $("#logbtn").click(function() {
    $("#register").css("display", "none");
    $("#login").css("display", "block");
    });
    
    $("#lgbtn").click(function() {
    var email = $("#email").val();
    var pass = $("#pwd").val();
    
    if (email == "") {
    alert("Please enter email id");
    /* $("#email").focus().css("border-color","red"); */
    } else if (pass == "") {
    alert("Please enter password");
    /* $("#pwd").focus().css("border-color","red"); */
    } else {
    $.post("login", {
    email : email,
    pass : pass,
    }, function(response) {
    $("body").html(response);
    });
    }
    });
    
    $("#rgbtn").click(function() {
    var name = $("#name").val();
    var email = $("#remail").val();
    var pass = $("#rpwd").val();
    
    if (name == "") {
    alert("Please enter full name");
    /* $("#email").focus().css("border-color","red"); */
    }else if (email == "") {
    alert("Please enter email id");
    /* $("#email").focus().css("border-color","red"); */
    } else if (pass == "") {
    alert("Please enter password");
    /* $("#pwd").focus().css("border-color","red"); */
    } else {
    $.post("register", {
    name:name,
    email : email,
    pass : pass,
    }, function(response) {
    $("body").html(response);
    });
    }
    });
    
    });
    </script>
    </head>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <body
    style="background-image: url('<spring:url value="/images/back.jpg"/>');background-size:
    cover;width:100%;">
    <%@include file="head.jsp"%>
    
    <br>
    <div class="row" style="margin: 1px;">
    
    <div class="col-sm-4" align="center">
    <lottie-player
    src="https://assets2.lottiefiles.com/packages/lf20_LnBl3M.json"
    background="transparent" speed="2"
    style="width: 300px; height: 300px;" loop autoplay></lottie-player>
    <br> <br>
    </div>
    
    <div class="col-sm-3">
    <b>${msg}</b>
    </div>
    
    <div class="col-sm-4" id="login"
    style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s; background: white; border-radius:
    10px;">
    <h1 align="center">Login Detail</h1>
    <hr>
    <%-- <form action="login" method="post"> --%>
    <div class="form-group">
    <label for="email">Email address:</label> <input type="email"
    class="form-control" id="email" placeholder="Enter Email"
    name="email">
    </div>
    <div class="form-group">
    <label for="pwd">Password:</label> <input type="password"
    class="form-control" id="pwd" placeholder="Enter Password"
    name="pass">
    </div>
    <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
    </div>
    <button type="button" class="btn btn-primary" id="lgbtn"
    style="width: 100%;">Login</button>
    <div style="width: 100%;">
    <div style="width: 40%; float: left;">
    <hr>
    </div>
    <div
    style="width: 20%; float: left; text-align: center; line-height: 40px;">
    <b>OR</b>
    </div>
    <div style="width: 40%; float: right;">
    <hr>
    </div>
    </div>
    <button type="button" class="btn btn-primary" id="regbtn"
    style="width: 100%;">For new user click here</button>
    <br> <br> <br> <br>
    <%-- </form> --%>
    </div>
    
    <div class="col-sm-4" id="register"
    style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s; background: white; border-radius: 10px;
    display: none;">
    <h1 align="center">Register Detail</h1>
    <hr>
    <%-- <form action="register" method="post"> --%>
    
    <div class="form-group">
    <label for="name">Full Name:</label> <input type="text"
    class="form-control" id="name" placeholder="Enter Name"
    name="name">
    </div>
    
    <div class="form-group">
    <label for="email">Email address:</label> <input type="email"
    class="form-control" id="remail" placeholder="Enter Email"
    name="email">
    </div>
    <div class="form-group">
    <label for="pwd">Password:</label> <input type="password"
    class="form-control" id="rpwd" placeholder="Enter Password"
    name="pass">
    </div>
    
    <button type="button" class="btn btn-primary" id="rgbtn" style="width:
    100%;">Submit</button>
    <div style="width: 100%;">
    <div style="width: 40%; float: left;">
    <hr>
    </div>
    <div
    style="width: 20%; float: left; text-align: center; line-height: 40px;">
    <b>OR</b>
    </div>
    <div style="width: 40%; float: right;">
    <hr>
    </div>
    </div>
    <button type="button" class="btn btn-primary" id="logbtn"
    style="width: 100%;">For existence user click here</button>
    <br> <br>
    <%-- </form> --%>
    </div>
    
    <div class="col-sm-1"></div>
    </div>
    
    </body>