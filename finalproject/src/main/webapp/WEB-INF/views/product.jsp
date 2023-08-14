<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* 그리드 컨테이너 스타일 */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 4개의 열로 구성 */
            gap: 20px; /* 아이템 사이의 간격 */
        }

        /* 그리드 아이템 스타일 */
        .grid-item {
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }
    </style>
</head>

<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div class="grid-container">
</div>
</div>

<script>
    $(document).ready(function () {
        // 서버에서 제품 데이터 가져오기
        $.ajax({
            url: "/products",
            type: "GET",
            dataType: "json",
            success: function (products) {
                var productList = $(".grid-container");

                // 가져온 데이터를 사용하여 제품 카드 생성 및 추가
                products.forEach(function (product) {
                    var productCard = $("<div>").addClass("grid-item");
                    $("<div>").addClass("header")
                        .append($("<span>").text(product.category))
                        .appendTo(productCard);
                    $("<div>").addClass("middle").text(product.description).appendTo(productCard);
                    $("<div>").addClass("footer")
                        .append($("<span>").text(product.rate))
                        .append($("<button>").text("시작하기"))
                        .appendTo(productCard);

                    productList.append(productCard);
                });
            },
            error: function () {
                console.log("Error fetching product data.");
            }
        });
    });
</script>
</body>
</html>
