<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="resources/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"--%>
<%--            crossorigin="anonymous"></script>--%>

    <style>
        .menu-item {
            padding-top: 12px !important;
        }

        .menu-title {
            text-align: center;
            font-weight: bold;
            font-size: 30px;
            margin-bottom: 40px;
        }

        .middle-box {
            background: var(--primary-color);
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

        .top-box {
            background: #E1E6DE;
            box-shadow: 4px 4px 4px 4px rgba(0.1, 0.1, 0.1, 0.1);
            border-radius: 15px;
            padding: 30px 30px 30px 70px;
            margin-bottom: 90px;
            width: 100%;
            height: 150px;
            display: flex;
            justify-content: space-between;
        }

        .box {
            display: flex;
            place-content: center;
        }

        .button {
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            position: relative;
            padding: 10px;
            text-align: center;
            border: 2px solid transparent;
            -webkit-transition: all ease-out .15s;
            transition: all ease-out .15s;
            cursor: pointer;
            margin: 0 10px;
            width: 250px;
            border-radius: 50px;
            background: var(--primary-color);
            height: 50px;
            color: white;
            font-size: 20px;
            font-family: net-bold;
        }

        .button:hover {
            transform: scale(1.04);
        }
    </style>
</head>
<jsp:include page="include/header.jsp"/>
<div class="body">
    <div class="menu-title">
        펫 보험 상품
    </div>
    <div class="box">
        <div class="top-box">
            <div>
                <h4 style="font-weight: bold">우리 아이에게 딱 맞는 펫보험은?🔍</h4>
                <br>
                <h5 style="font-weight: bold; color: #46814c">나이와 품종으로 추천 보험을 보러가보개!</h5>
            </div>
            <a href="/insurance-recommend" class="btn_block_round" style="align-self: center">
                <button class="button" style="font-weight: bold; padding-left: 10px">추천 보험 확인하기 <img
                        src="/resources/img/foot.svg"
                        style="width: 30px; margin-left: 10px;"/></button>
            </a>
            <div>
                <img src="/resources/img/insurance-dog.png" style="margin-top: -10px; width: 190px">
            </div>
        </div>
    </div>
    <div class="middle-box">
        <span>전체 ${insuranceProductList.size()}개 보험</span>
    </div>
    <jsp:include page="include/insurance-card.jsp"/>
</div>
<script>
    // .button--border-point 클래스를 가진 모든 요소를 가져옵니다.
    var buttons = document.querySelectorAll('.button');

    // 각 요소에 대해 함수를 실행합니다.
    buttons.forEach(function (button) {
        button.addEventListener('mouseover', function () {
            this.querySelector('img').src = "/resources/img/foot-fill.svg";
        });

        button.addEventListener('mouseout', function () {
            this.querySelector('img').src = "/resources/img/foot.svg";
        });
    });
</script>

<%@ include file="include/footer.jsp" %>
