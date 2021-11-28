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
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Creator</th>
						<th>Version</th>
						<th>Action</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${language}" var="language">				
					<tr>
						<td><c:out value="${language.name}"/></td>
						<td><c:out value="${language.creator}"/></td>
						<td><c:out value="${language.version}"/></td>
						<td><a href="/destroy">Delete</a> | <a href="/updateS">Edit</a></td>
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