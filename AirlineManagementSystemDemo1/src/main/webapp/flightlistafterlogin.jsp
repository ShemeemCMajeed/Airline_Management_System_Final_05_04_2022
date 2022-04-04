<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="flightlist.FlightList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	height: 115vh;
	background-image: url("images/preview.jpg");
	background-size: cover;
	background-position: center;
}

table {
	background: white;
	margin-left: auto;
	margin-right: auto;
}

td, th {
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
					<li class="nav-item"><a class="nav-link"
						href="homeafterlogin.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="aboutusafterlogin.jsp">About Us</a></li>
					<li class="nav-item"><a class="nav-link"
						href="contactusafterlogin.jsp">Contact Us</a></li>
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
		</nav>
		<br>
		<%
		String departureairport = request.getParameter("departureairport");
		String arrivalairport = request.getParameter("arrivalairport");
		String departuredate = request.getParameter("departuredate");
		String travelclass = request.getParameter("travelclass");
		Connection con = null;
		List<FlightList> list = new ArrayList<FlightList>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system", "root", "");
			PreparedStatement ps = con.prepareStatement("select * from flight where departureairport='" + departureairport
			+ "' and arrivalairport='" + arrivalairport + "' and departuredate='" + departuredate
			+ "' and travelclass='" + travelclass + "' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FlightList u = new FlightList();
				u.setId(rs.getInt("id"));
				u.setFlightno(rs.getString("flightno"));
				u.setAirlinename(rs.getString("airlinename"));
				u.setDepartureairport(rs.getString("departureairport"));
				u.setDeparturedate(rs.getString("departuredate"));
				u.setDeparturetime(rs.getString("departuretime"));
				u.setArrivalairport(rs.getString("arrivalairport"));
				u.setArrivaltime(rs.getString("arrivaltime"));
				u.setTravelclass(rs.getString("travelclass"));
				u.setCapacity(rs.getString("capacity"));
				u.setPrice(rs.getString("price"));

				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		%>
		<%@page import="flightlist.*,java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%
		request.setAttribute("list", list);
		%>
		<div class="header">
			<h2>Search Result:</h2>
		</div>
		<form action="">
			<table border="3">
				<tr>
					<th style="width: 50px">Id</th>
					<th style="width: 125px">Flight No</th>
					<th style="width: 150px">Aircraft Name</th>
					<th>Departure<br>Date
					</th>
					<th style="width: 150px">Departure City</th>
					<th>Departure<br>Time
					</th>
					<th style="width: 150px">Arrival City</th>
					<th style="width: 90px">Arrival<br>Time
					</th>
					<th>Travel Class</th>
					<th style="width: 100px">Capacity</th>
					<th style="width: 110px">Price</th>
					<th style="width: 100px">Remain<br>Seats
					</th>
					<th style="width: 100px"></th>
				</tr>
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getId()}</td>
						<td>${u.getFlightno()}</td>
						<td>${u.getAirlinename()}</td>
						<td>${u.getDeparturedate()}</td>
						<td>${u.getDepartureairport()}</td>
						<td>${u.getDeparturetime()}</td>
						<td>${u.getArrivalairport()}</td>
						<td>${u.getArrivaltime()}</td>
						<td>${u.getTravelclass()}</td>
						<td>${u.getCapacity()} seats</td>
						<td>${u.getPrice()} Rs</td>
						<td>${u.getCapacity()} seats</td>
						<td><a href="payment.jsp?id=${u.getId()}" style="font-size: 30px">Book</a></td>
					</tr>
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