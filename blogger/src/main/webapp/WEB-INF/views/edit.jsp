<%@page import="com.edu.blogger.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background: white; /* Gradient background */
    margin: 0;
    padding: 20px;
}

.container {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0px 0px 12px red;
    padding: 30px;
    max-width: 400px;
    margin:50px auto;
    animation: fadeIn 0.5s ease; /* Fade-in animation */
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

table {
    width: 100%;
    margin: 20px 0;
}

td {
    padding: 10px;
    text-align: left;
}

input[type="text"],
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    transition: border 0.3s; /* Transition for border color */
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus {
    border-color: #007bff; /* Change border color on focus */
    outline: none; /* Remove outline */
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
    transition: background-color 0.3s, transform 0.3s; /* Transition for button */
}

input[type="submit"]:hover {
    background-color: #0056b3;
    transform: translateY(-2px); /* Slight lift effect on hover */
}

a {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: #007bff;
    text-decoration: none;
    transition: color 0.3s; /* Transition for link color */
}

a:hover {
    text-decoration: underline;
    color: #0056b3; /* Change color on hover */
}
</style>
</head>
<body>
<h1 style="text-align: center;color: red">Edit Your Data</h1>
	<%
	UserDTO user = (UserDTO) request.getAttribute("user");
	%>
	<div class="container">
		<form action="./update-user" method="post">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" required="required"
						value="<%=user.getId()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>Username</td>
					<td><input type="text" name="username" required="required"
						value="<%=user.getUserName()%>"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email" required="required"
						value="<%=user.getEmail()%>"></td>
				</tr>
				<tr>
					<td>Mobile</td>
					<td><input type="text" name="mobile" required="required"
						value="<%=user.getMobile()%>"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required="required"
						value="<%=user.getPassword()%>"></td>
				</tr>
			</table>
			<input type="submit" value="Update">
		</form>
		<a href="home">HOME</a>
	</div>
</body>
</html>
