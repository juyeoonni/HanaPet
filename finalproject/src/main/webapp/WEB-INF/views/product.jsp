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

        .product-image {
            width: 60px;
        }

        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 60px;
        }

    </style>
</head>

<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div class="menu-title">
        펫 적금 상품
    </div>
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
                    // 이미지 추가
                    var productImage = $("<img>").attr("src", "/resources/img/" + product.image).addClass("product-image");
                    productCard.append(productImage);
                    $("<div>").addClass("header")
                        .append($("<span>").text(product.category))
                        .appendTo(productCard);
                    $("<div>").addClass("middle").text(product.description).appendTo(productCard);
                    $("<div>").addClass("footer")
                        .append($("<span>").text(product.rate))
                        .append($("<button>").text("시작하기"))
                        .click(function () {
                            // 시작하기 버튼 클릭 시 제품 정보를 세션에 저장
                            var productInfo = {
                                category: product.category,
                                description: product.description,
                                rate: product.rate,
                                min_period: product.min_period,
                                min_balance: product.min_balance,
                                image: product.image
                            };
                            sessionStorage.setItem("selectedProduct", JSON.stringify(productInfo));

                            // 새 페이지로 이동
                            window.location.href = "/one-product";
                        })
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
