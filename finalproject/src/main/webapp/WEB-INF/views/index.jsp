<%@ page import="com.kopo.finalproject.joinsaving.model.dto.JoinSaving" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
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

        #openModalButton:hover {
            transform: scale(1.02);
        }

        .middle-box {
            /*background: #E1E6DE;*/
            /*box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);*/
            border-radius: 20px;
            /*width: 70%;*/
            height: 200px;
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

        #openModalButton {
            cursor: pointer;
        }

        /* 바깥 스크린 스크롤 비활성화 */
        /* 바깥 스크린 스크롤 비활성화 */
        .modal-open {
            overflow: hidden;
        }

        /*MARQUEE {*/
        /*    width: 230px;*/
        /*    margin-top: 6px;*/
        /*    height: 26px;*/
        /*    text-align: center;*/
        /*}*//* ETN ì´ëž€? */
        .section {
            width: 1080px;
            margin: 0 auto;
            padding: 35px 0
        }

        .section_bg {
            background-color: #ebecee;
            padding: 92px 0 110px 0
        }

        .section_title {
            margin-bottom: 40px;
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
            color: #333
        }

        .about_list {
            display: flex;
            flex-wrap: wrap;
            gap: 15px
        }

        .about_list > li {
            width: calc(1080px / 3 - 10px);
            background-color: #fff;
            border-radius: 10px;
            transition: all 0.3s
        }

        .about_list > li:hover {
            background-color: #e7280e;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.3)
        }

        .about_list > li:hover a {
            color: #fff;
        }

        .about_list > li:hover > a .ico_wrap {
            background-color: #fff;
        }

        .about_list > li > a {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 25px
        }

        .about_list > li > a .ico_wrap {
            width: 82px;
            height: 82px;
            line-height: 76px;
            text-align: center;
            background-color: #f3f4f5;
            border-radius: 50%
        }

        .about_list > li > a > .about_title > h4 {
            font-size: 21px;
            margin-bottom: 6px
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
            width: 1px;
            height: 120px;
            background-color: #e2e2e2
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
            <h3 class="spot">메리츠시리즈</h3>
            <p>메리츠증권의 <span class="eng">ETN</span> 상품을 확인해보세요!</p>
        </div>
        <ul class="series_list">
            <li>
                <a id="openModalButton">
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
                    <p>펫적금</p>
                </a>
            </li>
            <li>
                <a href="/insurance-product">
                    <div class="list_icon_wrap">
                        <img src="/resources/img/main-3.png" width="120px"  style="margin-top: 32px;">
                    </div>
                    <p>펫보험</p>
                </a>
            </li>
            <li>
                <a href="/petcalendar">
                    <div class="list_icon_wrap">
                        <img src="/resources/img/main4.png"  width="160px"  style="margin-top: 29px;">
                    </div>
                    <p>펫캘린더</p>
                </a>
            </li>
        </ul>
    </section>
    <div style="display:flex; margin-top: -5px; justify-content: space-between">
    </div>

    <%
        }
    %>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const openModalButton = document.getElementById("openModalButton");
        const m = document.getElementById("myModal");
        const modalContent = document.getElementById("modalContent");
        const closeSpan = document.getElementsByClassName("close")[0];

        openModalButton.addEventListener("click", function () {
            // "test-start.jsp"의 내용을 가져와 모달 내에 채웁니다.
            document.body.classList.add("modal-open"); // 바깥 스크린 스크롤 비활성화
            loadPage("test/start");
        });

        // var url = "/insurance-recommend"
        // document.getElementById("insurance-recommend").addEventListener("click", function () {
        //     window.location.href = url;
        // })


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
