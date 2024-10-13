<%@page import="com.edu.blogger.dto.WebBlogDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Blogs</title>
<style>
.blog-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: 20px;
}

.blog-card {
	border: 1px solid #ccc;
	border-radius: 8px;
	padding: 15px;
	margin: 10px;
	width: 300px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

.blog-card h2 {
	font-size: 1.5em;
}

.blog-card p {
	margin: 10px 0;
}

.actions {
	margin-top: 20px;
}

.actions a {
	text-decoration: none;
	margin-right: 30px;
	color: blue;
}

.actions a:hover {
	font-weight: bold;
	text-decoration: underline;
}

.buttons a {
	text-decoration: none;
	color: blue;
	font-size: 16px;
	font-weight: bold;
	margin-right: 20px;
}

.buttons a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<%
	@SuppressWarnings("unchecked")
	List<WebBlogDTO> blogs = (List<WebBlogDTO>) request.getAttribute("blogs");
	if (blogs != null) {
	%>
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
			<div class="actions">
				<a href="edit-blog?blog-id=<%=blog.getId()%>">Edit</a> <a
					href="delete-blog?blog-id=<%=blog.getId()%>&user-id=<%=blog.getUserId()%>"
					style="color: red;">Delete</a>
			</div>
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
		<div class="buttons">
			<a href="home">HOME</a> 
			<a href="add-blog-page" style="color: red;">ADD BLOG</a>
		</div>
	</div>
</body>
</html>