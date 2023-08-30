<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>

        #banners {
            display: flex;
        }

        #banner2 {
            background: #BFDFCB;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
            width: 300px;
            height: 193px;
            margin-left: 20px;
            margin-bottom: 14px;
        }

        #banner3 {
            background: #F2D8DD;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
            width: 300px;
            height: 193px;
            margin-left: 20px;
        }

        .middle-box {
            background: #E1E6DE;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
            width: 100%;
            height: 200px;
            margin-top: 50px;
        }

    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div id="banners">
        <%@ include file="include/banner.jsp" %>
        <div class="banner-right">
            <div id="banner2"></div>
            <div id="banner3">
            </div>
        </div>
    </div>
    <div class="middle-box">

    </div>
    <div>
        <%
            if ((String) session.getAttribute("name") != null) {
        %>
        <div></div>
        <%} else {%>

<%--        <div class="section">--%>
<%--            <p>평생을 함께하는 가족인 반려견을 위한 특별한 금융 플랫폼, 그것이 "펫 금융 프로젝트"입니다. 반려견을 가족으로 여기고 그 노후를 위한 준비를 함께 할 수 있는 이 플랫폼은 오직--%>
<%--                돈의 문제만이 아닌, 가족 모두가 소통하고 협력하는 곳입니다.</p>--%>
<%--        </div>--%>

<%--        <div class="section">--%>
<%--            <p>"나랑 평생 함께하개"는 당신의 가족과 반려견, 그리고 소중한 적금을 통해 더 특별한 순간을 만들어 나갑니다. 더 많은 행복과 소중한 추억을 함께 나누어보세요!</p>--%>
<%--        </div>--%>
        <%}%>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const animate_zoomIn = document.querySelectorAll('.scroll-zoomIn');
        const animate_fadeInUp = document.querySelectorAll('.scroll-fadeInUp');
        const animate_slideInLeft = document.querySelectorAll('.scroll-slideInLeft')
        const halfViewportHeight = window.innerHeight / 3; // 절반의 뷰포트 높이

        function isElementInViewport(el) {
            const rect = el.getBoundingClientRect();
            return (
                rect.top >= -halfViewportHeight &&
                rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) + halfViewportHeight
            );
        }

        function handleScroll() {
            animate_zoomIn.forEach(elem => {
                if (isElementInViewport(elem)) {
                    elem.classList.add('animate__animated', 'animate__zoomIn', 'slow', '5');
                }
            });
            animate_fadeInUp.forEach(elem => {
                if (isElementInViewport(elem)) {
                    elem.classList.add('animate__animated', 'animate__fadeInUp', 'slow', '5');
                }
            });
            animate_slideInLeft.forEach(elem => {
                if (isElementInViewport(elem)) {
                    elem.classList.add('animate__animated', 'animate__slideInLeft', 'slow', '7');
                }
            });
        }

        window.addEventListener('scroll', handleScroll);
        handleScroll();
    });
</script>

</body>
<%@ include file="include/footer.jsp" %>
</html>