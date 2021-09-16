
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>О заказе</title>
</head>
<body>

<div class="container-fluid">
    <br>
    <c:if test="${not empty productListByOrder}">
        <c:forEach items="${productListByOrder}" var="products">
            <div class="row">
                <div class="col-sm-3" style="background-color:lavender;">
                        <img src="${contextPath}/images/${products.getImage_path()}" class="float-left"
                             alt="${products.getName()}"
                             width="220" height="240">
                </div>
                <div class="col-sm-9" style="background-color:lavender;">
                    <p>${products.getName()}</p>
                    <p>${products.getDescription()}</p>
                    <p>${products.getPrice()}</p>
                </div>
            </div>
            <br>
        </c:forEach>
    </c:if>
</div>


</body>
</html>
