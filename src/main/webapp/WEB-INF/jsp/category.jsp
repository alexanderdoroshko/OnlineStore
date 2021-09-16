<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Product</title>
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
<body style="background-color: ghostwhite">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<br>
<div class="row">
    <div class="col-sm-9">
        <form action="${contextPath}/search/result" method="get" accept-charset="UTF-8">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Search" name="nameProduct">
                <div class="input-group-append">
                    <button class="btn btn-success" type="submit">Go</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-sm-1">
        <a href="${contextPath}/home">
            <button class="btn btn-primary">Главная</button>
        </a>
    </div>
    <div class="col-sm-1">
        <a href="${contextPath}/personal/account">
            <button class="btn btn-primary">Кабинет</button>
        </a>
    </div>
    <div class="col-sm-1">
        <a href="${contextPath}/cart">
            <button class="btn btn-primary">Корзина</button>
        </a>
    </div>
</div>
<br>


<div class="container-fluid">
    <br>
    <c:if test="${not empty products}">
        <c:forEach items="${products}" var="products">
            <div class="row">
                <div class="col-sm-3" style="background-color:lavender;">
                    <a href="${contextPath}/product?id=${products.getId()}">
                        <img src="${contextPath}/images/${products.getImage_path()}" class="float-left"
                             alt="${products.getName()}"
                             width="220" height="240">
                    </a>
                </div>
                <div class="col-sm-9" style="background-color:lavender;">
                    <p>${products.getName()}</p>
                    <p>${products.getDescription()}</p>
                    <p>${products.getPrice()}</p>
                    <a href="${contextPath}/cart/add/product?productId=${products.getId()}">
                        <button id="addProductToCart" type="submit" onclick="productAddedToShoppingCartMsg()"
                                class="btn btn-primary">Добавить в корзину
                        </button>
                    </a>
                </div>
            </div>
            <br>
        </c:forEach>
    </c:if>
</div>
<a href="${contextPath}/cart">
    <button id="cartRedirect" type="submit" class="btn btn-primary">Перейти к корзине</button>
</a>

<div class="container">
    <ul class="pagination">
        <c:if test="${not empty pages}">
            <c:forEach items="${pages}" var="pages">
                <li>
                    <a href="${contextPath}/category/pagination?categoryId=${products.get(0).getCategory().getId()}&pageNumber=${pages}&pageSize=3&sortField=name&sortDirection=ASC">${pages}</a>
                </li>
            </c:forEach>
        </c:if>
    </ul>
</div>


</body>
</html>
