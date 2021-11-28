<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Show ${language.name}</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container-sm">
		<nav class="nav">
			<a href="/languages">Dashboard</a>
		</nav>
		<h1><c:out value="${language.name}"/></h1>
		<p><c:out value="${language.creator}"?></c:out></p>
		<p><c:out value="${language.version}"?></c:out></p>
		<a href="/update">Edit</a>
		<form action="/language/${language.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" value="Delete" class="btn btn-danger">
		</form>
	</div>
</body>
</html>