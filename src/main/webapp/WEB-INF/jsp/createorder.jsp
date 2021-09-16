<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Подтверждение заказа</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:if test="${not empty requestScope.orderComplete}">
  <h1>${orderComplete}</h1>
</c:if>

<c:if test="${not empty requestScope.error}">
    <h1>${error}</h1>
    <a href="${contextPath}/user/sign/in">
        <button class="btn btn-primary">Войти</button>
    </a>
</c:if>

</body>
</html>
