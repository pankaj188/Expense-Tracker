<head>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
    rel="stylesheet">
    <script
    
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    
    $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("table tbody .tr").filter(function() {
    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
    });
    
    var id;
    $("table tbody .tr td").click(function() {
    var text = $(this).find("button").text();
    
    if (text == "") {
    
    } else {
    id= $(this).closest(".tr").find('td.id')
    .text();
    
    var name = $(this).closest(".tr").find('td.name')
    .text();
    
    var price = $(this).closest(".tr").find('td.price')
    .text();
    
    var quantity = $(this).closest(".tr").find(
    'td.quantity').text();
    
    var date = $(this).closest(".tr").find('td.date')
    .text();
    
    if (text == "Edit") {
    $("#pname").val(name);
    $("#pprice").val(price);
    $("#pquantity").val(quantity);
    $("#pdate").val(date);
    $('#myModal1').modal('show');
    
    } else {
    /* $('#myModal2').modal('show'); */
    if (confirm("Are you sure you want to delete this expense?")) {
    $.post("delete/"+ id,{},function(response) {
    location.reload();
    });
    } else {
    return false;
    }
    }
    }
    
    });
    
    $("#updbutton").click(function(){
    
    var name=$("#pname").val();
    var price=$("#pprice").val();
    var quantity=$("#pquantity").val();
    var date=$("#pdate").val();
    
    if(name==""){
    alert("please enter product name");
    $("#pname").focus().css("border-color","red");
    }else if(price==""){
    alert("please enter product price");
    $("#pprice").focus().css("border-color","red");
    }else if(quantity==""){
    alert("please enter product quantity");
    $("#pquantity").focus().css("border-color","red");
    }else if(date==""){
    alert("please select product purchasing date");
    $("#pdate").focus().css("border-color","red");
    }else{
    $.post("update",{
    id:id,
    name:name,
    price:price,
    quantity:quantity,
    date:date,
    },function(response){
    location.reload();
    $('#myModal1').modal('hide');
    });
    }
    
    });
    
    });
    </script>
    
    </head>
    
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@include file="head.jsp"%>
    <div class="container-fluid" align="center">
    <div
    style="width: 85%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;height: 85vh;">
    <div class="row">
    
    <div class="col-sm-4">
    <h1 align="center">List of Expenses</h1>
    </div>
    <div class="col-sm-4"></div>
    <div class="col-sm-4">
    <div class="form-group">
    <div align="center"
    style="display: flex; align-items: center; border: 1px lightgray solid; border-radius: 5px; margin-right: 10px;
    margin-left: 10px; margin-top: 20px;">
    <input type="text" class="form-control" style="border: 0;"
    id="search" name="search"
    placeholder="Search Expenses"><span
    class="material-icons"> search </span>
    </div>
    </div>
    
    </div>
    </div>
    <hr>
    
    <div class="row">
    
    <div class="col-sm-10">
    
    <div class="container" style="width: 90%;">
    
    <p:choose>
    <p:when test="${requestScope.exp.size() gt 0}">
    
    <table class="table table-hover">
    <thead>
    <tr>
    <th>ID</th>
    <th>NAME</th>
    <th>PRICE</th>
    <th>QUANTITY</th>
    <th>DATE</th>
    <th>Edit</th>
    <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    
    <p:forEach items="${requestScope.exp}" var="product">
    
    <tr class="tr">
    <td class="id">${product.id}</td>
    <td class="name">${product.name}</td>
    <td class="price">${product.price}</td>
    <td class="quantity">${product.quantity}</td>
    <td class="date">${product.date}</td>
    <td><button class="btn btn-primary">Edit</button></td>
    <td>
    <button class="btn btn-danger">Delete</button>
    </td>
    </tr>
    
    
    
    
    </p:forEach>
    </tbody>
    </table>
    
    </p:when>
    
    <p:otherwise>
    <h1 align="center">There is no Expense!!</h1>
    </p:otherwise>
    
    </p:choose>
    
    </div>
    
    
    </div>
    </div>
    
    </div>
    
    <!-- Edit Modal -->
    
    <div id="myModal1" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
    
    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
    <h1 class="modal-title">Edit Expense</h1>
    </div>
    <div class="modal-body" align="left">
    <div class="row">
    <div class="col-sm-6">
    <div class="form-group">
    <label for="email">Product Name:</label> <input type="text"
    class="form-control" id="pname" placeholder="Product Name">
    </div>
    <div class="form-group">
    <label for="pwd">Product Price:</label> <input type="number"
    class="form-control" id="pprice" placeholder="Product Price">
    </div>
    </div>
    
    
    <div class="col-sm-6">
    <div class="form-group">
    <label for="email">Product Quantity:</label> <input
    type="number" class="form-control" id="pquantity"
    placeholder="Product Quantity">
    </div>
    <div class="form-group">
    <label for="email">Purchase Date:</label> <input type="date"
    class="form-control" id="pdate">
    </div>
    </div>
    
    <div align="center">
    <button type="submit" class="btn btn-primary" style="width: 60%;"
    id="updbutton">Update
    Expense</button>
    </div>
    
    </div>
    
    </div>
    
    </div>
    </div>
    
    </div>
    </div>
    
    <br>
    <%@include file="foot.jsp"%>