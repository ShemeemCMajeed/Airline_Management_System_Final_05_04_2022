<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="homestyle.css">
<style type="text/css">
.form-control textarea {
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	font-family: inherit;
	font-size: 14px;
	padding: 10px;
}

.form-control textarea:focus {
	outline: 0;
	border-color: #777;
}

.form-control.success textarea {
	border-color: #2ecc71;
}

.form-control.error textarea {
	border-color: #e74c3c;
}

.container {
	height: 620px;
}
.banner {
	height: 100vh;
}
</style>
<script type="text/javascript">
	function checkInputs() {
		var firstname = document.getElementById('firstname');
		var lastname = document.getElementById('lastname');
		var email = document.getElementById('email');
		var message = document.getElementById('message');
		let f = 0;
		let l = 0;
		let e = 0;
		let m = 0;
		if (firstname.value === '') {
			setErrorFor(firstname, 'Please enter your firstname');
			f = 0;

		} else if (!isFirstname(firstname.value)) {
			setErrorFor(firstname, 'Firstname contains only alphabets');
			f = 0;

		} else {
			setSuccessFor(firstname);
			f = 1;

		}
		if (lastname.value === '') {
			setErrorFor(lastname, 'Please enter your lastname');
			l = 0;

		} else if (!isLastname(lastname.value)) {
			setErrorFor(lastname, 'Lastname contains only alphabets');
			l = 0;

		} else {
			setSuccessFor(lastname);
			l = 1;

		}
		if (email.value === '') {
			setErrorFor(email, 'Please enter your email');
			e = 0;

		} else if (!isEmail(email.value)) {
			setErrorFor(email, 'Invalid email');
			e = 0;

		} else {
			setSuccessFor(email);
			e = 1;

		}
		if (message.value === '') {
			setErrorFor(message, 'Please enter message');
			m = 0;

		} else if (!isMessage(message.value)) {
			setErrorFor(message,
					'Message contains only alphabets,numbers and dot');
			m = 0;

		} else {
			setSuccessFor(message);
			m = 1;

		}
		if (f == 1 && l == 1 && e == 1 && m == 1) {
			alert("We have recieved your feedback.Thank you!");
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
	function isFirstname(firstname) {
		return /^[A-Za-z ]+$/.test(firstname);
	}
	function isLastname(lastname) {
		return /^[A-Za-z]+$/.test(lastname);
	}
	function isEmail(email) {
		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
				.test(email);
	}
	function isMessage(message) {
		return /^[A-Za-z0-9.]{5,150}$/.test(message);
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
			<form action="contactusafterlogindb.jsp" method="post" class="form" id="form" name="myForm"
				onsubmit="return checkInputs()">
				<div class="form-control">
					<label for="firstname">First Name</label><br> <input
						style="width: 100%" type="text"
						placeholder="Enter Your First Name" id="firstname" name="firstname" /><br> <small>Error
						message</small>
				</div>
				<div class="form-control">
					<label for="lastname">Last Name</label><br> <input
						style="width: 100%" type="text" placeholder="Enter Your Last Name"
						id="lastname" name="lastname" /><br> <small>Error message</small>
				</div>
				<div class="form-control">
					<label for="email">Email</label><br> <input
						style="width: 100%" type="email" placeholder="Enter Your Email"
						id="email" name="email" /><br> <small>Error message</small>
				</div>
				<div class="form-control">
					<label for="message">Message</label><br>
					<textarea style="width: 100%; height: 130px" name="message"
						id="message" placeholder="Message Us" maxlength="150"></textarea>
					<br> <small>Error message</small>
				</div>
				<input type="submit" value="Send Message">
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