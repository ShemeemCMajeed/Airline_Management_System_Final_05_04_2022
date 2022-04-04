<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
<link rel="stylesheet" href="homestyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style type="text/css">
	.banner {
	height: 100vh;
}
	.container {
	  width: 550px;
	}
    button {
	background-color: blue;
	border: 2px solid #8e44ad;
	border-radius: 4px;
	color: #fff;
	display: block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	margin-top: 20px;
	width: 100%;
}
table {
  background: white;
  margin-left: auto;
  margin-right: auto;
}
td,th {
 border: 3px solid black;
 
}
th {
 background: lightblue;
}
td {
height: 65px;
}
.form-control {
 height: 100px;
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
					<li class="nav-item"><a class="nav-link" href="homeafterlogin.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="aboutusafterlogin.jsp">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="contactusafterlogin.jsp">Contact Us</a></li>
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
<div>
<h2 style="text-align: center;color: blue;background: white">Ticket is Successfully Booked</h2>
</div>
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