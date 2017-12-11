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
<title>Adding</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="container">
<div class="page-header">
</div>
<br>

<div class="container">
<div class="row">
<div class="col-md-9">
<div class="panel with-nav-tabs panel primary">
<div class="panel-heading">
<ul class="nav nav-tabs">
<li class="active"><a href="#tab1Prime" data-toggle="tab">Category</a></li>
<li><a href="#tab2Prime" data-toggle="tab">Supplier</a></li>
<li><a href="#tab3Prime" data-toggle="tab">Product</a></li>
</ul>
</div>


<div class="panel-body">
<div class="tab-content">
<div class="tab-pane fade in active" id="tab1Prime">
<form action="<c:url value="/admin/saveCat"/>" method="post">
<span id="reauth-email" class="reuth-email"></span>
<h4><label>Category ID</label></h4>
<input class="form-control" type="number" name="cid" required/>

<h4><label>Category Name</label></h4>
<input class="form-control" type="text" name="cname" required/>
<button class="btn btn-lg btn-primary" type="submit">OK</button>

<button class="btn btn-lg btn-primary" type="reset">CANCEL</button>
</form>
</div>

<div class="tab-pane fade" id="tab2Prime">
<form action="<c:url value="/admin/saveSupp"/>" method="post">
<span id="reauth-email" class="reuth-email"></span>
<h4><label>Supplier ID</label></h4>
<input class="form-control" type="number" name="sid" required/>
<h4><label>Supplier Name</label></h4>
<input class="form-control" type="text" name="sname" required/>
<button class="btn btn-lg btn-primary" type="submit">OK</button>
<button class="btn btn-lg btn-primary" type="reset">CANCEL</button>
</form>
</div>

<div class="tab-pane fade" id="tab3Prime">
<form action="<c:url value="/admin/saveProd"/>" class="form-signin" enctype="multipart/form-data" method="post">
<span id="reauth-email" class="reuth-email"></span>
<h4><label>Product Name</label></h4>
<input class="form-control" type="text" name="pName" required/>
<br>
<h4><label>Product Price</label></h4>
<input class="form-control" type="number" name="pPrice" required/>
<br>
<h4><label>Product Description</label></h4>
<input class="form-control" type="text" name="pDescription" required/>
<br>
<h4><label>Product Stock</label></h4>
<input class="form-control" type="number" name="pStock" required/>
<br>
<div class="form-group">
<td><h4><label>Select Category</label></h4></td>
<td><select class="form-control" name="pCategory">
<option value="">-----Category-----</option>
<c:forEach items="${catList}" var="c">
<option value="${c.cid }">${c.cname }</option>
</c:forEach>
</select>
</div>
<br>


<div class="form-group">
<td><h4><label>Select Supplier</label></h4></td>
<td><select class="form-control" name="pSupplier">
<option value="">-----Select Supplier-----</option>
<c:forEach items="${supList}" var="c">
<option value="${c.sid }">${c.sname }</option>
</c:forEach>
</select>
</div>
<br><br>

<div class="fileinput fileinput-new" data-provides="fileinput">
<h4><Label>Image</Label></h4>
<input class="form-control" type="file" name="file" accept="image/*">
</div>

<button class="btn btn-lg btn-primary" type="submit">OK</button>
<button class="btn btn-lg btn-primary" type="reset">CANCEL</button>
</form>
</div>





</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>