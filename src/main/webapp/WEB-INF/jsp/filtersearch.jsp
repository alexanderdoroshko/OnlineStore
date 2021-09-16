<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Поик по фильтрам</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .raz div {
            width: 8em;
            max-width: 100%;
            min-height: 2em;
            margin: 0 0 0 auto; /* то же, что margin-left: auto;  */
            background: #fff5d7;
        }
    </style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="raz">
    <div class="col-sm-8">
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

<div class="container mt-3">
    <form action="${contextPath}/search/result" method="get">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Search" name="nameProduct">
            <div class="input-group-append">
                <button class="btn btn-success" type="submit">Go</button>
            </div>
        </div>

        <select name="categoryId" class="custom-select mb-3">
            <option selected value="">Select category</option>
            <option value="Mobile phones">mobile phones</option>
            <option value="Laptop">laptop</option>
            <option value="Fridges">fridges</option>
            <option value="Cameras">cameras</option>
            <option value="GPS navigators">gps navigator</option>
            <option value="Car">car</option>
        </select>
        <div>
            <label>Цена </label> <br>
            От <input name="priceFrom" type="text">
            До <input name="priceTo" type="text">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

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

<div class="container">
    <ul class="pagination">
        <li>
            <a href="${contextPath}/search/result/page?currentPage=1">1</a>
        </li>
        <li>
            <a href="${contextPath}/search/result/page?currentPage=2">2</a>
        </li>
        <li>
            <a href="${contextPath}/search/result/page?currentPage=3">3</a>
        </li>
    </ul>
</div>

</body>
</html>
