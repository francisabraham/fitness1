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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<div class="container">
<form action="${pageContext.request.contextPath}/ack" method="post">
<c:set var="gtot" value="0"></c:set>
<c:forEach var="c"  items="${cart }">
<c:set var="gtot" value="${gtot+c.cartPrice*c.cartQuantity }"></c:set>
<br>
</c:forEach>


<div class="well">
<table>
<tr><td colspan="3"><b>NAME:</b></td><td>${orderDetails.name}</td></tr>
<tr><td colspan="3"><b>EMAIL:</b></td><td>${orderDetails.email}</td></tr>
<tr><td colspan="3"><b>PHONE:</b></td><td>${orderDetails.phone}</td></tr>
<tr><td colspan="3"><b>CUSTOMER ADDRESS:</b></td><td>${orderDetails.city}</td></tr>
<tr><td colspan="3"><b>TOTAL AMOUNT:</b></td><td>${gtot}</td></tr>
<%-- <tr><td colspan="3"><b>TOTAL QUANTITY:</b></td><td>${pqty.cartQuantity}</td></tr> --%>

</table>
</div>
<input type="submit" value="OK"  style="width:75%;font-size:20px;" class="btn btn-success btn-info">
</form>
</div>


</body>
</html>