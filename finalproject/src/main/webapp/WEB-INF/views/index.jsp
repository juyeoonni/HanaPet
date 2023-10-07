<%@ page import="com.kopo.finalproject.joinsaving.model.dto.JoinSaving" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>

        .banners {
            display: flex;
        }

        .banner2 {
            background: var(--primary-color);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);
            border-radius: 13px;
            width: 300px;
            height: 72px;
            margin-left: 20px;
            margin-bottom: 15px;
            text-align: center;
        }

        .banner3 {
            background: #F2D8DD;
            /*box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);*/
            /*border-radius: 20px;*/
            width: 300px;
            height: 200px;
            margin-left: 20px;
            text-align: center;
        }

        .m {
            padding: 25px;
            display: none;
            background: #FFFFFF;
            position: fixed;
            top: 50%; /* 화면 세로 중앙 */
            left: 50%; /* 화면 가로 중앙 */
            transform: translate(-50%, -50%); /* 화면 정중앙으로 위치 조정 */
            z-index: 9999;
            width: 60%;
            max-height: 90vh; /* 모달 창의 최대 높이를 화면 높이의 80%로 설정 */
            overflow-y: auto; /* 내부 스크롤을 auto로 변경 */
            border: 3.5px solid #FAC6CE;
            border-radius: 20px;
        }

        .openModalButton {
            cursor: pointer;
        }

        .section {
            width: 1080px;
            margin: 0 auto;
            padding: 35px 0
        }

        .section_title {
            margin-bottom: 30px;
            text-align: center
        }

        .section_title.v2 {
            margin-bottom: 12px
        }

        .section_title h3 {
            font-size: 30px
        }

        .section_title p {
            font-size: 18px;
            margin-top: 10px;
            font-weight: 500;
        }

        .series_list {
            display: flex;
        }

        .series_list > li {
            position: relative;
            width: calc(1080px / 4);
            list-style-type: none;
        }

        .series_list > li + li::before {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            display: inline-block;
            content: '';
            width: 1px;
            height: 120px;
            background-color: #e2e2e2;
        }

        .series_list > li > a {
            display: flex;
            flex-direction: column;
            gap: 10px;
            text-align: center;
            font-size: 21px;
            font-weight: 700
        }

        .series_list > li > a > .list_icon_wrap {
            height: 160px;
            line-height: 103px
        }

        .series_list > li > a > img {
            margin: 0 auto
        }

        @media screen and (max-width: 768px) {
            .series_list {
                flex-wrap: wrap
            }

            .series_list > li {
                width: 50%;
                padding: 10px 5px
            }

            .series_list > li > a {
                flex-direction: row;
                justify-content: center;
                align-items: center;
                gap: 5px;
                text-align: left;
                font-size: 1rem;
            }

            .series_list > li > a > .list_icon_wrap {
                width: 64px;
                line-height: 42px;
                height: 42px;
                text-align: center
            }

            .series_list > li > a > .list_icon_wrap img {
                width: 63px;
                height: 200px;
            }

            .series_list > li:first-child > a > .list_icon_wrap {
                margin: -5px 0 0 -25px
            }

            .series_list > li:nth-of-type(2) > a > .list_icon_wrap {
                margin-top: -2px
            }

            .series_list > li:nth-of-type(3) > a > .list_icon_wrap img {
                width: 43px;
                height: auto;
                margin-left: 16px
            }

            .series_list > li:nth-of-type(4) > a > .list_icon_wrap img {
                width: 45px;
                height: auto;
                margin-left: 9px
            }

            .series_list > li + li::before {
                display: none;
            }

            .series_list > li:nth-of-type(2n)::before {
                position: absolute;
                left: 0;
                top: 50%;
                display: inline-block;
                content: '';
                width: 1px;
                height: 95%;
                background-color: #e8e8e8
            }

            .series_list > li:nth-of-type(n+3)::after {
                position: absolute;
                top: 0;
                left: 50%;
                transform: translateX(-50%);
                display: inline-block;
                content: '';
                width: calc(100% - 10px);
                height: 1px;
                background-color: #e8e8e8
            }

        }

        a {
            text-decoration-line: none !important;
        }

    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>

