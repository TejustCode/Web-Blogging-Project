<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image:url("https://cdn.pixabay.com/photo/2020/02/02/08/45/blogging-4812375_1280.jpg");
	background-position:center;
	background-size:cover;
	background-repeat:no-repeat;
	margin: 170px;
	padding: 0px;
}

h3 {
	color: red;
}

table {
	width: 100%;
	margin: 20px 0;
}

td {
	padding: 10px;
	text-align: left;
}

input[type="email"], input[type="password"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #007bff;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	margin-top: 10px;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

h6 {
	margin:20px;
	text-align: center;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
.container {
	background-color: rgba(255, 255, 255, 0.4); /* White with 80% opacity */
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	padding: 20px;
	max-width: 400px;
	margin:40px auto;
	backdrop-filter: blur(10px); /* Optional: Adds a blur effect behind the container */
}
</style>
</head>
<body>
	<div class="container">
		<form action="./login" method="post">
			<table>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
			</table>
			<input type="submit" value="Login">
		</form>
		<h6>
			New User? Sign up <a href="signup">here</a>
		</h6>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h3><%=message%></h3>
		<%
		}
		%>
	</div>
</body>
</html>