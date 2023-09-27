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
    tr {
        background: #75A989;
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
        background: #75A989 !important;
        border: 1px solid #75A989 !important;
        color: white !important;
    }

    #myTable_info {
        font-size: 16px !important; /* 원하는 크기로 변경 */
        padding-left: 10px !important;
    }
</style>
<body>
<%@ include file="header.jsp" %>
<div class="body">
    <div class="card text-white mb-3">
        <div class="card-header">거래 내역</div>
        <div class="card-body">
            <table id="myTable" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>거래일시</th>
                    <th>구분</th>
                    <th>거래 금액</th>
                    <th>거래 후 잔액</th>
                    <th>거래 구분</th>
                    <th>내용</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="historyItem" items="${historyList}">
                    <tr>
                        <td>${historyItem.transaction_date}</td>
                        <td>${historyItem.inout}</td>
                        <td><fmt:formatNumber value="${historyItem.transaction_amount}" type="number"
                                              pattern="#,###"/></td>
                        <td><fmt:formatNumber value="${historyItem.balance}" type="number" pattern="#,###"/></td>
                        <td>${historyItem.transaction_class}</td>
                        <td>${historyItem.content}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $.noConflict();
        $('#myTable').DataTable();
    });

    var table = new DataTable('#myTable', {
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/ko.json',
        },
    });

</script>
</body>
</html>
