<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Inconsolata:400,700|Abril+Fatface' rel='stylesheet' type='text/css'>
    <style>
    .register p{
    color: red;
    }
    </style>
    <title>Sign In</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark static-top" style="background-color: #7c8891">
    <a class="navbar-brand" href="/">Home</a>
    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="/"></a>
        </li>
    </ul>
</nav>
<div class="container-fluid row text-center register">
    <form:form modelAttribute="user" method="POST" action="/register" class="form-signin w-25 p-5 mx-auto" style="margin-top:20px;">
        <h1 class="h3 mb-3 font-weight-normal">Register</h1>

        <form:label path="name">Name</form:label>
        <p><form:errors path="name"/></p>
        <form:input type="text" path="name" class="form-control" placeholder="Name"/>

        <form:label path="email">Email</form:label>
        <p><form:errors path="email"/></p>
        <form:input type="email" path="email" class="form-control" placeholder="Email"/>

       <%--<form:select path="state" class="custom-select">--%>
        <%--<form:option value="AL">Alabama</form:option>--%>
        <%--<form:option value="AK">Alaska</form:option>--%>
        <%--</form:select>--%>
        <%--<p> <form:errors path="state"/></p>--%>


        <form:label path="password">Password</form:label>
        <p><form:errors path="password"/></p>
        <form:input type="text" path="password" class="form-control" placeholder="Password"/>

        <form:label path="passwordConfirmation">Password Confirmation</form:label>
        <p> <form:errors path="passwordConfirmation"/></p>
        <form:input type="text" path="passwordConfirmation" class="form-control" placeholder="Password Confirmation" />

        <button class="mx-auto btn btn-lg btn-primary" style="margin-top:10px;" type="submit">Register</button>
    </form:form>


    <form action="/login"  method="POST" class="form-signin w-25 p-5 mx-auto" style="margin-top:150px;">
        <h1 class="h3 mb-3 font-weight-normal">Log In</h1>
        <label>Email address</label>
        <input type="email" name="email" class="form-control" placeholder="Email">
        <label>Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password">
        <button class="mx-auto btn btn-lg btn-primary" style="margin-top:10px; margin-bottom:40px;" type="submit" >Sign in</button>
        <p><c:out value="${error}" /></p>
    </form>
</div>

</body>
</html>