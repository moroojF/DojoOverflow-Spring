<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="continer m-5 p-5 ">
<h1><c:out value="${question.questionText }"></c:out></h1>

<div class="d-flex justify-content-start">
<h4 class="m-1">tags: </h4>
<c:forEach items="${ question.tags}" var="tag">
<h4 class="m-1 border"><c:out value="${ tag.subject}"></c:out></h4>
</c:forEach>
</div>

<div class="row">
<div class="col-sm-6">
<table class="table table-striped table-hover">
<thead>
<tr>
<th>Answers</th>
</tr>
</thead>
<tbody>
<c:forEach items="${question.answers}" var="answer">
<tr>
<td>
<c:out value="${answer.answerText}"></c:out>
</td>
</tr>
</c:forEach>

</tbody>
</table>

</div>
<div class="col-sm-6">
<form action="/questions/${question.id}/answer" method="post">
    <div>
        <label name="answerText">Add your Answer</label>
        <input name="answerText" class="form-control" type="text"/>
    </div>
    <input type="submit" value="Submit" class="btn btn-dark mt-3"/>
</form>
</div>

</div>
</div>
</body>
</html>