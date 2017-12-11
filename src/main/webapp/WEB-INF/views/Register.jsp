<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


<div class="container">
<h1>Registration Form</h1>
<div class="col-lg-12">
<div class=" row">
<form:form modelAttribute="user" action="saveRegister" method="post">
<div class="col-lg-12">

 <div class="form-group">
<form:errors path="email" cssClass="err"/><br>
<label>Email:</label><br>
<form:input path="email" placeholder="Enter Mail Id..." class="form-control"/></div>


<div class="form-group">
<form:errors path="name" cssClass="err"/><br>
<label>Name:</label><br>
<form:input path="name" placeholder="Enter Name..." class="form-control"/></div>

<div class="form-group">
<form:errors path="password" cssClass="err"/><br>
<label>Password:</label><br>
<form:input path="password" placeholder="Enter Password..." class="form-control"/></div>

<div class="form-group">
<form:errors path="city" cssClass="err"/><br>
<label>City:</label><br>
<form:input path="city" placeholder="Enter City..." class="form-control"/></div>



<div class="form-group">
<form:errors path="phone" cssClass="err"/><br>
<label>Phone:</label><br>
<form:input path="phone" placeholder="Enter Phone Number..." class="form-control"/></div>

<button type="submit" class="btn btn -lg btn-info">Submit</button>
<button type="reset" class="btn btn -lg btn-info">Cancel</button>
</div>
 
</form:form>
</div>
 </div>
</div>
</body>
</html>


