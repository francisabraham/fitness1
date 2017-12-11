<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
   
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
<style>
.outer,  .inner{ display:block;}

.inner{
padding:10px;
margin:10px 0px;
background-colour:#f2f2f2;
width:70%;
font-family:sans-serif;;
}


.head{
background-colour:#cc3333;
height:40px;
width:100%;
margin:0 0 20px 0;
border-radius:5px;
font-family:Gotham;
padding-left:10px
colour:white;
}

.myText{}

</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include> 
<br>


<div class="container">
<div class="row">
<div class="col-xs-6 jumbotron">
<div class="head">
<h2><p class="myText">Customer Details</p></h2>
</div>

<div class="outer">
<div class="well" style="width:100%">
<form class="form-horizontal" action="${pageContext.request.contextPath}/invoiceprocess"  method="post">
<c:set var="gtot" value="0"></c:set>
<c:forEach var="c"  items="${cart }">
<c:set var="gtot" value="${gtot+c.cartPrice*c.cartQuantity }"></c:set>
</c:forEach>

<div class="well">
<table>
<tr><td colspan="3">NAME:</td><td>${user.name}</td></tr>
<tr><td colspan="3">EMAIL:</td><td>${user.email}</td></tr>
<tr><td colspan="3">PHONE:</td><td>${user.phone}</td></tr>
<tr><td colspan="3">ADDRESS:</td><td>${user.city}</td></tr>
<tr><td colspan="3">AMOUNT:</td><td>${gtot}</td></tr>

</table>
</div>


<input type="hidden" name="total" value="${gtot }">

<div class="well">
<label><b>Payment Options</b></label>
<select name="payment">


<option value="COD">Cash On Delivery</option>
<option value="Netbanking">Net Banking</option>

</select>
</div><br>

<div><br></div>



<div style="margin-top:10px">
<h3><strong>Enter Card Details </strong></h3>
</div>

<div class="form-group">

<label> Card Number</label><br>
 <input type="number"  name="cardnum" placeholder="Enter Debit/Card card number" class="form-control"/> </div>

<div class="form-group">
<label> Name</label><br>
<input type="text" name="username"  placeholder="Enter name on card" class="form-control"></div>


<div class="form-group">
<label> CVV</label><br>
<input type="password" name="cvv"  placeholder="Enter CVV" class="form-control"></div>

<div class="form-group">
<label> Expiry</label><br>
<input type="number" min="2017" max="3000" name="year" placeholder="YY"  class="form-control"><input type="number" min="1" max="12" name="month" placeholder="MM"  class="form-control">
<!-- <input type="number" min="1" max="31" name="date" placeholder="DD"> -->
</div>



<!-- <th> Card Number</th>
<input type="text" name="cardnum" placeholder="Enter Debit/Card card number" style="width:75%"><br>
<th>Name</th><br>
<input type="text" name="username" placeholder="Enter name on card" style= "width:75%"><br>
<th>CVV</th> <br>
<input type="password" name="cvv"><br></th>


<th>Expiry</th><br>
<input type="number" min="2017" max="3000" name="year" placeholder="YY"><input type="number" min="1" max="12" name="month" placeholder="MM"><input type="number" min="1" max="31" name="date" placeholder="DD">
 -->


<input type="submit" value="PLACE ORDER"  style="width:75%;font-size:20px;" class="btn btn-success btn-info">
</form>
</div>
</div>
</div>
</div>


</div>
<div><br></div>
</body>
</html>