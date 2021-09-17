<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Enter the online store</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        span.error {
            color: red;
        }
    </style>

</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="container">
    <div class="w3-display-middle">
        <h2>Login form with validation</h2>
        <p>Please, enter your credentials</p>
        <form method="post" action="${contextPath}/user/enter/in/system/">
            <%--            <input type="hidden" name="command" value="sign-in"/>--%>
            <div class="form-group">
                <label for="username">Email:</label>
                <input type="text" class="form-control w-28" id="username" placeholder="Enter username" name="username"
                       required>
                <span class="error">${emailError}</span>
                <%--                <div class="invalid-feedback">Please fill out username field.</div>--%>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control w-28" id="pwd" placeholder="Enter password" name="password"
                       required>
                <span class="error">${passwordError}</span>
                <%--                <div class="invalid-feedback">Please fill out password field.</div>--%>
            </div>
            <button type="submit" class="btn btn-primary">Sign-in</button>
        </form>
        <br>
        <a href="${contextPath}/registration">
            <button class="btn btn-primary">Registration</button>
        </a>
    </div>
</div>
<script>
    // Disable form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Get the forms we want to add validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>

</html>


