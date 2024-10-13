<%@page import="com.edu.blogger.dto.Role"%>
<%@page import="com.edu.blogger.dto.WebBlogDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blogs</title>
<style>
html, body {
    margin: 0; /* Remove default margins */
    padding: 0; /* Remove default padding */
    width: 100%; /* Ensure full width */
}
body {
    margin-top: 60px; /* Add margin to body to avoid content overlap */
    background: linear-gradient(to bottom right, #f0f4f8, #d9e2ec); /* Soft gradient */
}

/* General styles for the navbar */
.navbar {
	display: flex;
	justify-content: space-around;
	align-items: center;
	background-color: rgba(51, 51, 51, 0.8); /* Semi-transparent background */
	padding: 10px 20px;
	position: fixed; /* Fix the navbar to the top */
	top: 0; /* Align to the top */
	width: 100%; /* Make it span the full width */
	z-index: 1000; /* Ensure it stays above other content */
	margin: 0; /* Remove any default margin */
}

/* Navbar link styles */
.navbar a {
	color: white;
	text-decoration: none;
	transition: transform 0.3s ease, color 0.3s ease; /* Add transition for animation */
}

.navbar a:hover {
	transform: scale(1.1); /* Scale up on hover */
	color: #4CAF50; /* Change color on hover */
}

/* Styles for form elements */
.navbar form {
	display: flex;
	align-items: center;
}

/* Select dropdown styles */
.navbar select, .navbar input[type="text"], .navbar input[type="submit"] {
	margin: 0 10px;
	padding: 8px 12px;
	border: none;
	border-radius: 4px;
	transition: background-color 0.3s ease; /* Add transition for smooth background change */
}

/* Style for submit buttons */
.navbar input[type="submit"] {
	background-color: #4CAF50; /* Green */
	color: white;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease; /* Add transition */
}

.navbar input[type="submit"]:hover {
	background-color: #45a049; /* Darker green on hover */
	transform: scale(1.1); /* Scale up on hover */
}

/* Responsive styles */
@media (max-width: 600px) {
	.navbar {
		flex-direction: column;
		align-items: flex-start;
	}
	.navbar form {
		width: 100%;
		margin-bottom: 10px;
	}
}

.blog-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: 20px;
}

.blog-card {
	border: 1px solid red;
	border-radius: 8px;
	padding: 15px;
	margin: 10px;
	width: 300px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.4);
}

.blog-card h2 {
	font-size: 1.5em;
}

.blog-card p {
	margin: 10px 0;
}

.blog-card a {
	text-decoration: none;
	color: red;
}

.blog-card a:hover {
	text-decoration: underline;
}

select {
	background-color: white;
	color: black;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	transition: background-color 0.3s;
}
</style>
</head>
<body>
	<%
	@SuppressWarnings("unchecked")
	List<WebBlogDTO> blogs = (List<WebBlogDTO>) request.getAttribute("blogs");
	Role role = (Role) request.getAttribute("role");
	if (blogs != null) {
	%>
	<div class="navbar">
		<a href="home" style="text-decoration: none; color: white;">HOME</a>
		<form action="./sort">
			<select name="index" required="required">
				<option value="1">NEWEST FIRST</option>
				<option value="0">OLDEST FIRST</option>
			</select> <input type="submit" value="Sort">
		</form>
		<form action="filter-blogs" method="get">
			<select name="category" onchange="this.form.submit()" style="padding: 10px; border-radius: 5px; border: none;">
				<option value="" style="font-size: 12px;font-weight: bold;">SELECT CATEGORY</option>
				<option value="all">All Blogs</option>
				<option value="food">Food</option>
				<option value="traveling">Traveling</option>
				<option value="motivation">Motivation</option>
				<option value="learning">Learning</option>
				<option value="gaming">Gaming</option>
			</select>
		</form>
		<form action="./search">
			<input type="text" name="query"> <input type="submit" value="Search">
		</form>
	</div>
	<div align="center" class="blog-container">
		<%
		for (WebBlogDTO blog : blogs) {
		%>
		<div class="blog-card">
			<h2><%=blog.getTitle()%></h2>
			<p>
				<strong>Content:</strong>
				<%=blog.getContent()%></p>
			<p>
				<strong>Date:</strong>
				<%=blog.getDate()%></p>
			<p>
				<strong>Author:</strong>
				<%=blog.getAuthor()%></p>
			<%
			if (role == null || !role.equals(Role.USER)) {
			%>
			<a href="delete-blog?blog-id=<%=blog.getId()%>&user-id=<%=blog.getUserId()%>">Delete</a>
			<%
			}
			%>
		</div>
		<%
		}
		%>
	</div>
	<%
	}
	%>
	<div align="center">
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

