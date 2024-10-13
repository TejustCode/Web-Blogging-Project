<%@page import="com.edu.blogger.dto.Role"%>
<%@page import="com.edu.blogger.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image:url("https://cdn.pixabay.com/photo/2019/10/29/18/21/working-4587754_1280.jpg");
	background-position:center;
	background-size:cover;
	background-repeat:no-repeat;
	margin: 0;
	padding: 20px;
}

nav {
    padding: 15px;
    border-radius: 5px;
    display: flex;
    justify-content: space-around;
    background-color: rgba(128, 128, 128, 0.8); /* Semi-transparent gray */
}

nav a {
	color: white;
	text-decoration: none;
	padding: 10px 15px;
	border-radius: 5px;
	position: relative; /* Added for positioning the underline */
}

nav a::after {
	content: '';
	display: block;
	width: 100%;
	height: 2px; /* Thickness of the underline */
	background: white; /* Color of the underline */
	transform: scaleX(0); /* Start hidden */
	transition: transform 0.3s ease; /* Animation for the underline */
	position: absolute;
	left: 0;
	bottom: -5px; /* Positioning below the text */
}

nav a:hover::after {
	transform: scaleX(1); /* Show the underline on hover */
}

h3 {
	color: red;
	text-align: center;
}

p {
	width: 600px;
	font-size: 20px;
	text-align: justify;
	font-family: cursive;
	font-style: italic;
}

h1 {
	margin-top: 100px;
	margin-right: 70px;
}
</style>
</head>
<body>
	<%
	UserDTO user = (UserDTO) request.getAttribute("user");
	if (user.getRole().equals(Role.USER)) {
	%>
	<nav>
		<a href="edit-user">EDIT PROFILE</a> <a href="logout">LOGOUT</a> 
		<a href="delete-user" onclick="return confirmDelete()">DELETE ACCOUNT</a> 
		<a href="add-blog-page">ADD BLOG</a> 
		<a href="blogs">ALL BLOGS</a> 
		<a href="my-blogs">MY BLOGS</a>
	</nav>

	<div align="right" style="margin-right: 60px">
		<h1>WELCOME TO WEB BLOGGER</h1>
		<p>Web Blogger is a user-friendly platform that allows you to
			create and manage your own blog effortlessly. With customizable
			templates and an intuitive interface, you can share your thoughts,
			stories, and expertise with the world. Whether you're a seasoned
			writer or just starting out, Web Blogger makes it easy to publish
			your ideas and connect with your audience. Developed by "Java-Smashers"
			group of developers with a vision to empower every user in every part
			of India to benefit from digital India and make in India revolution.</p>
	</div>
	<%
	} else {
	%>
	<nav>
		<a href="edit-user">EDIT PROFILE</a> <a href="logout">LOGOUT</a> 
		<a href="delete-user" onclick="return confirmDelete()">DELETE ACCOUNT</a> 
		<a href="blogs"></a> 
		<a href="users">ALL USERS</a>
	</nav>
	<div align="right" style="margin-right: 60px">
		<h1>WELCOME TO WEB BLOGGER</h1>
		<p>Web Blogger is a user-friendly platform that allows you to
			create and manage your own blog effortlessly. With customizable
			templates and an intuitive interface, you can share your thoughts,
			stories, and expertise with the world. Whether you're a seasoned
			writer or just starting out, Web Blogger makes it easy to publish
			your ideas and connect with your audience. Developed by "Java-Smashers"
			group of developers with a vision to empower every user in every part
			of India to benefit from digital India and make in India revolution.</p>
	</div>
	<%
	}
	%>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<h3><%=message%></h3>
	<%
	}
	%>

	<script type="text/javascript">
	function confirmDelete() {
		return confirm("Do you want to delete your account?");
	}	
	</script>
</body>
</html>