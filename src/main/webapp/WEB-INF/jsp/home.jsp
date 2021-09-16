<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Categories</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h2 align="center">Popular categories</h2>
<div class="row">
    <div class="col-sm-9">
        <form action="${contextPath}/search/result" method="get">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Search" name="nameProduct">
                <div class="input-group-append">
                    <button class="btn btn-success" type="submit">Go</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-sm-1">
        <a href="${contextPath}/user/sign/in">
            <button class="btn btn-primary">Войти</button>
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
<div>
    <a href="${contextPath}/search">
        <p>Поиск по фильтрам</p>
    </a>
</div>
<br>

<div class="container-fluid mb-4">
    <c:if test="${not empty categories}">
        <div class="row">
            <c:forEach items="${categories}" var="category">
                <div class="card w-25 m-1" type="category">
                    <div class="card-body">
                        <h4 class="card-title">${category.getName()}</h4>
                        <a href="${contextPath}/category/pagination?categoryId=${category.getId()}&pageNumber=1&pageSize=3&sortField=name&sortDirection=ASC">
                            <img src="${contextPath}/images/${category.getImage_path()}"
                                 style="width:150px;height:120px"
                                 alt="Category image"></a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
</div>

</body>
</html>



