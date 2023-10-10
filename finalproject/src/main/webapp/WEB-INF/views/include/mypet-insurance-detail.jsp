<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css"/>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

    <script src="https://cdn.datatables.net/plug-ins/1.11.5/i18n/KOREAN.json"></script>


    <style>
        .menu-title {
            font-weight: bold;
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        p {
            margin: 0;
        }

        .card {
            margin: 20px 0;
            padding: 20px 30px;
        }

        .mx1 {
            margin: 0 1px;
        }

        /*.p-green {*/
        /*    background-color: var(--primary-color);*/
        /*}*/

        .progress {
            height: 12px;
            position: relative;
            overflow: visible;
        }


        .fas {
            font-size: 20px;
            color: #636363;
            padding-right: 20px;
        }

        .icon1 {
            font-size: 10px;
            position: absolute;
            background-color: #FFFF;
            width: 30px;
            height: 30px;
            border: 1px solid #ddd;
            border-radius: 50%;
            right: 0;
            top: -10px;
        }

        .icon2 {
            font-size: 10px;
            position: absolute;
            background-color: #FFFF;
            width: 30px;
            height: 30px;
            border: 1px solid #ddd;
            border-radius: 50%;
            /*left: 50%;*/
            top: -10px;
        }

        .far.fa-star {
            font-size: 10px;
            padding: 10px;
        }

        .fas.fa-check {
            font-size: 10px;
            padding: 10px;
            color: #237518;
        }

        .flex {
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto
        }

        @media (max-width: 991.98px) {
            .padding {
                padding: 1.5rem
            }
        }

        @media (max-width: 767.98px) {
            .padding {
                padding: 1rem
            }
        }

        .padding {
            padding: 5rem
        }

        .card {
            background: #fff;
            border-width: 0;
            border-radius: .25rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, .05);
            margin-bottom: 1.5rem
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border-radius: .25rem
        }

        .card-header {
            color: #324D3D;
            font-size: 30px;
            align-self: center;
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            background-color: rgba(19, 24, 44, .03);
            border-bottom: 1px solid rgba(19, 24, 44, .125)
        }

        .card-header:first-child {
            border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
        }

        card-footer,
        .card-header {
            background-color: transparent;
            border-color: rgba(160, 175, 185, .15);
            background-clip: padding-box
        }

        .c_container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .c {
            width: 350px;
            height: 150px;
            border-radius: 14px;
            padding: 20px;
            position: relative;

        }

        .c .c-container {
            width: 100%;
            height: 100%;
            position: relative;
            background-color: #fff;
            z-index: 10;
            border-radius: 10px;
            padding: 15px;
            padding-top: 50px;

        }

        .c-container h4 {
            font-size: 26px;
            margin-bottom: 10px;
        }

        .c p {
            font-size: 17px;
        }

        .c::before {
            position: absolute;
            content: '';
            background-color: #fc5185;
            height: 35px;
            width: 35px;
            top: 3rem;
            right: -23px;
            transform: rotate(45deg);
            z-index: 10;

        }


        .c::after {
            position: absolute;
            content: attr(data-label);
            top: 27px;
            padding-left: 20px;
            padding: 10px;
            right: -31px;
            width: 8rem;
            background-color: #fc5185;
            z-index: 12;
            border-bottom-left-radius: 20px;
            border-top-left-radius: 20px;
            border-top-right-radius: 10px;
            color: #fff;
        }

        .menu-title {
            font-weight: bold;
            text-align: center;
            font-size: 30px;
            margin-bottom: 20px;
        }

        /*tr {*/
        /*    background: var(--primary-color);*/
        /*}*/

        th {
            font-size: 18px;
        }

        td {
            font-size: 17px;
        }

        input[type="search" i] {
            margin-bottom: 25px;
        }

        /* odd 클래스의 배경색과 그림자를 흰색으로 설정 */
        table.dataTable.stripe > tbody > tr.odd > *, table.dataTable.display > tbody > tr.odd > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        /* 선택된 항목에 대한 스타일도 흰색으로 설정 */
        table.dataTable.stripe > tbody > tr.odd.selected > *, table.dataTable.display > tbody > tr.odd.selected > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        /* odd 클래스의 배경색과 그림자를 흰색으로 설정 */
        table.dataTable.stripe > tbody > tr.even > *, table.dataTable.display > tbody > tr.even > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        /* 선택된 항목에 대한 스타일도 흰색으로 설정 */
        table.dataTable.stripe > tbody > tr.even.selected > *, table.dataTable.display > tbody > tr.even.selected > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        table.dataTable thead > tr > th.sorting:before, table.dataTable thead > tr > th.sorting_asc:before, table.dataTable thead > tr > th.sorting_desc:before, table.dataTable thead > tr > th.sorting_asc_disabled:before, table.dataTable thead > tr > th.sorting_desc_disabled:before, table.dataTable thead > tr > td.sorting:before, table.dataTable thead > tr > td.sorting_asc:before, table.dataTable thead > tr > td.sorting_desc:before, table.dataTable thead > tr > td.sorting_asc_disabled:before, table.dataTable thead > tr > td.sorting_desc_disabled:before {
            bottom: 54.5%;
            content: "▲"/"";
        }

        table.dataTable thead > tr > th.sorting:after, table.dataTable thead > tr > th.sorting_asc:after, table.dataTable thead > tr > th.sorting_desc:after, table.dataTable thead > tr > th.sorting_asc_disabled:after, table.dataTable thead > tr > th.sorting_desc_disabled:after, table.dataTable thead > tr > td.sorting:after, table.dataTable thead > tr > td.sorting_asc:after, table.dataTable thead > tr > td.sorting_desc:after, table.dataTable thead > tr > td.sorting_asc_disabled:after, table.dataTable thead > tr > td.sorting_desc_disabled:after {
            top: 54.5%;
            content: "▼"/"";
        }

        .middle-title {
            font-family: net-medium;
            font-size: 26px;
            margin-bottom: 15px;
        }

        .info > tr > td {
            font-size: 20px;
        }
    </style>
