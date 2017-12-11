<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="container">
<div class="row">
<div class="col-sm-6 item-photo">
<img style="max-width:100%; margin-top:30px;"src="${pageContext.request.contextPath}/resources/${product.imgname}"> 
</div>
<div class="col-md-6" style="border:0px solid gray">


<h2><label>${product.pname}</label></h2>
<h3>${product.description}</h3>
<h4>Price-${product.price} </h4>
<h5>Supplier:${product.supplierdetails.sname}</h5>

<div class="section" style="padding-botom:20 px;">
<form action="${pageContext.request.contextPath}/addToCart" method="post"><br>
<input type="hidden" value="${product.id }" name="pid">
<input type="hidden" value="${product.description}" name="pDescription">
<input type="hidden" value="${product.price}" name="pPrice">
<input type="hidden" value="${product.pname }" name="pName">


<input type="hidden" value="${product.imgname }" name="pImg">
<input type="number" class="form-control" name="pQty" required/><br>
<input class ="btn btn-primary btn-lg" type="submit" value="Add To Cart">
</form>

<h5><span class="glyphicon glyphicon-heart-empty" style="cursor:pointer" >Wish List</span></h5>


</div>
</div>

<div class="col-xs-9">
<ul class="menu-items">
<li>Details of the product</li>

</ul>
</div>

<hr><br><hr>
<p>All our products are ISO:9001:2007 certified.</p>



</div>
</div>
</body>
</html>