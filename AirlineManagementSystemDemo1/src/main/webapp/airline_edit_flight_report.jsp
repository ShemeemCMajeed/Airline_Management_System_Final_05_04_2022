<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Flight</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="homestyle.css">
	<style type="text/css">
	.banner {
	height: 205vh;
	}
	</style>
	<script type="text/javascript">
	function checkInputs() {
	var flightno = document.getElementById('flightno');
	var departureairport = document.getElementById('departureairport');
	var departuredate = document.getElementById('departuredate');
	var departuretime = document.getElementById('departuretime');
	var arrivalairport = document.getElementById('arrivalairport');
	var arrivaltime = document.getElementById('arrivaltime');
	var capacity = document.getElementById('capacity');
	var price = document.getElementById('price');
	let f=0;
	let departurdate=0;
	let departurtime=0;
	let arivalairport=0;
	let arivaltime=0;
	let capacty=0;
	let prce=0;
	if(flightno.value === '') {
		setErrorFor(flightno, 'Please enter the flight no');
		f=0;
		
	}
	else if (!isFlightno(flightno.value)) {
		setErrorFor(flightno, 'Flight no contains first two capital letters and numbers');
		f=0;
	}else {
		setSuccessFor(flightno);
		f=1;
	}
	 if(departuredate.value === '') {
			setErrorFor(departuredate, 'Please enter departure date');
			departurdate=0;
			
		}  else {
			setSuccessFor(departuredate);
			departurdate=1;
			
		}
	 if(departuretime.value === '') {
			setErrorFor(departuretime, 'Please enter departure time');
			departurtime=0;
			
		}  else {
			setSuccessFor(departuretime);
			departurtime=1;
			
		}
	 if(arrivalairport.value == departureairport.value) {
			setErrorFor(arrivalairport, 'Departure and Arrival cant be same');
			arivalairport=0;
		}
	 else {
			setSuccessFor(arrivalairport);
			arivalairport=1;
		}
	 if(arrivaltime.value === '') {
			setErrorFor(arrivaltime, 'Please enter arrival time');
			arivaltime=0;
			
		}  else {
			setSuccessFor(arrivaltime);
			arivaltime=1;
			
		}
	 if (capacity.value === '') {
			setErrorFor(capacity, 'Please enter the capacity');
			capacty = 0;

		} else if (!isCapacity(capacity.value)) {
			setErrorFor(capacity, 'Maximum Capacity is 1000');
			capacty = 0;
		} else {
			setSuccessFor(capacity);
			capacty = 1;
		}
		if (price.value === '') {
			setErrorFor(price, 'Please enter the price');
			prce = 0;

		} else if (!isPrice(price.value)) {
			setErrorFor(price, 'Invalid price');
			prce = 0;
		} else {
			setSuccessFor(price);
			prce = 1;
		}
		if (f == 1 && arivalairport == 1 && departurdate == 1
				&& departurtime == 1 && arivaltime == 1 && capacty == 1
				&& prce == 1) {
		alert('Successfully Saved!');
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
	function isFlightno(flightno) {
		return /^[A-Z0-9]*$/.test(flightno);
		}
	function isCapacity(capacity) {
		return /^([1-9][0-9]{0,2}|1000)$/.test(capacity);
	}
	function isPrice(price) {
		return /^[0-9,]*$/.test(price);
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
		<%@page import="addflight.FlightDao, addflight.Flight"%>  
  
<%  
String id=request.getParameter("id");  
Flight u=FlightDao.getRecordById(Integer.parseInt(id));  
%>  
		<div class="container">  
<form action="editflight.jsp" method="post" class="form" id="form" name="myForm" onsubmit="return checkInputs()"> 
<input type="hidden" name="id" value="<%=u.getId() %>"/>
		<div class="form-control">
			<label for="flightno">Flight No</label><br>
			<input style="width: 100%" type="text" placeholder="Enter Flight No" id="flightno" name="flightno" maxlength="5" value="<%= u.getFlightno()%>" /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<label for="airlinename">Aircraft Name</label><br> <select
						style="width: 100%; height: 30px" name="airlinename"
						id="airlinename">
						<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_management_system", "root", "");
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery("select * from airline");
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("airlinename")%>"><%=rs.getString("airlinename")%></option>
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
			<label for="departureairport">Departure Airport</label><br> <select
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
			<label for="departuredate">Departure Date</label><br>
			<input style="width: 100%" type="date" placeholder="Enter Departure Date" id="departuredate" name="departuredate" min='2022-04-05' value="<%= u.getDeparturedate()%>" /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<label for="departuretime">Departure Time</label><br>
			<input style="width: 100%" type="time" placeholder="Enter Departure Time" id="departuretime" name="departuretime" value="<%= u.getDeparturetime()%>"  /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<label for="arrivalairport">Arrival Airport</label><br> <select
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
					</select><br> <small>Error message</small>
		</div>
		<div class="form-control">
			<label for="arrivaltime">Arrival Time</label><br>
			<input style="width: 100%" type="time" placeholder="Enter Arrival Time" id="arrivaltime" name="arrivaltime" value="<%= u.getArrivaltime()%>"  /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
					<label for="travelclass">Travel Class</label> <select
						style="width: 100%; height: 30px" name="travelclass"
						id="travelclass">
						<option value="Economy">Economy Class</option>
						<option value="Business">Business Class</option>
					</select> <br> <small>Error message</small>
				</div>
		<div class="form-control">
					<label for="capacity">Capacity</label><br> <input
						style="width: 100%" type="text"
						placeholder="Seats" id="capacity"
						maxlength="4" name="capacity" value="<%= u.getCapacity()%>" /><br> <small>Error
						message</small>
				</div>
				<div class="form-control">
					<label for="price">Price</label><br> <input
						style="width: 100%" type="text" placeholder="Rs"
						id="price" maxlength="7" name="price" value="<%= u.getPrice()%>" /><br> <small>Error
						message</small>
				</div>
  <input type="submit" value="Save">
  <a href="airline_flight_report.jsp" style="margin-left: 43%;font-size: 25px">Cancel</a>
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