<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function productAddedToShoppingCartMsg() {
            window.confirm("Товар добавлен в корзину!");
        }
    </script>
</head>
<body>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="product" value="${product}"/>
<h2>${product.getName()}</h2>
<div class="row">
    <div class="col-sm-5" style="background-color:lavender;">
        <img src="${contextPath}/images/${product.getImage_path()}" class="float-left"
             alt="${product.getName()}"
             width="250" height="280">
    </div>
    <div class="col-sm-7" style="background-color:lavender;">
        <p>${product.getName()}</p>
        <p>${product.getDescription()}</p>
        <p>${product.getPrice()}</p>
        <a href="${contextPath}/cart/add/product?productId=${product.getId()}">
            <button id="addProductToCart" type="submit" onclick="productAddedToShoppingCartMsg()"
                    class="btn btn-secondary">Добавить в
                корзину
            </button>
        </a>
        <a href="${contextPath}/cart">
            <button id="cartRedirect" type="submit" class="btn btn-secondary">Перейти к корзине</button>
        </a>
    </div>
</div>
</body>
</html>
