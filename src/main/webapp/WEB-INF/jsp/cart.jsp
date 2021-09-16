<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Корзина товаров</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .center {
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h2>Корзина</h2>

<div class="center">
    <div class="btn-group btn-group-lg">
        <a href="${contextPath}/personal/account">
            <button class="btn btn-outline-primary">Кабинет</button>
        </a>
        <a href="${contextPath}/home">
            <button class="btn btn-outline-primary">Главная</button>
        </a>
    </div>
</div>


<div class="container-fluid mb-4">
    <c:forEach items="${cartProductsList}" var="product">
        <div class="card w-25 m-1" type="product">
            <div class="card-body">
                <img src="${contextPath}/images/${product.getImage_path()}" style="width:150px;height:120px"
                     alt="${product.getName()}">
                <h4 class="card-title">${product.getDescription()}</h4>
                <h4 class="card-title">${product.getPrice()}</h4>

                <a href="${contextPath}/cart/delete/product?productId=${product.getId()}">
                    <button class="btn btn-success">Удалить</button>
                </a>

            </div>
        </div>
    </c:forEach>
</div>
<div>
    <h3>Итого ${totalPrice}</h3>
</div>
<div>
    <a href="${contextPath}/create/order">
        <button type="button" class="btn btn-success">Оформить заказ</button>
    </a>
</div>


</body>
</html>
