<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Signup</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image:
		url("https://cdn.pixabay.com/photo/2020/02/02/08/45/blogging-4812375_1280.jpg");
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	margin: 120px;
	padding: 20px;
}

.container {
	background-color: rgba(255, 255, 255, 0.4); /* White with 80% opacity */
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	padding: 20px;
	max-width: 400px;
	margin: auto;
	backdrop-filter: blur(10px);
	/* Optional: Adds a blur effect behind the container */
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

input[type="text"], input[type="email"], input[type="password"], select
	{
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #5cb85c;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	margin-top: 10px;
}

input[type="submit"]:hover {
	background-color: #4cae4c;
}
</style>
</head>
<body>
	<div class="container">
		<form action="./add-user" method="post">
			<table>
				<tr>
					<td>Username</td>
					<td><input type="text" name="username" required="required"
						autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<td>Mobile</td>
					<td><input type="text" name="mobile" required="required"
						pattern="^\d{10}$" title="Mobile number must be exactly 10 digits"
						maxlength="10" minlength="10"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td>Role</td>
					<td><select name="role" required="required">
							<option value="USER">USER</option>
							<option value="ADMIN">ADMIN</option>
					</select></td>
				</tr>
			</table>
			<input type="submit" value="Signup">
		</form>
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