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

    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.16/dist/tailwind.min.css" rel="stylesheet">

    <link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" type="text/css"
          rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: #E1E6DE !important;
            border: 1px solid #E1E6DE !important;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
            background: var(--primary-color) !important;
            border: 1px solid var(--primary-color) !important;
            color: white !important;
        }

        button.dt-button, div.dt-button, a.dt-button {
            position: relative;
            display: inline-block;
            box-sizing: border-box;
            margin-right: 0.333em;
            margin-bottom: 0.333em;
            padding: 10px 10px 7px 10px;
            border: 1px solid white;
            border-radius: 10px;
            cursor: pointer;
            font-size: 10px;
            line-height: 1.6em;
            color: #324D3D;
            white-space: nowrap;
            overflow: hidden;
            background-color: #e9e9e9;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            text-decoration: none;
            outline: none
        }

        button.dt-button span {
            font-size: 17px;
        }

        .menu-title {
            font-weight: bold;
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        input[type="search" i] {
            margin-bottom: 25px;
        }

        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        p {
            margin: 0;
        }

        .card {
            margin: 20px 0;
            padding: 20px 30px;
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
            margin-bottom: 1.5rem;
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-clip: border-box;
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

        th {
            font-size: 18px;
        }

        td {
            font-size: 17px;
        }

        input[type="search" i] {
            margin-bottom: 25px;
        }

        table.dataTable.stripe > tbody > tr.odd > *, table.dataTable.display > tbody > tr.odd > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        table.dataTable.stripe > tbody > tr.odd.selected > *, table.dataTable.display > tbody > tr.odd.selected > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        table.dataTable.stripe > tbody > tr.even > *, table.dataTable.display > tbody > tr.even > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        table.dataTable.stripe > tbody > tr.even.selected > *, table.dataTable.display > tbody > tr.even.selected > * {
            box-shadow: inset 0 0 0 9999px rgba(255, 255, 255, 0) !important;
            background-color: white !important;
        }

        table.dataTable thead > tr > th.sorting:before, table.dataTable thead > tr > th.sorting_asc:before, table.dataTable thead > tr > th.sorting_desc:before, table.dataTable thead > tr > th.sorting_asc_disabled:before, table.dataTable thead > tr > th.sorting_desc_disabled:before, table.dataTable thead > tr > td.sorting:before, table.dataTable thead > tr > td.sorting_asc:before, table.dataTable thead > tr > td.sorting_desc:before, table.dataTable thead > tr > td.sorting_asc_disabled:before, table.dataTable thead > tr > td.sorting_desc_disabled:before {
            bottom: 54.5%;
            content: "▲"/"";
            font-size: 10px;
        }

        table.dataTable thead > tr > th.sorting:after, table.dataTable thead > tr > th.sorting_asc:after, table.dataTable thead > tr > th.sorting_desc:after, table.dataTable thead > tr > th.sorting_asc_disabled:after, table.dataTable thead > tr > th.sorting_desc_disabled:after, table.dataTable thead > tr > td.sorting:after, table.dataTable thead > tr > td.sorting_asc:after, table.dataTable thead > tr > td.sorting_desc:after, table.dataTable thead > tr > td.sorting_asc_disabled:after, table.dataTable thead > tr > td.sorting_desc_disabled:after {
            top: 54.5%;
            content: "▼"/"";
            font-size: 10px;
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
                    <td style="text-align: end"><fmt:formatNumber value="${insu.insuranceAmount}" type="number"
                                                                  pattern="#,###원"/></td>
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
        $.noConflict();
        $('#myTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'excel', 'pdf', 'print'
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/ko.json"
            },
            "paging": true,
            "info": true,
            "initComplete": function (settings, json) {
                let excelButtonSpan = document.querySelector('.buttons-excel span');

                if (excelButtonSpan) {
                    excelButtonSpan.textContent = '엑셀';
                }
            }
        });
    });

    document.getElementById('account-name').textContent += "[" + sessionStorage.getItem("accountName") + "]";
</script>