</head>

<body>
<%@ include file="header.jsp" %>

<div class="body">
    <div class="card text-white mb-3" style="padding: 0 40px">
        <img src="/resources/img/insurance-logo.png" width="160px" style="align-self: center"/>
        <div class="card-header"> ${insu.insuranceName}</div>
        <div style="margin-top: 60px;" class="middle-title">보험 상세 정보
        </div>
        <table style="width: 100%; border-collapse: collapse; display: flex; gap: 250px;">
            <tbody class="info">
            <tr>
                <td style="padding: 8px; font-weight: bold;">이름</td>
                <td style="width: 30px;"></td>
                <td style="padding: 8px;">${insu.guestName}</td>
            </tr>
            <tr>
                <td style="padding: 8px; font-weight: bold;">반려견 이름</td>
                <td style="width: 30px;"></td>
                <td style="padding: 8px;">${insu.petName}</td>
            </tr>
            <tr>
                <td style="padding: 8px; font-weight: bold;">가입 일자</td>
                <td style="width: 30px;"></td>
                <td style="padding: 8px;">${insu.joinDate.split(" ")[0]}</td>
            </tr>
            <tr>
                <td style="padding: 8px; font-weight: bold;">연결 계좌</td>
                <td style="width: 30px;"></td>
                <td style="padding: 8px;">${insu.depositAccountNumber}</td>
            </tr>
            </tbody>
            <tbody class="info">
            <tr>
                <td style="padding: 8px; font-weight: bold;">보험 납입금</td>
                <td style="width: 30px;"></td>
                <td style="padding: 8px;"><fmt:formatNumber value="${insu.insuranceAmount}" type="number"
                                                            pattern="#,###원"/></td>
            </tr>
            <tr>
                <td style="padding: 8px; font-weight: bold;">납입 횟수</td>
                <td style="width: 30px;"></td>
                <td style="padding: 8px;">${insu.paymentCount}회</td>
            </tr>
            <tr>
                <td style="padding: 8px; font-weight: bold;">최종납입월</td>
                <td style="width: 30px;"></td>
                <td style="padding: 8px;">${insu.joinDate.substring(0,7)}</td>
            </tr>
            </tbody>
        </table>

        <div style="margin-top: 60px; margin-bottom: 15px;" class="middle-title">보험 납입 내역</div>
        <div class="cards">
            <table id="myTable" class="display" style="width:100%">
                <thead>
                <tr style="background: var(--primary-color);">
                    <th class="text-white" style="text-align: center">회차</th>
                    <th class="text-white" style="text-align: center">납입일</th>
                    <th class="text-white" style="text-align: center">납입방법</th>
                    <th class="text-white" style="text-align: center">납입금액</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="text-align: center">${insu.paymentCount}회차</td>
                    <td style="text-align: center">${insu.joinDate.split(" ")[0]}</td>
                    <td style="text-align: center">자동이체</td>
                    <td style="text-align: end"><fmt:formatNumber value="${insu.insuranceAmount}" type="number" pattern="#,###원"/></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div style="align-self: end; margin-top: 20px;">총 납입보험료: <fmt:formatNumber value="${insu.insuranceAmount}"
                                                                                   type="number"
                                                                                   pattern="#,###원"/></div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>

<script>
    $(document).ready(function () {
        new DataTable('#myTable', {
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/ko.json',
            },
            searching: false,     // 검색창 비활성화
            paging: false,        // 페이지네이션 비활성화
            lengthChange: false,   // 페이지당 표시 항목 수 설정 비활성화
            info: false
        });
    });

    document.getElementById('account-name').textContent += "[" + sessionStorage.getItem("accountName") + "]";
</script>
