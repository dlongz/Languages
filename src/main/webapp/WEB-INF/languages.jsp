<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Languages</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="container-sm">
		<div>
			<table class="table table-primary table-hover table-striped">
				<thead>
					<tr>
						<th>Name</th>
						<th>Creator</th>
						<th>Version</th>
						<th>Action</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${languages}" var="lang">				
					<tr>
						<td><a href="/languages/${lang.id}"><c:out value="${lang.name}"/></a></td>
						<td><c:out value="${lang.creator}"/></td>
						<td><c:out value="${lang.version}"/></td>
						<td>
							<form action="/destroy/${lang.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-danger mb-3">
							</form>   <a href="/update/${lang.id}" class="btn btn-warning">Edit</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<form:form action="/languages" method="post" modelAttribute="language">
				<p>
					<form:label path="name">Name</form:label>
					<form:errors path="name"/>
					<form:input path="name"/>
				</p>
				<p>
					<form:label path="creator">Creator</form:label>
					<form:errors path="creator"/>
					<form:input path="creator"/>
				</p>
				<p>
					<form:label path="version">Version</form:label>
					<form:errors path="version"/>
					<form:input path="version"/>
				</p>
				<input type="submit" value="Submit" class="btn btn-success"/>
			</form:form>
		</div>
	</div>
</body>
</html>