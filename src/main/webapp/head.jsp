<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <head>
            <title>Expense App</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"/>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"/>
    
        </head>
    
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Expense App</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
    
                    <p:choose>
                        <p:when test="${sessionScope.user ne null}">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="home">Home</a></li>
                                <li><a href="profile">Profile</a></li>
                                <li><a href="addexpense">Add Expense</a></li>
                                <li><a href="listofexpenses">Expense List</a></li>
                                <li><a href="logout">Logout</a></li>
                            </ul>
                        </p:when>
                    </p:choose>
    
                </div>
            </div>
        </nav>