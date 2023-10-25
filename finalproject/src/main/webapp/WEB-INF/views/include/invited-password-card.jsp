<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<head>
    <link rel="stylesheet" href="/resources/css/modal.css">
    <script src="/resources/javascript/apiKey.js"></script>
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

        .letter-image {
            position: absolute;
            top: 60%;
            left: 50%;
            width: 200px;
            height: 200px;
            -webkit-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            cursor: pointer;
        }

        .animated-mail {
            position: absolute;
            height: 150px;
            width: 200px;
            -webkit-transition: 0.4s;
            -moz-transition: 0.4s;
            transition: 0.4s;
        }

        .animated-mail .body2 {
            position: absolute;
            bottom: 0;
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0 0 100px 200px;
            border-color: transparent transparent #e95f55 transparent;
            z-index: 2;
        }

        .animated-mail .top-fold {
            position: absolute;
            top: 50px;
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 50px 100px 0 100px;
            -webkit-transform-origin: 50% 0%;
            -webkit-transition: transform 0.4s 0.4s, z-index 0.2s 0.4s;
            -moz-transform-origin: 50% 0%;
            -moz-transition: transform 0.4s 0.4s, z-index 0.2s 0.4s;
            transform-origin: 50% 0%;
            transition: transform 0.4s 0.4s, z-index 0.2s 0.4s;
            border-color: #cf4a43 transparent transparent transparent;
            z-index: 2;
        }

        .animated-mail .back-fold {
            position: absolute;
            bottom: 0;
            width: 200px;
            height: 100px;
            background: #cf4a43;
            z-index: 0;
        }

        .animated-mail .left-fold {
            position: absolute;
            bottom: 0;
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 50px 0 50px 100px;
            border-color: transparent transparent transparent #e15349;
            z-index: 2;
        }

        .animated-mail .letter {
            left: 20px;
            bottom: 0px;
            position: absolute;
            width: 160px;
            height: 60px;
            background: white;
            z-index: 1;
            overflow: hidden;
            -webkit-transition: 0.4s 0.2s;
            -moz-transition: 0.4s 0.2s;
            transition: 0.4s 0.2s;
        }

        .animated-mail .letter .letter-border {
            height: 10px;
            width: 100%;
            background: repeating-linear-gradient(-45deg, #cb5a5e, #cb5a5e 8px, transparent 8px, transparent 18px);
        }

        .animated-mail .letter .letter-title {
            margin-top: 10px;
            margin-left: 5px;
            height: 10px;
            width: 40%;
            background: #cb5a5e;
        }

        .animated-mail .letter .letter-context {
            margin-top: 10px;
            margin-left: 5px;
            height: 10px;
            width: 20%;
            background: #cb5a5e;
            content: 'ram avtar';
        }

        .animated-mail .letter .letter-context-body {
            margin-top: 10px;
            margin-left: 5px;
            /* height: 10px; */
            width: 99%;
            color: black;
            content: 'ram avtar';
        }

        .animated-mail .letter .letter-stamp {
            margin-top: 30px;
            margin-left: 120px;
            border-radius: 100%;
            height: 30px;
            width: 30px;
            background: #cb5a5e;
            opacity: 0.3;
        }

        .shadow {
            position: absolute;
            top: 200px;
            left: 50%;
            width: 400px;
            height: 30px;
            transition: 0.4s;
            transform: translateX(-50%);
            -webkit-transition: 0.4s;
            -webkit-transform: translateX(-50%);
            -moz-transition: 0.4s;
            -moz-transform: translateX(-50%);
            border-radius: 100%;
            background: radial-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0));
        }

        .letter-image:hover .animated-mail {
            transform: translateY(50px);
            -webkit-transform: translateY(50px);
            -moz-transform: translateY(50px);
        }

        .letter-image:hover .animated-mail .top-fold {
            transition: transform 0.4s, z-index 0.2s;
            transform: rotateX(180deg);
            -webkit-transition: transform 0.4s, z-index 0.2s;
            -webkit-transform: rotateX(180deg);
            -moz-transition: transform 0.4s, z-index 0.2s;
            -moz-transform: rotateX(180deg);
            z-index: 0;
        }

        .letter-image:hover .animated-mail .letter {
            height: 280px;
            content: 'ram avtar';
            color: #000;
        }

        .letter-image:hover .shadow {
            width: 250px;
        }
    </style>
</head>
<%@ include file="header.jsp" %>
<div class="body">
    <div class="hidden-text" style="text-align: center; font-size: 29px; ">초대장이 도착했어요!</div>
    <div class="letter-image">
        <div class="animated-mail">
            <div class="back-fold"></div>
            <div class="letter" style="border: 1px solid #dde6e0;">
                <div class="letter-border"></div>
                <div class="letter-title"></div>
                <div class="letter-context"></div>
                <div class="letter-context-body" onclick="showHiddenContent()">
                    <p><strong>HanaPet</strong><br><br> 공유 적금에 참여해보세요!</p>
                </div>
                <div class="letter-stamp">
                    <div class="letter-stamp-inner"></div>
                </div>
            </div>
            <div class="top-fold"></div>
            <div class="body2"></div>
            <div class="left-fold"></div>
        </div>
        <div class="shadow"></div>
    </div>

    <div class="card" style="display: none;">
        <div class="category small">
            <img src="/resources/img/invitation.svg" width="40px"
                 style="padding-left: 5px; padding-top: 3px; margin-right: 15px;">
            <span>공유 적금 초대</span>
        </div>
        <div class="contents small">
            <br>
            <div class="first-content">
                <span>적금에 가입하기 위해서는 비밀번호 확인이 필요합니다.<br><br>비밀번호를 입력해주세요.</span>
            </div>
            <br>
            <div class="relative mb-1">
                <span class="ml-2 bg-white px-2 absolute -top-3 text-sm">Password</span>
                <input class="transition duration-500 border h-12 rounded w-full px-2 mb-2"
                       type="password" style="border-radius: 5px; margin-left: 5px; padding: 3px 5px">
            </div>
            <br>
            <div class="third-content">
                <button onclick="checkPW()">
                    다음으로
                </button>
            </div>
        </div>
    </div>

</div>

<script>
    function checkPW() {
        // 입력한 비밀번호를 가져옴
        const enteredPassword = document.querySelector(".transition").value;

        // 실제 비밀번호
        var actualPassword = '${accountPW}';

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

    var hiddenContentVisible = false;

    function showHiddenContent() {
        hiddenContentVisible = !hiddenContentVisible;

        var card = document.querySelector(".card");
        var letter = document.querySelector(".letter-image");
        var text = document.querySelector(".hidden-text");

        if (hiddenContentVisible) {
            card.style.display = "block";
            text.style.display = "none";
            letter.style.display = "none";

        }
    }

</script>