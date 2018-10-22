<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Inconsolata:400,700|Abril+Fatface' rel='stylesheet' type='text/css'>

</head>
<body class="p-3">
    <h1>Welcome ${user.name}</h1>
    <h2>TV Shows</h2>
    <table class="table">
        <tr>
            <th scope="col">
                Show
            </th>
            <th scope="col">
                Network
            </th>
            <th scope="col">
                Avg Rating
            </th>
        </tr>
        <c:forEach items="${shows}" var="show">
                <tr>
                    <td>
                        <a href="/shows/${show.id}">${show.title}</a>
                    </td>
                    <td>
                            ${show.network}
                    </td>
                    <td>
                        ${show.average}
                    </td>
                </tr>
        </c:forEach>
    </table>

    <a href="/shows/new"><button style="margin-top: 10px;" class="btn-primary btn-lg" type="submit">Add a Show</button></a>

</body>
</html>