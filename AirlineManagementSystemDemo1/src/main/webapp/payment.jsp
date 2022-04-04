<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="homestyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
	function checkInputs() {
		var cardno = document.getElementById('cardno');
		var cardname = document.getElementById('cardname');
		var month = document.getElementById('month');
		var year = document.getElementById('year');
		var cvv = document.getElementById('cvv');
		let c = 0;
		let crdname = 0;
		let m = 0;
		let y = 0;
		let cvvno = 0;
		if (cardno.value === '') {
			setErrorFor(cardno, 'Please enter the card no');
			c = 0;
		} else if (!isCardno(cardno.value)) {
			setErrorFor(cardno, 'Invalid card no');
			c = 0;
		} else {
			setSuccessFor(cardno);
			c = 1;
		}
		if (cardname.value === '') {
			setErrorFor(cardname, 'Please enter the card holder name');
			crdname = 0;

		} else if (!isCardname(cardname.value)) {
			setErrorFor(cardname, 'Card holder name contains only alphabets');
			crdname = 0;
		} else {
			setSuccessFor(cardname);
			crdname = 1;
		}
		if (month.value === '') {
			setErrorFor(month, 'Please enter the month expiry');
			m = 0;

		} else if (!isMonth(month.value)) {
			setErrorFor(month, 'Invalid month');
			m = 0;
		} else {
			setSuccessFor(month);
			m = 1;
		}
		if (year.value === '') {
			setErrorFor(year, 'Please enter the year expiry');
			y = 0;

		} else if (!isYear(year.value)) {
			setErrorFor(year, 'Invalid year');
			y = 0;
		} else {
			setSuccessFor(year);
			y = 1;
		}
		if (cvv.value === '') {
			setErrorFor(cvv, 'Please enter the cvv no');
			cvvno = 0;

		} else if (!isCvv(cvv.value)) {
			setErrorFor(cvv, 'Invalid cvv no');
			cvvno = 0;
		} else {
			setSuccessFor(cvv);
			cvvno = 1;
		}
		if (c == 1 && crdname == 1 && m == 1 && y == 1 && cvvno == 1) {
			var result = confirm('Are you sure want to book?');
			if (result == false) {
				event.preventDefault();
			}
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
	function isCardno(cardno) {
		return /^4[0-9]{12}(?:[0-9]{3})?$/.test(cardno);
	}
	function isCardname(cardname) {
		return /^[A-Za-z ]{3,20}$/.test(cardname);
	}
	function isMonth(month) {
		return /^(1[0-2]|[1-9])$/.test(month);
	}
	function isYear(year) {
		return /^([2][0][2-9][2-9])$/.test(year);
	}
	function isCvv(cvv) {
		return /^[0-9]{3}$/.test(cvv);
	}
</script>
<style type="text/css">
.banner {
	height: 165vh;
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

td, th {
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
		<%@page import="flightlist.FlightlistDao, flightlist.FlightList"%>

		<%
		String id = request.getParameter("id");
		FlightList u = FlightlistDao.getRecordById(Integer.parseInt(id));
		%>
		
			<h2 style="margin-left: 19%">Confirm Detail</h2>
			
			<form action="">
				<input type="hidden" name="id" value="<%=u.getId()%>" />
				<table border="3">
					<tr>
						<th style="width: 125px">Flight No</th>
						<th style="width: 150px">Aircraft Name</th>
						<th>Departure<br>Date
						</th>
						<th style="width: 150px">Departure Airport</th>
						<th>Departure<br>Time
						</th>
						<th style="width: 150px">Arrival Airport</th>
						<th style="width: 90px">Arrival<br>Time
						</th>
						<th style="width: 110px">Price</th>
					</tr>
					<tr>
						<td><%= u.getFlightno()%></td>
						<td><%= u.getAirlinename()%></td>
						<td><%= u.getDeparturedate()%></td>
						<td><%= u.getDepartureairport()%></td>
						<td><%= u.getDeparturetime()%></td>
						<td><%= u.getArrivalairport()%></td>
						<td><%= u.getArrivaltime()%></td>
						<td><%= u.getPrice()%> Rs</td>
					</tr>
				</table>
			</form>
		<br>
		<div class="container">
			<div class="header">
				<h2>Payment</h2>
			</div>
			<form class="form" id="form" name="myForm"
				onsubmit="return checkInputs()" action="success.jsp">
				<div class="form-control">
					<label for="cardno">Card No</label><br> <input
						style="width: 100%" type="text" placeholder="Enter Card No"
						id="cardno" maxlength="16" /><br> <small>Error
						message</small>
				</div>
				<div class="form-control">
					<label for="cardname">Card Holder Name</label><br> <input
						style="width: 100%" type="text"
						placeholder="Enter Card Holder Name" id="cardname" /><br> <small>Error
						message</small>
				</div>
				<div class="form-control">
					<label for="month">Expiry Month</label><br> <input
						style="width: 100%" type="text" placeholder="MM" id="month"
						maxlength="2" /><br> <small>Error message</small>
				</div>
				<div class="form-control">
					<label for="year">Expiry Year</label><br> <input
						style="width: 100%" type="text" placeholder="YYYY" id="year"
						maxlength="4" /><br> <small>Error message</small>
				</div>
				<div class="form-control">
					<label for="cvv">CVV No</label><br> <input style="width: 100%"
						type="text" placeholder="Enter your CVV No" id="cvv" maxlength="3" /><br>
					<small>Error message</small>
				</div>
				<input type="submit" value="Payment and Book"> <a
					href="homeafterlogin.jsp"
					style="color: blue; font-size: 30px; margin-left: 38%">Cancel</a>
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