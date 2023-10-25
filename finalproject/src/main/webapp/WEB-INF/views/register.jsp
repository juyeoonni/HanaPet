<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link rel="stylesheet" href="../../../resources/css/login-register.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div id="container" class="container">
    <div class="row">
        <div class="col align-items-center flex-col sign-up">
            <div class="form-wrapper align-items-center">
                <div class="form sign-up">
                    <div class="input-group">
                        <input type="text" placeholder="이름">
                    </div>
                    <div class="input-group">
                        <input type="email" placeholder="이메일">
                    </div>
                    <div class="input-group">
                        <input type="text" placeholder="전화번호">
                    </div>
                    <div class="input-group">
                        <input type="text" placeholder="주민등록번호">
                    </div>
                    <div class="input-group">
                        <input type="text" placeholder="아이디">
                    </div>
                    <div class="input-group">
                        <input type="password" placeholder="비밀번호">
                    </div>
                    <div class="input-group">
                        <input type="password" placeholder="Confirm password">
                    </div>
                    <button>
                        Sign up
                    </button>
                    <p>
              <span>
                Already have an account?
              </span>
                        <b onclick="toggle()" class="pointer">
                            <a href="/login">Sign in here</a>
                        </b>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row content-row">
        <div class="col align-items-center flex-col">
            <div class="text sign-in">
                <h2>
                    Welcome
                </h2>

            </div>
            <div class="img sign-in">

            </div>
        </div>
        <div class="col align-items-center flex-col">
            <div class="img sign-up">

            </div>
            <div class="text sign-up">
                <h2>
                    Join with us
                </h2>

            </div>
        </div>
    </div>
</div>
</body>
<script>
    let container = document.getElementById('container')

    toggle = () => {
        container.classList.toggle('sign-in')
        container.classList.toggle('sign-up')
    }

    setTimeout(() => {
        container.classList.add('sign-up')
    }, 200)
</script>
</html>