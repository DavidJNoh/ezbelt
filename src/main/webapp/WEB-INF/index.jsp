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

        <form:label path="first_name">First Name</form:label>
        <p><form:errors path="first_name"/></p>
        <form:input type="text" path="first_name" class="form-control" placeholder="First Name"/>

        <form:label path="last_name">Last Name</form:label>
        <p><form:errors path="last_name"/></p>
        <form:input type="text" path="last_name" class="form-control" placeholder="Last Name"/>

        <form:label path="email">Email</form:label>
        <p><form:errors path="email"/></p>
        <form:input type="email" path="email" class="form-control" placeholder="Email"/>

        <%--<form:label path="location">Location</form:label>--%>
        <%--<p><form:errors path="location"/></p>--%>
        <%--<form:input path="location" style="margin-bottom: 10px;" class="form-control" type="text" placeholder="City" name="city"/>--%>
        <%--<form:select path="state" class="custom-select">--%>
        <%--<form:option value="AL">Alabama</form:option>--%>
        <%--<form:option value="AK">Alaska</form:option>--%>
        <%--<form:option value="AZ">Arizona</form:option>--%>
        <%--<form:option value="AR">Arkansas</form:option>--%>
        <%--<form:option value="CA">California</form:option>--%>
        <%--<form:option value="CO">Colorado</form:option>--%>
        <%--<form:option value="CT">Connecticut</form:option>--%>
        <%--<form:option value="DE">Delaware</form:option>--%>
        <%--<form:option value="DC">District Of Columbia</form:option>--%>
        <%--<form:option value="FL">Florida</form:option>--%>
        <%--<form:option value="GA">Georgia</form:option>--%>
        <%--<form:option value="HI">Hawaii</form:option>--%>
        <%--<form:option value="ID">Idaho</form:option>--%>
        <%--<form:option value="IL">Illinois</form:option>--%>
        <%--<form:option value="IN">Indiana</form:option>--%>
        <%--<form:option value="IA">Iowa</form:option>--%>
        <%--<form:option value="KS">Kansas</form:option>--%>
        <%--<form:option value="KY">Kentucky</form:option>--%>
        <%--<form:option value="LA">Louisiana</form:option>--%>
        <%--<form:option value="ME">Maine</form:option>--%>
        <%--<form:option value="MD">Maryland</form:option>--%>
        <%--<form:option value="MA">Massachusetts</form:option>--%>
        <%--<form:option value="MI">Michigan</form:option>--%>
        <%--<form:option value="MN">Minnesota</form:option>--%>
        <%--<form:option value="MS">Mississippi</form:option>--%>
        <%--<form:option value="MO">Missouri</form:option>--%>
        <%--<form:option value="MT">Montana</form:option>--%>
        <%--<form:option value="NE">Nebraska</form:option>--%>
        <%--<form:option value="NV">Nevada</form:option>--%>
        <%--<form:option value="NH">New Hampshire</form:option>--%>
        <%--<form:option value="NJ">New Jersey</form:option>--%>
        <%--<form:option value="NM">New Mexico</form:option>--%>
        <%--<form:option value="NY">New York</form:option>--%>
        <%--<form:option value="NC">North Carolina</form:option>--%>
        <%--<form:option value="ND">North Dakota</form:option>--%>
        <%--<form:option value="OH">Ohio</form:option>--%>
        <%--<form:option value="OK">Oklahoma</form:option>--%>
        <%--<form:option value="OR">Oregon</form:option>--%>
        <%--<form:option value="PA">Pennsylvania</form:option>--%>
        <%--<form:option value="RI">Rhode Island</form:option>--%>
        <%--<form:option value="SC">South Carolina</form:option>--%>
        <%--<form:option value="SD">South Dakota</form:option>--%>
        <%--<form:option value="TN">Tennessee</form:option>--%>
        <%--<form:option value="TX">Texas</form:option>--%>
        <%--<form:option value="UT">Utah</form:option>--%>
        <%--<form:option value="VT">Vermont</form:option>--%>
        <%--<form:option value="VA">Virginia</form:option>--%>
        <%--<form:option value="WA">Washington</form:option>--%>
        <%--<form:option value="WV">West Virginia</form:option>--%>
        <%--<form:option value="WI">Wisconsin</form:option>--%>
        <%--<form:option value="WY">Wyoming</form:option>--%>
        <%--</form:select>--%>
        <%--<p> <form:errors path="state"/></p>--%>


        <form:label path="password">Password</form:label>
        <p><form:errors path="password"/></p>
        <form:input type="text" path="password" class="form-control" placeholder="Password"/>

        <form:label path="passwordConfirmation">Password Confirmation</form:label>
        <p> <form:errors path="passwordConfirmation"/></p>
        <form:input type="text" path="passwordConfirmation" class="form-control" placeholder="Password Confirmation" />

        <button class="mx-auto btn btn-lg btn-primary btn-block" style="margin-top:10px;" type="submit">Register</button>
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