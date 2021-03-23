<%@page import="com.entites.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.utility.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<jsp:useBean id="not" class="com.entites.Note" scope="session"></jsp:useBean>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="helper/headerfiles.jsp"%>
</head>
<body>
	<%
		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note)s.get(Note.class, Integer.parseInt(request.getParameter("id").trim()));
		
		String title = note.getTitle();
		String content = note.getContent();
	%>
	<div class="container text-center">
		<%@include file="NavBar.jsp"%>
		<br>
		<h1 class="m-4">Edit Note</h1>
		<h3></h3>
		
	</div>

	<div class="container">
		<!-- This is Add Note Form -->
		<form action="SaveServlet" method="post">
			<div class="mb-3">
				<input type="hidden" name="action" value="edit">
				<input type="hidden" name="id" value="<%=note.getId()%>">
				<label for="title" class="form-label">Title </label> <input
					type="text" class="form-control" id="title" value="<%=title %>" name="title"
					aria-describedby="emailHelp">
				
		
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Content</label>
				<textarea  id="content" name="content" placeholder="Enter Your Content Here"
					style="height: 200px" class="form-control"><%=content %>></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Save</button>
			</div>

		</form>
	</div>


</body>
</html>