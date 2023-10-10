<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<head>
    <link rel="stylesheet" href="/resources/css/modal.css">
    <style>
        .second-content img {
            border-radius: 50%;
            overflow: hidden;
            width: 100px;
            height: 100px;
        }

        .card {
            margin-bottom: 50px;
            margin-top: 30px;
        }
    </style>
</head>
<%@ include file="header.jsp" %>
<div class="body">
    <c:forEach var="info" items="${inviteInfo}">
        <div class="card">
            <div class="category small">
                <img src="/resources/img/invitation.svg" width="40px"
                     style="padding-left: 5px; padding-top: 3px; margin-right: 15px;">
                <span>공유 적금 초대 </span>
            </div>
            <div class="contents small">
                <div class="first-content">
                    <img src=""/>
                    <span>${info.openerName}님이 </span>
                    <span id="account-name">${info.petName}의 ${info.savingName}</span>
                    <span>에 초대하셨습니다.</span>
                </div>
                <div class="second-content">
                    <img src="/resources/img/${info.petImg}"/>
                </div>
                <div class="third-content">
                    <button onclick="reject()">거절하기</button>
                    <button onclick="joinProduct(
                            '${info.category}',
                            '${info.description}',
                            '${info.rate}',
                            '${info.primeRate}',
                            '${info.minBalance}',
                            '${info.maxBalance}',
                            '${info.productImg}',
                            '${info.endDate}',
                            '${info.joinPeriod}',
                            '${info.savingName}',
                            '${info.petName}',
                            '${info.accountNumber}',
                            '${info.finalAmount}',
                            '${info.interestAmount}'
                            )">적금 가입하기
                    </button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>
    function joinProduct(
        category,
        description,
        rate,
        prime_rate,
        min_balance,
        max_balance,
        image,
        endDate,
        joinPeriod,
        savingName,
        petName,
        accountNumber,
        finalAmount,
        interestAmount
    ) {
        const productInfo = {
            category: category,
            description: description,
            rate: rate,
            prime_rate: prime_rate,
            min_balance: min_balance,
            max_balance: max_balance,
            image: image,
            endDate: endDate,
            joinPeriod: joinPeriod,
            savingName: savingName,
            petName: petName,
            accountNumber: accountNumber,
            finalAmount: finalAmount,
            interestAmount: interestAmount
        };
        sessionStorage.setItem("selectedProduct", JSON.stringify(productInfo));
        window.location.href = "/invited-one-product";
    }

    function reject() {
        $.ajax({
            url: "/delete-session", // 세션 삭제 처리
            type: "GET",
            always: window.location.href = "/"
        });
    }
</script>