<%
    // 세션에서 accountNumber 값을 가져옴
    String accountNumber = (String) session.getAttribute("accountNumber");

    // accountNumber가 null이 아닌 경우 /invited로 리디렉션
    if (accountNumber != null) {
        response.sendRedirect("/invited");
    } else {
%>
<div class="banners">
    <%@ include file="include/banner.jsp" %>
</div>
<div class="body">
    <div id="myModal" class="m">
        <div class="modal-content" style="margin-top: 0px">
            <div class="close" style="cursor: pointer; text-align: end;">&times;</div>
            <div id="modalContent"></div>
        </div>
    </div>
    <section class="section">
        <div class="section_title">
            <h3 style="font-weight: bold">HanaPet 서비스</h3>
            <p>나랑 평생 함께하개!</p>
        </div>
        <ul class="series_list">
            <li>
                <a class="openModalButton">
                    <div class="list_icon_wrap">
                        <img src="/resources/img/test.png" width="190px">
                    </div>
                    <p>테스트</p>
                </a>
            </li>
            <li>
                <a href="/product">
                    <div class="list_icon_wrap">
                        <img src="/resources/img/main2.png" width="120px" style="margin-top: 48px;">
                    </div>
                    <p>펫공유적금</p>
                </a>
            </li>
            <li>
                <a href="/insurance-product">
                    <div class="list_icon_wrap">
                        <img src="/resources/img/main-3.png" width="120px" style="margin-top: 32px;">
                    </div>
                    <p>펫보험</p>
                </a>
            </li>
            <li>
                <a href="/petcalendar">
                    <div class="list_icon_wrap">
                        <img src="/resources/img/main4.png" width="160px" style="margin-top: 29px;">
                    </div>
                    <p>펫캘린더</p>
                </a>
            </li>
        </ul>
    </section>
<%--    <div class="section">--%>
<%--        <p>평생을 함께하는 가족인 반려견을 위한 특별한 금융 플랫폼, 그것이 "펫 금융 프로젝트"입니다. 반려견을 가족으로 여기고 그 노후를 위한 준비를 함께 할 수 있는 이 플랫폼은 오직--%>
<%--            돈의 문제만이 아닌, 가족 모두가 소통하고 협력하는 곳입니다.</p>--%>
<%--    </div>--%>

<%--    <!-- Section 1 -->--%>
<%--    <div class="section">--%>
<%--        <h2>펫 캘린더와 일정 공유</h2>--%>
<%--        <p>가족들과 함께하는 펫 캘린더로 손쉽게 반려견의 일정을 관리하세요. 중요한 일정을 빠르게 공유하며 가족들과 더 밀접하게 소통하세요.</p>--%>
<%--        &lt;%&ndash;        <img src="../../../resources/img/main_펫캘린더.svg" width="500px"/>&ndash;%&gt;--%>
<%--    </div>--%>

<%--    <!-- Section 5 -->--%>
<%--    <div class="section">--%>
<%--        <h2>적금 공유와 모임적금</h2>--%>
<%--        <p>선택한 적금을 가족들과 함께 공유하며, 반려견의 노후를 준비하세요. 모임 적금으로 더 많은 가족들이 함께 참여하여 특별한 순간을 만드세요.</p>--%>
<%--    </div>--%>

<%--    <!-- Final Section -->--%>
<%--    <div class="section">--%>
<%--        <p>"나랑 평생 함께하개"는 당신의 가족과 반려견, 그리고 소중한 적금을 통해 더 특별한 순간을 만들어 나갑니다. 더 많은 행복과 소중한 추억을 함께 나누어보세요!</p>--%>
<%--    </div>--%>

    <%
        }
    %>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const openModalButtons = document.querySelectorAll(".openModalButton");
        const m = document.getElementById("myModal");
        const modalContent = document.getElementById("modalContent");
        const closeSpan = document.getElementsByClassName("close")[0];

        openModalButtons.forEach(button => {
            button.addEventListener("click", function() {
                // "test-start.jsp"의 내용을 가져와 모달 내에 채웁니다.
                document.body.classList.add("modal-open"); // 바깥 스크린 스크롤 비활성화
                loadPage("test/start");
            });
        });

        closeSpan.addEventListener("click", function () {
            m.style.display = "none";
            modalContent.innerHTML = ""; // 모달 내용 초기화
            document.body.classList.remove("modal-open");
        });

        function loadPage(url) {
            // AJAX를 통해 페이지를 로드하여 모달 내에 채웁니다.
            fetch(url)
                .then(response => response.text())
                .then(data => {
                    modalContent.innerHTML = data;

                    // 모달 내 링크 클릭 이벤트 처리
                    modalContent.addEventListener("click", function (event) {
                        if (event.target.tagName === "A") {
                            console.log(url);
                            event.preventDefault();
                            loadPage(event.target.getAttribute("href"));
                            if ("/test/4" === url) {
                                resultFunc();
                            }
                        }
                    });
                });

            m.style.display = "block";
        }
    });

    function resultFunc() {
        setTimeout(function () {
            $('.modal-c .top1').css('display', 'none');
            $('.modal-c .top2').css('display', 'block');
            $('.modal-c .middle').css('display', 'block');
            $('.modal-c .end').css('display', 'flex');
            $('.modal-c .end').css('justify-content', 'center');
            $('.modal-c .end').css('gap', '25px');
        }, 1200);
    }
</script>

</body>
<%@ include file="include/footer.jsp" %>
