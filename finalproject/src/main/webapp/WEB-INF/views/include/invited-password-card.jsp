<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<head>
    <link rel="stylesheet" href="/resources/css/modal.css">
    <script src="/resources/js/apiKey.js"></script>
    <style>
        .second-content img {
            border-radius: 50%;
            overflow: hidden;
            width: 100px;
            height: 100px;
        }

        .card {
            margin-bottom: 50px;
        }
    </style>
</head>
<%@ include file="header.jsp" %>
<div class="body">
    <div class="card">
        <div class="category small">
            <img src="/resources/img/invitation.svg" width="40px"
                 style="padding-left: 5px; padding-top: 3px; margin-right: 15px;">
            <span>공유 적금 초대</span>
        </div>
        <div class="contents small">
            <div class="first-content">
                <span>적금에 가입하기 위해서는 비밀번호 확인이 필요합니다. 비밀번호를 입력해주세요.</span>
            </div>
            <div class="second-content">
                <input type="password" placeholder="비밀번호">
            </div>
            <div class="third-content">
                <button onclick="checkPW()">
                    다음으로
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    // "다음으로" 버튼을 클릭했을 때 실행되는 함수
    function checkPW() {
        // 입력한 비밀번호를 가져옴
        const enteredPassword = document.querySelector("input[type='password']").value;

        // 실제 비밀번호
        var actualPassword = "381924";

        // 입력한 비밀번호와 실제 비밀번호를 비교
        if (enteredPassword === actualPassword) {
            kakaoLogin();
        } else {
            // 비밀번호가 일치하지 않는 경우, 알림창을 표시
            alert("비밀번호가 일치하지 않습니다.");
            // 비밀번호 입력 필드를 지움
            document.querySelector("input[type='password']").value = "";
        }
    }

    function kakaoLogin() {
        // 카카오톡 로그인 창 띄우기
        window.location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=' + config.KAKAO_JAVASCRIPT_KEY + '&redirect_uri=http://localhost:8080/kakao-login&response_type=code';
    };

</script>