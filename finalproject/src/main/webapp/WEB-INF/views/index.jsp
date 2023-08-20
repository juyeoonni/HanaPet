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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .section {
            padding: 20px;
            /*background-color: #f5f5f5;*/
            border-bottom: 1px solid #ccc;
        }

        h2 {
            margin-top: 0;
        }

        .one {
            margin-top: 30px;
        }

        .two {
            margin: 130px 0 90px 0;
        }
    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class>
    <%@ include file="include/banner.jsp" %>

    <div>
        <%
            if ((String) session.getAttribute("name") != null) {
        %>
        <div>
            <img src="../../../resources/img/life-event.png" style="width:1000px;">
        </div>
        <div>
            토리는 현재 성년기에요!
        </div>
        <%} else {%>
        <div class="body">

            <div class="section">
                <p>평생을 함께하는 가족인 반려견을 위한 특별한 금융 플랫폼, 그것이 "펫 금융 프로젝트"입니다. 반려견을 가족으로 여기고 그 노후를 위한 준비를 함께 할 수 있는 이 플랫폼은 오직
                    돈의 문제만이 아닌, 가족 모두가 소통하고 협력하는 곳입니다.</p>
            </div>

            <!-- Section 1 -->
            <div class="section scroll-target">
                <h2>반려견 생애주기와 추천 적금</h2>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                    <div>
                        <div>
                            <img src="../../../resources/img/main_생애주기별.svg" width="400px"
                                 class="scroll-zoomIn"/>
                            <p class="one">7가지 다양한 카테고리에서 당신의 반려견을 위한 최적의 적금 상품을 찾아보세요. 단기부터 장기, 그리고 특별한 선택까지 가족 모두 함께
                                결정할 수
                                있습니다.</p>
                            <button> 적금 상품 찾으러 가기</button>
                        </div>
                    </div>
                    <div>
                        <p class="two"> 당신의 반려견의 생애주기에 따라 더 나은 미래를 위한 적금을 선택하세요. 우리는 가장 적합한 상품을 추천하여 소중한 친구를 위한 특별한 적금을
                            찾아드립니다.</p>
                        <img src="../../../resources/img/main_추천적금.svg" width="360px" class="scroll-zoomIn"/>
                    </div>
                </div>
            </div>

            <!-- Section 2 -->
            <div class="section">
                <div style="display: flex;">
                    <div>
                        <img src="../../../resources/img/main_펫스토리1.svg" height="430px" class="scroll-fadeInUp">
                    </div>
                    <div style="text-align: center; margin-left: 40px;">
                        <div style="margin-top: 10px;">
                            <h2>펫 스토리와 프라이빗한 공간</h2>
                        </div>
                        <img src="../../../resources/img/main_펫스토리2.svg" width="500px" style="margin-top: 50px"
                             class="scroll-slideInLeft">

                        <p style="margin-top: 50px">
                            반려견 한 마리마다 고유한 펫 스토리 공간을 소유하세요. 가족들과 함께하는 소중한 순간을 기록하고, 모두가 볼 수 없는 특별한 공간에서 공유하세요.</p>

                        <button> 반려견의 소중한 순간 기록하러 가기</button>
                    </div>
                </div>
            </div>

            <!-- Section 3 -->
            <div class="section">
                <h2>펫 캘린더와 일정 공유</h2>
                <p>가족들과 함께하는 펫 캘린더로 손쉽게 반려견의 일정을 관리하세요. 중요한 일정을 빠르게 공유하며 가족들과 더 밀접하게 소통하세요.</p>
                <img src="../../../resources/img/main_펫캘린더.svg" width="500px"/>
            </div>

            <!-- Section 5 -->
            <div class="section">
                <h2>적금 공유와 모임적금</h2>
                <p>선택한 적금을 가족들과 함께 공유하며, 반려견의 노후를 준비하세요. 모임 적금으로 더 많은 가족들이 함께 참여하여 특별한 순간을 만드세요.</p>
            </div>

            <!-- Section 6 -->
            <div class="section">
                <h2>알림톡 알림과 자동이체</h2>
                <p>적금 만기일 알림부터 자동이체까지, 중요한 소식을 놓치지 마세요. 편리한 알림톡으로 소중한 정보를 더 빠르게 받아보세요.</p>
            </div>

            <!-- Final Section -->
            <div class="section">
                <p>"나랑 평생 함께하개"는 당신의 가족과 반려견, 그리고 소중한 적금을 통해 더 특별한 순간을 만들어 나갑니다. 더 많은 행복과 소중한 추억을 함께 나누어보세요!</p>
            </div>
        </div>
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
</html>