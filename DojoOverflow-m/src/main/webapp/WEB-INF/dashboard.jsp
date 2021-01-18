<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="continer m-5 p-5">
<h1 class="text-center">Questions Dashborad</h1>
<table class="table table-striped table-hover">
<thead>
<tr>
<th>Question</th>
<th>Tags</th>
</tr>
</thead>
<tbody>
<c:forEach items="${questions}" var="question">
<tr>
<td><a href="/questions/${question.id }"><c:out value="${question.questionText }"></c:out></a></td>
<td>
<c:forEach items="${question.tags }" var="tag">
<c:out value="${tag.subject }"></c:out>
</c:forEach>
</td>
</tr>
</c:forEach>
</tbody>

</table>
<h5 class="text-end"><a href="/questions/new">New Question</a></h5>
</div>
</body>
</html>