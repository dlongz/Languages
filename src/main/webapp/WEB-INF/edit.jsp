<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit ${language.name}</title>
</head>
<body>
	<div>
		<form:form action="/edit/${language.id}" method="post" modelAttribute="language">
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
				<input type="hidden" name="_method" value="put"/>
				<input type="submit" value="Submit" class="btn btn-success"/>
			</form:form>	
	</div>
</body>
</html>