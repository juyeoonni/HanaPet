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
            background: #BFDFCB;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
            width: 300px;
            height: 122px;
            margin-left: 20px;
            padding: 30px;
            margin-bottom: 15px;
            cursor: pointer;
            text-align: center;
        }

        .banner3 {
            background: #F2D8DD;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
            width: 300px;
            height: 263px;
            margin-left: 20px;
            padding: 5px;
            cursor: pointer;
            text-align: center;
        }

        .banner2:hover, .banner3:hover {
            box-shadow: 2px 2px 10px #a5a5a5;
            transform: scale(1.02);
        }

        .middle-box {
            background: #E1E6DE;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
            width: 100%;
            height: 200px;
            margin-top: 30px;
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

        /* 바깥 스크린 스크롤 비활성화 */
        .modal-open {
            overflow: hidden;
        }
    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="body">
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
        <div class="banner-right">
            <div class="banner2" id="insurance-recommend">
                <div style="margin-top: -20px">
                    <%--                    <img src="/resources/img/insurance-dog.png" style="width: 130px; margin-left: 30px"/>--%>
                </div>
            </div>
            <div class="banner3" id="openModalButton">
                <img src="/resources/img/main-test.svg" style="width: 220px">
            </div>
        </div>
    </div>

    <div id="myModal" class="m">
        <div class="modal-content">
            <div class="close" style="cursor: pointer; text-align: end;">&times;</div>
            <div id="modalContent"></div>
        </div>
    </div>
    <div class="middle-box">

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
