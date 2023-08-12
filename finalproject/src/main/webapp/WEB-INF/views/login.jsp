<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link rel="stylesheet" href="../../../resources/css/login-register.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
        <div class="col align-items-center flex-col sign-up">
        </div>
        <!-- SIGN IN -->
        <div class="col align-items-center flex-col sign-in" style="
    padding-left: 50px;
">
            <div class="form-wrapper align-items-center">
                <div class="form sign-in">
                    <div class="input-group">
                        <i class='bx bxs-user'></i>
                        <input type="text" placeholder="ID">
                    </div>
                    <div class="input-group">
                        <i class='bx bxs-lock-alt'></i>
                        <input type="password" placeholder="Password">
                    </div>
                    <button>
                        로그인
                    </button>
                    <p>
                        <b>
                            비밀번호 찾기
                        </b>
                    </p>
                    <p>
              <span>
                회원이 아니신가요?
              </span>
                        <b onclick="toggle()" class="pointer">
                            <a href="/register">가입하기</a>
                        </b>
                    </p>
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
    let container = document.getElementById('container')

    toggle = () => {
        container.classList.toggle('sign-in')
        container.classList.toggle('sign-up')
    }

    setTimeout(() => {
        container.classList.add('sign-in')
    }, 200)
</script>
</html>