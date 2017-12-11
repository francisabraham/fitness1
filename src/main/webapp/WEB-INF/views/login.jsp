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
<center><h3>Welcome to Login page</h3></center>
<div class="card card-container">
<h2 class='login_title text-center'>Login</h2>
<hr>
<form action="${pageContext.request.contextPath}/login" class="form-signin" method="post">
<span id="reauth-email" class="reauth-email"></span>
<h4 class="input_title">Email</h4>

<input type="text" id="inputEmail" name="username" class="login-box" required>

<h4 class="input_title">Password</h4>

<input type="password" id="inputPassword" name="password" class="login-box" required>
<button class="btn btn-lg btn-primary" type="submit">Login</button> 
<button class="btn btn-lg btn-primary" type="reset">Reset</button> 
 <a href="#">Lost your
						password?</a> <a href="Register">Register</a>
 
</form>

 
 <%-- <form action="index" method="post">
				<h1>Login Form</h1>
				<div>
					<input type="text" placeholder="Username" required id="email" name="email" 
						pattern=".{5,10}" title="minimum length for username is 5"/>
				</div>
				<div>
					<input type="password" placeholder="Password" required id="password" name="password" 
					title="Enter Valid credentials"/>
				</div>
				<div>
					<input type="submit" value="Log in" /> <a href="#">Lost your
						password?</a> <a href="Register">Register</a>
				</div>
				
			</form>
 --%> 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 </div>
</div>
 </body>
</html>