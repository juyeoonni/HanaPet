<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPet</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css"/>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

    <script src="https://cdn.datatables.net/plug-ins/1.11.5/i18n/KOREAN.json"></script>

</head>
<style>

    .menu-title {
        text-align: center;
        font-weight: bold;
        font-size: 30px;
        margin-bottom: 20px;
    }

    tr {
        background: var(--primary-color);
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

    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        background: #E1E6DE !important;
        border: 1px solid #E1E6DE !important;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
        background: var(--primary-color) !important;
        border: 1px solid var(--primary-color) !important;
        color: white !important;
    }

    table.dataTable thead > tr > th.sorting:before, table.dataTable thead > tr > th.sorting_asc:before, table.dataTable thead > tr > th.sorting_desc:before, table.dataTable thead > tr > th.sorting_asc_disabled:before, table.dataTable thead > tr > th.sorting_desc_disabled:before, table.dataTable thead > tr > td.sorting:before, table.dataTable thead > tr > td.sorting_asc:before, table.dataTable thead > tr > td.sorting_desc:before, table.dataTable thead > tr > td.sorting_asc_disabled:before, table.dataTable thead > tr > td.sorting_desc_disabled:before {
        bottom: 54.5%;
        content: "▲"/"";
    }

    table.dataTable thead > tr > th.sorting:after, table.dataTable thead > tr > th.sorting_asc:after, table.dataTable thead > tr > th.sorting_desc:after, table.dataTable thead > tr > th.sorting_asc_disabled:after, table.dataTable thead > tr > th.sorting_desc_disabled:after, table.dataTable thead > tr > td.sorting:after, table.dataTable thead > tr > td.sorting_asc:after, table.dataTable thead > tr > td.sorting_desc:after, table.dataTable thead > tr > td.sorting_asc_disabled:after, table.dataTable thead > tr > td.sorting_desc_disabled:after {
        top: 54.5%;
        content: "▼"/"";
    }
</style>
<body>
<%@ include file="header.jsp" %>
<div class="body">
    <div class="card text-white mb-3">
        <div class="menu-title">거래 내역 조회</div>
        <div style="text-align: center;" id="account-name">
            ${historyList[0].account_number}
        </div>
        <br>
        <br>
        <div class="card-body">
            <table id="myTable" class="display" style="width:100%">
                <thead>
                <tr>
                    <th style="color:white; text-align: center">거래일시</th>
                    <th style="color:white; text-align: center">구분</th>
                    <th style="color:white; text-align: center">거래 금액</th>
                    <th style="color:white; text-align: center">거래 후 잔액</th>
                    <th style="color:white; text-align: center">거래 구분</th>
                    <th style="color:white; text-align: center">내용</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="historyItem" items="${historyList}">
                    <tr>
                        <td style="text-align: center">${historyItem.transaction_date}</td>
                        <td style="text-align: center">${historyItem.inout}</td>
                        <td style="text-align: end"><fmt:formatNumber value="${historyItem.transaction_amount}" type="number"
                                              pattern="#,###원"/></td>
                        <td style="text-align: end"><fmt:formatNumber value="${historyItem.balance}" type="number" pattern="#,###원"/></td>
                        <td style="text-align: center">${historyItem.transaction_class}</td>
                        <td>${historyItem.content}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        new DataTable('#myTable', {
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/ko.json',
            },
            order: [[0, 'desc']] // 첫 번째 열(거래일시)을 내림차순으로 정렬
        });
    });

    document.getElementById('account-name').textContent += "[" + sessionStorage.getItem("accountName") + "]";
</script>
</body>

</html>
