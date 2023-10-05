<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
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

        .product-image {
            width: 90px;
        }

        .menu-title {
            font-weight: bold;
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        .card {
            perspective: 150rem;
            width: 300px;
            background: none;
            cursor: pointer;
            padding: 30px;
            display: flex;
            flex-direction: column;
            border-radius: 20px;
            height: 160px;
        }

        .card-side {
            transition: all 1.4s ease;
            backface-visibility: hidden;
            position: absolute;
            top: 0;
            left: 0;
            width: 470px;
            color: white;
            padding: 30px;
            display: flex;
            flex-direction: column;
            border: 3px solid #BFDFCB; /* 5px 크기의 #BFDFCB 테두리 설정 */
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
            height: 160px;
        }

        .card-side.back {
            transform: rotateY(-180deg);
            background-color: #BFDFCB;
        }

        .card-side.front {
            /*background-color: #75A989;*/
        }

        .card:hover .card-side.front {
            transform: rotateY(180deg);
        }

        .card:hover .card-side.back {
            transform: rotateY(0deg);
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
        <span style="font-size: 16px;">(조회 기준일자: 2023-08-29, 우대금리포함)</span>
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
                var productCard = $("<div>").addClass("card")
                    .css({
                        "display": "flex",
                        "justify-content": "center",
                        "cursor": "pointer"
                    })
                    .click(function () {
                        // 시작하기 버튼 클릭 시 제품 정보를 세션에 저장
                        var productInfo = {
                            category: product.category,
                            description: product.description,
                            rate: product.rate,
                            prime_rate: product.prime_rate,
                            min_period: product.min_period,
                            max_period: product.max_period,
                            min_balance: product.min_balance,
                            max_balance: product.max_balance,
                            image: product.image
                        };
                        sessionStorage.setItem("selectedProduct", JSON.stringify(productInfo));

                        // 새 페이지로 이동
                        window.location.href = "/one-product";
                    });


                var front = $("<div>").addClass("card-side front");
                var back = $("<div>").addClass("card-side back");
                var backContent = $("<div>").addClass("card-body");
                var content =
                    ($("<div>").addClass("card-footer")
                            .append($("<div>")
                                .html("최대 연 이자율: " + (product.rate + product.prime_rate * 3) + "%<br><br>가입 기간: " + product.min_period + "개월 이상 " + product.max_period + "개월 이하<br><br>가입 금액: 매월 " + product.min_balance.toLocaleString() + "원 이상 ~ " + product.max_balance.toLocaleString() + "원 이하<br><br>적립 방법: 자유적립식")
                                .css("color", "white"))
                    );

                var header = $("<div>").addClass("card-header")
                    .css({
                        "place-self": "start"
                    })
                    .append($("<span>").text(product.category).css({
                        "font-family": "font-medium",
                        "font-weight": "bold",
                        "font-size": "27px"
                    }));
                var box = $("<div>").addClass("card-body") // 클래스 이름을 'card-body'로 변경
                    .css({
                        "display": "flex",
                        "align-self": "end",
                        "margin-bottom": "20px"
                    })
                    .append($("<img>").attr("src", "/resources/img/" + product.image).addClass("product-image"))
                    .append($("<div>").addClass("card-footer") // 클래스 이름을 'card-footer'로 변경
                        .css("align-self", "center")
                        .append($("<div>").html("최대 연<br>" + (product.rate + product.prime_rate * 3) + "%").css({
                            "margin-left": "20px",
                            "font-size": "25px",
                            "font-family": "font-medium",
                            "font-weight": "bold"
                        }))
                    );
                var middle = $("<div>").addClass("card-text").text(product.description).css({
                    "place-self": "start"
                }); // 클래스 이름을 'card-text'로 변경

                productCard.append(front.append(header).append(box).append(middle));
                productCard.append(back.append(backContent.append(content)));
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
