<%@page import="com.entites.Note"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="note" class="com.entites.Note" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="helper/headerfiles.jsp"%>
</head>
<body>
	<div class="container text-center">
		<%@include file="NavBar.jsp"%>
		<br>
		<h1 class="m-4 text-uppercase">All Notes</h1>

	</div>
	<div class="container">
		<%
			/*List<Note> list = (List<Note>)request.getAttribute("list");
		for(Note n : list){
		out.println(n.getId());
		out.println(n.getContent());
		out.println(n.getTitle());
		}*/
		%>

		<div class="row">
			<div class="col-12">
				<c:forEach items="${list}" var="n">
					<div class="card mt-3 " >
						<img class="card-img-top pl-4 pt-4 mx-auto" style="max-width: 100px" src="img/notes.png" alt="Card image cap">
						<div class="card-body px-4">
							<h3 class="card-title">${n.id}. ${n.title}</h5>
							<p class="card-text">${n.content}</p>
							<a href="Edit.jsp?id=${n.id }" class="btn btn-warning">edit</a>
							<a href="SaveServlet?action=delete&id=${n.id}" class="btn btn-danger">delete</a>
						</div>
					</div>

				</c:forEach>

			</div>

		</div>




	</div>


</body>
</html>