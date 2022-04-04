<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Airline</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="homestyle.css">
	<style type="text/css">
	.banner {
	height: 100vh;
}
.container {
	height: 325px;
}
	</style>
	<script type="text/javascript">
	function checkInputs() {
		var airlinecode = document.getElementById('airlinecode');
		var airlinename = document.getElementById('airlinename');
		let ac=0;
		let an=0;
		if(airlinecode.value === '') {
			setErrorFor(airlinecode, 'Please enter the airline code');
			ac=0;
			
		}
		else if (!isAirlinecode(airlinecode.value)) {
			setErrorFor(airlinecode, 'Airline code contains three numbers between 100 to 999');
			ac=0;
		}else {
			setSuccessFor(airlinecode);
			ac=1;
		}
		if(airlinename.value === '') {
			setErrorFor(airlinename, 'Please enter the airline name');
			an=0;
			
		}
		else if (!isAirlinename(airlinename.value)) {
			setErrorFor(airlinename, 'Airline name contains only alphabets');
			an=0;
		}else {
			setSuccessFor(airlinename);
			an=1;
		}
		if(ac==1&&an==1) {
			return true;
		}
		else
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
	function isAirlinecode(airlinecode) {
		return /^([1-9][0-9][0-9])$/.test(airlinecode);
		}
	function isAirlinename(airlinename) {
		  return /^[A-Za-z ]{3,100}$/.test(airlinename);
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
<div class="container">
<form action="Airline" method="post" class="form" id="form" name="myForm" onsubmit="return checkInputs()">
		<div class="form-control">
			<label for="airlinecode">Airline Code</label><br>
			<input style="width: 100%" type="text" placeholder="Enter Airline Code" id="airlinecode" maxlength="3" name="airlinecode" /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<label for="airlinename">Airline Name</label><br>
			<input style="width: 100%" type="text" placeholder="Enter Airline Name" id="airlinename" name="airlinename" /><br>
			<small>Error message</small>
		</div>
		<input type="submit" value="Add Airline">
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