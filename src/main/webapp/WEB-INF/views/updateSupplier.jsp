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
<script src="jquery/jquery-3.2.1.js"></script>
<%@ page isELIgnored="false" %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/nav">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<div class="container">
<form method="post" action="<c:url value="/admin/updateSupplier"/>" class="form-signin">
<span id="reauth-email" class="reauth-email"></span>
<h4 class="input_title">Supplier ID</h4>
<input class="form-control" type="number" name="sid" value="${c.sid }" required>

<h4 class="input_title">Supplier Name</h4>
<input class="form-control" type="text" name="cname" value="${c.sname }" required>

<button class="btn btn-lg btn-primary" type="submit">Update</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>

</form>

</div>



</body>
</html>