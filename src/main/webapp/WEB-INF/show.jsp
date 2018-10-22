<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Show</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Inconsolata:400,700|Abril+Fatface' rel='stylesheet' type='text/css'>

</head>
<body class="p-5">
<h1>${show.title}</h1>
<h3>Network:       ${show.network}</h3>

<table class="table">
    <tr>
        <th>Name</th>
        <th>Rating</th>
    </tr>
    <c:forEach items="${show.getRatings()}" var="rating">
        <tr>
            <td>${rating.getUser().getName()}</td>
            <td>${rating.score}</td>
        </tr>
    </c:forEach>
</table>

<a href="/shows/${show.id}/edit"><button style="margin-top:10px;" class="btn btn-primary">Edit</button></a>

<h1 style="margin-top:10px;">Leave a Rating</h1>
<form class="form-signin w-25 p-1" method="POST" action="/shows/${show.id}">
    <select name="score" class="custom-select">
        <option value="5">5</option>
        <option value="4">4</option>
        <option value="3">3</option>
        <option value="2">2</option>
        <option value="1">1</option>
    </select>
    <%--<button style="margin-top:10px;" class="btn btn-primary disabled">Rate</button>--%>

    <button style="margin-top:10px;" class="btn btn-primary">Rate</button>
</form>



</body>
</html>