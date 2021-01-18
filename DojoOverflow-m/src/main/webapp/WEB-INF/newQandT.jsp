<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New question and tags</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="continer m-5 p-5">
<h1 class="text-center">What is your question?</h1>
<form:form action="/questions/new" method="post" modelAttribute="question">
    <div>
        <form:label path="questionText">Question</form:label>
        <form:input path="questionText" class="form-control" type="text"/>
        <form:errors path="questionText" class="text-danger"/>
    </div>
    <div>
        <form:label path="tagsInput">Tags</form:label>
        <form:input path="tagsInput" class="form-control"/>
        <small class="form-text text-muted">Separate each
									tag with a "," and it should be in lower case.</small>
        <form:errors path="tagsInput" class="text-danger"/>
        <p  class="text-danger"><c:out value="${error}"></c:out></p>
    </div> 
     
    <input type="submit" value="Submit" class="btn btn-dark"/>
</form:form>
</div>
</body>
</html>