<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Registration Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="container">
    <h2>Регистрация</h2>
    <form action="${contextPath}/registration/new/user" method="post">
        <div class="form-group">
            <label for="usr">Name:</label>
            <input type="text" class="form-control" id="usr" name="name">
        </div>
        <div class="form-group">
            <label for="sur">Surname</label>
            <input type="text" class="form-control" id="sur" name="surname">
        </div>
        <div class="form-group">
            <label for="mail">Email:</label>
            <input type="email" class="form-control" id="mail" name="email">
            <span class="error">${emailError}</span>
        </div>
        <div class="form-group">
            <label for="date">Date of Birth</label>
            <input type="date" class="form-control" id="date" name="dateOfBirthday">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" name="password">
            <span class="error">${passwordError}</span>
        </div>
        <div class="form-group">
            <label for="pwd2">Repeat password:</label>
            <input type="password" class="form-control" id="pwd2" name="passwordRepeat">
        </div>
        <button type="submit" class="btn btn-secondary">Registration</button>
    </form>
</div>

</body>
</html>
