<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kopo.finalproject.savingaccount.model.dto.MyPageHistoryInfo" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/apiKey.js"></script>

    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
    <script>
        Kakao.init(config.KAKAO_JAVASCRIPT_KEY); // 사용하려는 앱의 JavaScript 키 입력
    </script>
    <style>
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
    <div class="card text-white bg-primary mb-3" style="max-width: 20rem;">
        <div class="card-header"> ${info[0].savingName}</div>
        <div class="card-body">
            <h4 class="card-title">Primary card title</h4>
            <!-- infos 공통 부분 출력 -->
            <p> 계좌 번호: ${info[0].accountNumber}</p>
            <p> 적금 개설일: ${info[0].openingDate}</p>
            <p> 적금 만기 예정일: ${info[0].endDate}</p>
            <p> 적금 상품: ${info[0].category}</p>
            <img src="/resources/img/${info[0].categoryImg}" width="40px"/>
            <p>개설자: ${info[0].openerId}</p>
            <p> 현재 잔액: ${info[0].balance}</p>
            <p> ${info[0].petName}를 위해 조금만 더 화이팅</p>
            <p> 진행률: ${info[0].progressRate}</p>
            <p> 적금 만기 시 원금: ${info[0].finalAmount}</p>
            <p> 적금 만기 시 이자: ${info[0].interestAmount}</p>
            <br>
            <hr>
            <div>참여자 정보</div>
            <c:forEach var="infoItem" items="${info}">
                <div style="border: 1px solid; margin-bottom: 10px">
                    <p>이름: ${infoItem.guestId}</p>
                    <p>가입일: ${infoItem.joinDate}</p>
                    <p>현재까지 기여 금액: ${infoItem.contributionAmount}</p>
                    <p>기여도: ${infoItem.contributionRatio}</p>
                    <p>가입 금액: ${infoItem.transferAmount}</p>
                    <p>납입 주기: ${infoItem.transferPeriod}</p>
                </div>
            </c:forEach>
            <hr>

            <div style="display: flex;">
                <div style=" margin-right: 100px">거래 내역</div>
                <span>전체 보기</span>/
                <span>내 내역만 보기</span>
            </div>

            <!-- history_info 출력 -->
            <div>
                <c:set var="i" value="${history_info.size()}"/>
                <c:forEach var="historyItem" items="${history_info}">
                    <div style="border: 1px solid">
                        <p>${i}회차</p>
                        <p>이름 ${historyItem.guestId}</p>
                        <p>입금 계좌 ${historyItem.accountNumberIn}</p>
                        <p>출금 계좌 ${historyItem.accountNumberOut}</p>
                        <p>납입일 ${historyItem.transferDate}</p>
                        <p>납입금 ${historyItem.amount}원</p>
                        <p>잔액 ${historyItem.balanceAfterIn}원</p>
                    </div>
                    <c:set var="i" value="${i - 1}"/>
                </c:forEach>

            </div>
        </div>
    </div>
    <div class="progress">
        <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
             aria-valuemax="100"></div>
    </div>


</div>

<%
    String guest_id = (String) session.getAttribute("guest_id");
    // 여기서 필요한 세션값과 변수들을 설정하세요
%>

<script>
    $(document).ready(function () {
        var guest_id = '<%= guest_id %>'; // Java 값을 JavaScript 변수로 전달

    });

</script>

</body>
</html>
