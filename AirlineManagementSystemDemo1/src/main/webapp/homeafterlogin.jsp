<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%
	if(session.getAttribute("username")==null) {
		response.sendRedirect("home.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="stylesheet" href="homestyle.css">
	<style type="text/css">
	.banner {
		height: 105vh;
	}
	</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$("input[name='check']").click(function() {
			if ($("#roundtrip").is(":checked")) {
				$("#returning").removeAttr("disabled");
			} else {
				$("#returning").attr("disabled", "disabled");
			}
		});
	});
</script>
<script type="text/javascript">
	function checkInputs() {
		var type = document.forms["myForm"]["check"];
		var departureairport = document.getElementById('departureairport');
		var arrivalairport = document.getElementById('arrivalairport');
		var departuredate = document.forms["myForm"]["departuredate"];
		let t = 0;
		let ft = 0;
		let d = 0;
		if (type[0].checked == false && type[1].checked == false) {
			document.getElementById('checkid').innerHTML = "Please select a travel type";
			t = 0;
		} else {
			document.getElementById('checkid').innerHTML = " ";
			t = 1;
		}
		if (arrivalairport.value == departureairport.value) {
			setErrorFor(arrivalairport, 'Departure and Arrival cant be same');
			ft = 0;

		} else {
			setSuccessFor(arrivalairport);
			ft = 1;
		}
		if (departuredate.value === '') {
			setErrorFor(departuredate, 'Please enter departing date');
			d = 0;

		} else {
			setSuccessFor(departuredate);
			d = 1;

		}
		if (t == 1&& ft == 1 && d == 1 && r == 1) {
			return true;
		} else
			return false;
	}
	function setErrorFor(input, message) {
		var formControl = input.parentElement;
		var small = formControl.querySelector('small');
		formControl.className = 'form-control error';
		small.innerText = message;
	}

	function setSuccessFor(input) {
		var formControl = input.parentElement;
		formControl.className = 'form-control success';
	}
</script>
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
					<li class="nav-item"><a class="nav-link" href="mybookings.jsp">My Bookings</a></li>
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
		<div class="container">
			<form action="flightlistafterlogin.jsp" method="post" class="form" id="form"
				name="myForm" onsubmit="return checkInputs()">
				<div class="form-control">
					<label for="roundtrip"><input type="radio" class="btn"
						name="check" id="roundtrip" value="Roundtrip"> Roundtrip</label> <label
						for="oneway"><input type="radio" class="btn" name="check"
						id="oneway" value="Oneway"> Oneway</label><br> <span
						id="checkid" style="color: red"></span>
				</div>
				<div class="form-control">
					<label for="departureairport">Flying From</label><br> 
					<select
						style="width: 100%; height: 30px" name="departureairport"
						id="departureairport">
						<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system", "root", "");
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery("select * from airport");
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("airportname")%>"><%=rs.getString("airportname")%></option>
						<%
						}
						} catch (Exception ex) {
						ex.printStackTrace();
						out.println("Error " + ex.getMessage());
						}
						%>
					</select><br>
					
				</div>
				<div class="form-control">
					<label for="arrivalairport">Flying To</label><br>
					<select
						style="width: 100%; height: 30px" name="arrivalairport"
						id="arrivalairport">
						<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system", "root", "");
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery("select * from airport");
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("airportname")%>"><%=rs.getString("airportname")%></option>
						<%
						}
						} catch (Exception ex) {
						ex.printStackTrace();
						out.println("Error " + ex.getMessage());
						}
						%>
					</select><br>
					<small>Error message</small>
				</div>
				<div class="form-control">
					<label for="departing">Departing</label><br> <input
						style="width: 100%" type="date" id="departuredate" name="departuredate" min='2022-04-05' /><br>
					<small>Error message</small>
				</div>
				<div class="form-control">
					<label for="returning">Returning</label><br> <input
						style="width: 100%" type="date" id="returning" name="returning"
						disabled="disabled" min='2022-04-05' /><br> <small>Error message</small>
				</div>
				<div class="form-control">
					<label for="travelclass">Travel Class</label> <select id="travelclass" name="travelclass">
						<option value="Economy">Economy Class</option>
						<option value="Business">Business Class</option>
					</select> <br>
					<small>Error message</small>
				</div>
				<input type="submit" value="Show Flights">
			</form>
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