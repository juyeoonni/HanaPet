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
        .middle-box {
            background: #75A989;
            box-shadow: 0px 3px 3px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            width: auto;
            height: 50px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0px 30px;
        }

        /* 그리드 컨테이너 스타일 */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 4개의 열로 구성 */
            gap: 40px; /* 아이템 사이의 간격 */
        }

        /* 그리드 아이템 스타일 */
        .grid-item {
            padding: 30px;
            display: flex;
            flex-direction: column;
            border: 3px solid #BFDFCB; /* 5px 크기의 #BFDFCB 테두리 설정 */
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
            height: 160px;
        }

        .product-image {
            width: 90px;
        }

        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

    </style>
</head>

<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div class="menu-title">
        펫 적금 상품
    </div>
    <div class="middle-box">
        <span>전체 7개 적금</span>
        <span style="font-size: 16px; font-family: font-regular">(조회 기준일자: 2023-08-29, 우대금리포함)</span>
    </div>
    <div class="grid-container">
    </div>
</div>
<script>
    $.ajax({
        url: "/products",
        type: "GET",
        dataType: "json",
        success: function (products) {
            var productList = $(".grid-container");

            products.forEach(function (product) {
                var productCard = $("<div>").addClass("grid-item")
                    .css({
                        "display": "flex",
                        "justify-content": "center",
                        "cursor":"pointer"
                    })
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
                    });

                var header = $("<div>").addClass("header")
                    .append($("<span>").text(product.category).css({"font-family":"font-medium","font-weight":"bold","font-size":"27px"}));
                var box = $("<div>").addClass("box")
                    .css({
                        "display": "flex",
                        "align-self": "end",
                        "margin-bottom": "20px"
                    })
                    .append($("<img>").attr("src", "/resources/img/" + product.image).addClass("product-image"))
                    .append($("<div>").addClass("footer")
                        .css("align-self", "center")
                        .append($("<div>").html("최대 연<br>" + product.rate + "%").css({"margin-left": "20px","font-size":"25px", "font-family":"font-medium","font-weight":"bold"}))
                    );
                var middle = $("<div>").addClass("middle").text(product.description);

                productCard.append(header).append(box).append(middle);
                productList.append(productCard);
            });
        },
        error: function () {
            console.log("Error fetching product data.");
        }
    });
</script>
</body>
</html>
