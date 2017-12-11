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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<div class="col-lg-12">
<div class=" row">
<form action="<c:url value="/admin/productUpdate"/>" class="form-signin" enctype="multipart/form-data" method="post">
<span id="reauth-email" class="reuth-email"></span>
<%-- <label>Product Name</label>
<input class="form-control" type="text" name="pName" value="${prod.pname}" required/>
<br>
 --%>
  <label>Product Id</label>
<input class="form-control" type="number" name="id" value="${prod.id}" required/>
<br>
 <label>Product Price</label>
<input class="form-control" type="number" name="pPrice" value="${prod.price}" required/>
<br>
<label>Product Description</label>
<input  class="form-control" type="text" name="pDescription" value="${prod.description}" required/>
<br>

<label>Product Stock</label>
<input class="form-control" type="number" name="pStock" value="${prod.stock}" required/>

<br>

<%-- <label>Product Category</label>
<select class="form-control"  name="pCategory">
<option value="">-----Select Category-----</option>
<c:forEach items="${catList}" var="c">
<option value="${c.cid }">${c.cname }</option></c:forEach>
</select><br>
<label>Product Supplier</label>
<select class="form-control" name="pSupplier">
<option value="">-----Select Supplier-----</option>
<c:forEach items="${supList}" var="s">
<option value="${s.sid }">${s.sname }</option>
</c:forEach>
</select>
<br>
 --%>
<!-- <td>Image</td><br>
<td><input class="form-control" type="file" name="file"/></td> -->


<button class="btn btn-lg btn-primary" type="submit">Update</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>
</form>
</div>
</div>
</div>



</body>
</html>