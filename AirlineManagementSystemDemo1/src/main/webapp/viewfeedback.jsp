<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Feedback</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style type="text/css">
* {
	padding: 0;
	margin: 0;
	text-decoration: none;
	list-style: none;
	box-sizing: border-box;
}
body {
	font-family: montserrat;
}
nav ul li a {
	color: white;
	font-size: 17px;
	padding: 7px 13px;
	border-radius: 3px;
	text-transform: uppercase;
}
.banner {
	width: 100%;
	height: 100vh;
	background-image:  url("images/preview.jpg");
	background-size: cover;
	background-position: center;
}
table {
  background: white;
  margin-left: auto;
  margin-right: auto;
}
td,th {
 height: 65px;
 border: 3px solid black;
 
}
input[type="submit"] {
 font-size: 23px;
 margin-left: 8%;
 width: 80px;
  
}
h2 {
 text-align: center;
}
th {
 background: lightblue;
}
	</style>
</head>
<body>
<div class="banner">
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#collapse_target">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapse_target">
				<a class="navbar-brand" style="color: white">AirflY</a>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="admin.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="airline_add_flight.jsp">AddFlight
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="airline_flight_report.jsp">FlightReport </a></li>
					<li class="nav-item"><a class="nav-link"
						href="viewfeedback.jsp">ViewFeedback </a></li>
					<li class="nav-item"><a class="nav-link" href="airline_add_airport.jsp">AddAirport
					</a></li>
					<li class="nav-item"><a class="nav-link" href="airline_add_airline.jsp">AddAirlines
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						data-target="dropdown_target" href="#"> <%
 out.print("Hi, " + session.getAttribute("username"));
 %> <span class="caret"></span>
					</a>
						<div class="dropdown-menu" aria-labelledby="dropdown_target">
							<a class="dropdown-item" href="logout">LogOut</a>
						</div></li>
				</ul>
			</div>
		</nav><br>
		<%@page import="contactus.ContactusDao,contactus.*,java.util.*"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<h1 style="margin-left: 100px">Feedback List</h1> 
<%  
List<ContactUs> list=ContactusDao.getAllRecords();  
request.setAttribute("list",list);  
%>   
<form action="">
<table border="3">
<tr><th style="width: 50px">Id</th><th style="width: 250px">First Name</th><th style="width: 250px">Last Name</th><th style="width: 300px">Email</th><th style="width: 500px">Message</th></tr>
<c:forEach items="${list}" var="u">
<tr><td>${u.getId()}</td><td>${u.getFirstname()}</td><td>${u.getLastname()}</td><td>${u.getEmail()}</td><td>${u.getMessage()}</td></tr>
</c:forEach>
</table>
</form>


</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>