<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Show ${onelang.name}</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container-sm">
		<nav class="nav">
			<a href="/languages">Dashboard</a>
		</nav>
		<h1><c:out value="${onelang.name}"/></h1>
		<p><c:out value="${onelang.creator}"/></p>
		<p><c:out value="${onelang.version}"/></p>
		<a href="/update/${onelang.id}" class="btn btn-warning mb-3">Edit</a>
		<form action="/destroy/${onelang.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<input type="submit" value="Delete" class="btn btn-danger">
		</form>
	</div>
</body>
</html>