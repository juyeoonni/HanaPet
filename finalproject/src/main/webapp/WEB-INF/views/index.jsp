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
    <link rel="stylesheet" href="path/to/bootstrap.css">
    <script src="path/to/bootstrap.js"></script>
    <style>

        .banners {
            display: flex;
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

        #myModal .modal-dialog {
            top: 30px;
            width: 900px;
            max-width: 100%;
            height: 500px;
            margin: auto;
            padding: 30px;
        }

    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>

<%
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
    <%
        }
    %>
</div>

<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalContent">
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("myModal").addEventListener('hidden.bs.modal', function () {
        const modalBackdrop = document.querySelector('.modal-backdrop');
        if (modalBackdrop) modalBackdrop.remove();
    });
    document.addEventListener("DOMContentLoaded", function () {
        const openModalButtons = document.querySelectorAll(".openModalButton");
        const modalInstance = new bootstrap.Modal(document.getElementById("myModal"));

        openModalButtons.forEach(button => {
            button.addEventListener("click", function () {
                loadPage("test/start");
                modalInstance.show();
            });
        });

        document.getElementById("myModal").addEventListener('hidden.bs.modal', function () {
            const modalContent = document.getElementById("modalContent");
            modalContent.innerHTML = "";
            document.body.style.overflow = "";
        });

        function loadPage(url) {

            const modalBackdrop = document.querySelector('.modal-backdrop');
            if (modalBackdrop) modalBackdrop.remove();

            fetch(url)
                .then(response => response.text())
                .then(data => {
                    document.getElementById("modalContent").innerHTML = data;

                    document.getElementById("modalContent").addEventListener("click", function (event) {
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

            const modalInstance = new bootstrap.Modal(document.getElementById("myModal"));
            modalInstance.show();
        }
    });

    function resultFunc() {
        setTimeout(function () {
            const modalContent = document.querySelector('.modal-c');

            modalContent.querySelector('.top1').style.display = 'none';
            modalContent.querySelector('.top2').style.display = 'block';
            modalContent.querySelector('.middle').style.display = 'block';
            const endSection = modalContent.querySelector('.end');
            endSection.style.display = 'flex';

            endSection.style.justifyContent = 'center';
            endSection.style.gap = '25px';
        }, 1200);
    }
</script>
</body>
<%@ include file="include/footer.jsp" %>
