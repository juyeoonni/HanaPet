<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/login-register.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/javascript/apiKey.js"></script>
    <style>
        .button {
            background-color: #75A989;
            border: none;
            color: rgb(255, 255, 255);
            cursor: pointer;
            text-align: center;
            width: 100%;
            border-radius: 10px;
            font-size: 18px;
            padding: 10px 30px;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            outline: none;
        }

        .button:hover {
            box-shadow: 2px 2px 10px #a5a5a5;
            transform: scale(1.03);
        }


    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
        <div class="col align-items-center flex-col sign-up">
        </div>
        <!-- SIGN IN -->
        <div class="col align-items-center flex-col sign-in" style="padding-left: 50px;">
            <div class="form-wrapper align-items-center">
                <div class="form sign-in" style="text-align: -webkit-center;">
                    <b style="font-size: 28px">Login</b>
                    <form id="loginForm" method="post" style="width: 62%;"> <!-- 로그인 폼 시작 -->
                        <div class="input-group">
                            <i class='bx bxs-user'></i>
                            <input type="text" placeholder="아이디" id="guest_id">
                        </div>
                        <div class="input-group">
                            <i class='bx bxs-lock-alt'></i>
                            <input type="password" placeholder="비밀번호" id="pw">
                        </div>
                        <input type="button" class="button" value="로그인" onclick="loginFormFunc(); return false;">
                    </form> <!-- 로그인 폼 종료 -->
                    <div style="display: flex; padding: 30px 0px; justify-content: center;">
                        <b class= "pointer" style="margin-right: 15px; font-size: 17px;align-self: center;">
                            비밀번호 찾기
                        </b>
                        <b onclick="toggle()" class="pointer">
                            <a href="/register" style="font-size: 17px">회원가입</a>
                        </b>

                    </div>
                    <br>
                    <div style="text-align: center; cursor:pointer;">
                        <img src="/resources/img/kakao_login_btn.png" onclick="kakaoLogin();"/>
                    </div>
                </div>
            </div>
            <div class="form-wrapper">

            </div>
        </div>
        <!-- END SIGN IN -->

    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
        <!-- SIGN IN CONTENT -->
        <div class="col align-items-center flex-col">
            <div class="img sign-in" style="
                 margin-left: 130px;
                 padding-bottom: 90px;"
            >
                <img src="../../../resources/img/dog.png" style="width: 500px">
            </div>
        </div>
        <!-- END SIGN IN CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
</div>
</body>
<script>
    function kakaoLogin() {
        // 카카오톡 로그인 창 띄우기
        window.location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=' + config.KAKAO_JAVASCRIPT_KEY + '&redirect_uri=http://localhost:8080/kakao-login&response_type=code';
    };

    let container = document.getElementById('container')

    toggle = () => {
        container.classList.toggle('sign-in')
        container.classList.toggle('sign-up')
    }

    setTimeout(() => {
        container.classList.add('sign-in')
    }, 200)

    function loginFormFunc() {
        // 아이디와 비밀번호 가져오기
        var guest_id = $("#guest_id").val();
        var pw = $("#pw").val();

        // Ajax를 통해 서버에 요청 전송
        $.ajax({
            type: "POST",
            url: "/login-guest",
            data: JSON.stringify({
                guest_id: guest_id,
                pw: pw
            }),
            contentType: 'application/json',
            error: function (xhr, status, error) {
                alert(error + "error");
            },
            success: function (response) {
                if (response === "로그인 성공") {
                    // 로그인 성공 시 처리
                    alert("로그인 성공");
                    console.error("로그인 성공");
                    var link = document.createElement("a");
                    link.href = "/";
                    link.click();
                } else {
                    // 로그인 실패 시 처리
                    console.error("로그인 실패");
                }
            }
        });
    }
</script>
</html>
