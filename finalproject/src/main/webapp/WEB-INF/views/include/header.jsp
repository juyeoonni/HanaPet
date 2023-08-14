<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link rel="stylesheet" href="../../../../resources/css/header.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<header>
    <div class="header-container">
        <a href="/" class="logo">
            <img src="../../../resources/img/main_logo.png" style="width:130px;">
        </a>
        <div class="menu">
            <a href="/product" class="menu-item" style="color: #008485"> 상품</a>
            <a href="/" class="menu-item" style="color: #008485"> 펫스토리</a>
            <a href="/" class="menu-item" style="color: #008485"> 펫캘린더</a>
            <a href="/mypet" class="menu-item" style="color: #008485"> 마이펫</a>
        </div>

        <%-- 로그인이 된 상태이면 로그아웃, 아니면 로그인 --%>
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>
        <div class="login-register">
            <a href="/logout" class="logout">로그아웃</a>
            <span class="myinfo"><%=name%>님 반갑습니다 :)</span>
        </div>
        <%} else {%>
        <div class="login-register">
            <a href="/login" class="login">로그인</a>
            <a href="/register" class="register">회원가입</a>
        </div>
        <%}%>
    </div>
</header>
</html>