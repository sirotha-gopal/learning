<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="helper/headerfiles.jsp"%>
</head>
<body>
	<div class="container text-center">
		<%@include file="NavBar.jsp"%>
		<br>
		<h1 class="m-4">Add Note</h1>
	</div>

	<div class="container">
		<!-- This is Add Note Form -->
		<form action="SaveServlet" method="post">
			<div class="mb-3">
				<input type="hidden" name="action" value="addnotes">
				<label for="title" class="form-label">Title </label> <input
					type="text" class="form-control" id="title" name="title"
					aria-describedby="emailHelp">
				
		
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Content</label>
				<textarea id="content" name="content" placeholder="Enter Your Content Here"
					style="height: 200px" class="form-control"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>

		</form>
	</div>


</body>
</html>