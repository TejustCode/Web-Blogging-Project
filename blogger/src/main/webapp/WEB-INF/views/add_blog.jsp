<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Blog</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
}

.container {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 250, 0.4);
	padding: 20px;
	max-width: 500px;
	margin:70px auto;
}

table {
	width: 100%;
	margin: 20px 0;
}

td {
	padding: 10px;
	text-align: left;
}

input[type="text"], textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea {
	resize: vertical; /* Allow vertical resizing */
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

h3 {
	color: red;
	text-align: center;
}

a {
	display: block;
	text-align: center;
	margin-top: 15px;
	color: #007bff;
	text-decoration: none;
}

a:hover {
	color: orange;
}
</style>
</head>
<body>
	<div class="container">
		<form action="./add-blog" method="post">
			<table>
				<tr>
					<td>Title</td>
					<td><input type="text" name="title" required="required"
						autofocus="autofocus"></td>
				</tr>

				<tr>
					<td>Content</td>
					<td><textarea rows="12" name="content" maxlength="255"></textarea></td>
				</tr>
				<tr>
					<td>Author</td>
					<td><input type="text" name="author" required="required"></td>
				</tr>
			</table>
			<input type="submit" value="Add Blog">
		</form>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h3><%=message%></h3>
		<%
		}
		%>
		<a href="home" style="text-decoration: none;">HOME</a>
	</div>
</body>
</html>