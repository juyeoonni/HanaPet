<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

        .m {
            padding: 35px;
            display: none;
            background: #FFFFFF;
            position: fixed;
            top: 50%; /* 화면 세로 중앙 */
            left: 50%; /* 화면 가로 중앙 */
            transform: translate(-50%, -50%); /* 화면 정중앙으로 위치 조정 */
            z-index: 9999;
            width: 60%;
            max-height: 80vh; /* 모달 창의 최대 높이를 화면 높이의 80%로 설정 */
            overflow-y: auto; /* 내부 스크롤을 auto로 변경 */
        }

        /* 바깥 스크린 스크롤 비활성화 */
        .modal-open {
            overflow: hidden;
        }

    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div id="banners">
        <%@ include file="include/banner.jsp" %>
        <div class="banner-right">
            <div id="banner2">
                <button id="openModalButton">모달 열기</button>

                <div id="myModal" class="m">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <div id="modalContent"></div>
                    </div>
                </div>
            </div>
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
    // document.addEventListener('DOMContentLoaded', function () {
    //     const animate_zoomIn = document.querySelectorAll('.scroll-zoomIn');
    //     const animate_fadeInUp = document.querySelectorAll('.scroll-fadeInUp');
    //     const animate_slideInLeft = document.querySelectorAll('.scroll-slideInLeft')
    //     const halfViewportHeight = window.innerHeight / 3; // 절반의 뷰포트 높이
    //
    //     function isElementInViewport(el) {
    //         const rect = el.getBoundingClientRect();
    //         return (
    //             rect.top >= -halfViewportHeight &&
    //             rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) + halfViewportHeight
    //         );
    //     }
    //
    //     function handleScroll() {
    //         animate_zoomIn.forEach(elem => {
    //             if (isElementInViewport(elem)) {
    //                 elem.classList.add('animate__animated', 'animate__zoomIn', 'slow', '5');
    //             }
    //         });
    //         animate_fadeInUp.forEach(elem => {
    //             if (isElementInViewport(elem)) {
    //                 elem.classList.add('animate__animated', 'animate__fadeInUp', 'slow', '5');
    //             }
    //         });
    //         animate_slideInLeft.forEach(elem => {
    //             if (isElementInViewport(elem)) {
    //                 elem.classList.add('animate__animated', 'animate__slideInLeft', 'slow', '7');
    //             }
    //         });
    //     }
    //
    //     window.addEventListener('scroll', handleScroll);
    //     handleScroll();
    // });

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
            $('.modal-c .end').css('display', 'block');
        }, 1000);
    }
</script>

</body>
<%@ include file="include/footer.jsp" %>
</html>