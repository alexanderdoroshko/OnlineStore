<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Личный кабинет</title>
    <style>
        .center {
            padding: 20px 0;
            text-align: center;
        }

        p {
            font-size: large;
        }

        .row {
            padding: 20px 0;

        }

    </style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="row">
    <div class="col-sm-1">
        <a href="${contextPath}/home">
            <button class="btn btn-primary">Главная</button>
        </a>
    </div>
    <div class="col-sm-1">
        <a href="${contextPath}/cart">
            <button class="btn btn-primary">Корзина</button>
        </a>
    </div>
</div>


<div class="center">
    <h1 class="display-4">Личный кабинет</h1>
    <p>Имя: ${name}</p>
    <p>Фамилия: ${surname}</p>
    <p>Адрес электронной почты: ${email}</p>
    <p>Дата рождения: ${dateOfBirthDay}</p>
    <p>Денег на счету: ${balance}</p>
</div>
<div>
    <h1>История заказов</h1>
</div>



<div class="container-fluid mb-4">
    <c:if test="${not empty userOrder}">
        <div class="row">
            <c:forEach items="${userOrder}" var="userOrder">
                <div class="card w-25 m-1" >
                    <div class="card-body">
                        <a href="${contextPath}/order/details?id=${userOrder.getId()}">
                        <h4 class="card-title">ID заказа ${userOrder.getId()}</h4>
                        <h4 class="card-title">Дата заказа ${userOrder.getDate()}</h4>
                        <h4 class="card-title">Цена ${userOrder.getPrice()}</h4>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div
</body>
</html>


