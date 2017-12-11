<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="jquery/jquery-3.2.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<nav id="navbar-red" class="navbar navbar-inverse navbar-static-top" role="navigation">
<div class="container">
<ul class="nav navbar-nav">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-1">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</ul>
</div>
<div class="collapse navbar-collapse" id="bs-example-navbar-1">
<ul class="nav navbar-nav">
<li><a href="<c:url value="/"/>"><i class="fa fa-home" aria-hidden="true"></i>Home </a></li>
<li><a href="${pageContext.request.contextPath}/admin/adding">Admin</a></li>
<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin List <span class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href="${pageContext.request.contextPath}/admin/custList">Customers</a></li>

<li><a href="${pageContext.request.contextPath}/admin/supList">Supplier</a></li>
<li><a href="${pageContext.request.contextPath}/admin/productList">Product</a></li>
<li><a href="${pageContext.request.contextPath}/admin/categoryList">Category</a></li>
</ul>


<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
<ul class="dropdown-menu">
<c:forEach var="catVal" items="${catList}">
<li><a href="${pageContext.request.contextPath}/prodCustList?cid=${catVal.cid}">${catVal.cname}</a></li>
</c:forEach>
</ul>
</li>


<ul class="nav navbar-nav navbar right">
<c:if test="${pageContext.request.userPrincipal.name==null }">
<li><a href="${pageContext.request.contextPath}/Register"><i class="fa fa-user" aria-hidden="true"></i>Register</a></li>
<li><a href="${pageContext.request.contextPath}/login"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a></li>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name!=null }">
<li><a>Welcome:${pageContext.request.userPrincipal.name}</a></li>
<li><a href="<c:url value="/logout"/>">Logout</a></li>
<li><a href="${pageContext.request.contextPath}/goToCart">My Cart<i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
</c:if>
</ul>

</ul>


</div>
</nav>
</body>
</html>
