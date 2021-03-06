<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Inconsolata:400,700|Abril+Fatface' rel='stylesheet' type='text/css'>
    <style>
        p{
            color: red;
        }
    </style>
</head>
<body class="p-5">
<h1>${show.title}</h1>
<form:form class="form-signin w-25 p-5 mx-auto" style="margin-top:20px;" action="/shows/${show.id}/edit" method="POST" modelAttribute="show">
    <form:label path="title">Title</form:label>
    <p><form:errors path="title"/></p>
    <form:input class="form-control" path="title"/>
    <form:label path="network">Network</form:label>
    <p><form:errors path="network"/></p>
    <form:input class="form-control" path="network"/>
    <p class="error"><c:out value="${error}" /></p>
    <button class="mx-auto btn btn-lg btn-primary" style="margin-top:10px;" type="submit">Update</button>
</form:form>

<a href="/delete/${show.id}"><button class="mx-auto btn btn-lg btn-warning" style="margin-top:10px;" type="submit">Delete</button></a>

</body>
</html>