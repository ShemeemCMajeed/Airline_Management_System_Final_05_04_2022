<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
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
	width: 500px;
}
.form-control {
height: 100px;
}
</style>
<script type="text/javascript">
	function checkInputs() {
		 var email = document.getElementById('email');
		 var password = document.getElementById('password');
		 var password2 = document.getElementById('password2');
		 let e=0;
		 let p=0;
		 let p2=0;
		 if(email.value === '') {
				setErrorFor(email, 'Please enter your email');
				e=0;
				
			} else if (!isEmail(email.value)) {
				setErrorFor(email, 'Invalid email');
				e=0;
				
			} else {
				setSuccessFor(email);
				e=1;
				
			}
		 if(password.value === '') {
				setErrorFor(password, 'Please enter the new password');
				p=0;
				
			} else if (!isPassword(password.value)) {
				setErrorFor(password, 'Password should contain atleast 8 character,1 capital,small letter,number&special character');
				p=0;
			}
			 else {
				setSuccessFor(password);
				p=1;
				
			}
		 if(passwordcf.value === '') {
				setErrorFor(passwordcf, 'Please re-enter the password');
				p2=0;
				
			} else if (password.value==passwordcf.value) {
				setSuccessFor(passwordcf);
				p2=1;
			}
			 else {
				 setErrorFor(passwordcf, 'Password does not match');
					p2=0;
				
			}
		 if(e==1&&p==1&&p2==1) {
				alert("You have successfully changed your password");
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
	function isEmail(email) {
		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
	}
	function isPassword(password) {
		return /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-=]).{8,}$/.test(password);
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
					<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="airline_aboutus.jsp">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="contactus.jsp">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="userregister.jsp">Register</a></li>
				</ul>
			</div>
		</nav><br>
<div class="container">
	<div class="header">
		<h2>Forgot Password</h2>
	</div>
	<form action="login.jsp" method="post" class="form" id="form" name="myForm" onsubmit="return checkInputs()">
		<div class="form-control">
			<label for="email">Email</label><br>
			<input style="width: 100%" type="email" placeholder="Enter Your Email" id="email" name="email" /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<label for="password">New Password</label><br>
			<input style="width: 100%" type="password" placeholder="Create New Password" id="password" name="password" /><br>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<label for="password2">Confirm Password</label><br>
			<input style="width: 100%" type="text" placeholder="Confirm Your Password" id="passwordcf" name="passwordcf" /><br>
			<small>Error message</small>
		</div>
		<input type="submit" value="Submit">
		<br>
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