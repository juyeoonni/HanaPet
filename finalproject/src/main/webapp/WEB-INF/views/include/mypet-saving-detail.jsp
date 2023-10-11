<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>이체 내역 조회</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/resources/javascript/apiKey.js"></script>

    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
    <script>
        Kakao.init(config.KAKAO_JAVASCRIPT_KEY); // 사용하려는 앱의 JavaScript 키 입력
    </script>
    <!-- 필요한 DataTables 스타일 및 스크립트 가져오기 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css"/>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

    <script src="https://cdn.datatables.net/plug-ins/1.11.5/i18n/KOREAN.json"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.16/dist/tailwind.min.css" rel="stylesheet">


    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet">
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
        .name {
            display: inline-block;
        }

        .bg-blue {
            background-color: var(--primary-color);
            border-radius: 8px;
        }

        .bg-blue > td {
            color: white;
        }

        .table thead th, .table td {
            border: none;
        }

        .table tbody td:first-child {
            border-bottom-left-radius: 10px;
            border-top-left-radius: 10px;
        }

        .table tbody td:last-child {
            border-bottom-right-radius: 10px;
            border-top-right-radius: 10px;
        }

        #spacing-row {
            height: 10px;
        }

        .table > :not(caption) > * > * {
            background-color: transparent;
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

        /* Hide the descending (downward arrow) sorting icon */

        .sorting::before .sorting::after {
            display: none !important;
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

        /*table.dataTable thead > tr > th.sorting:before, table.dataTable thead > tr > th.sorting_asc:before, table.dataTable thead > tr > th.sorting_desc:before, table.dataTable thead > tr > th.sorting_asc_disabled:before, table.dataTable thead > tr > th.sorting_desc_disabled:before, table.dataTable thead > tr > td.sorting:before, table.dataTable thead > tr > td.sorting_asc:before, table.dataTable thead > tr > td.sorting_desc:before, table.dataTable thead > tr > td.sorting_asc_disabled:before, table.dataTable thead > tr > td.sorting_desc_disabled:before {*/
        /*    bottom: 54.5%;*/
        /*    content: "▲"/"";*/
        /*}*/

        /*table.dataTable thead > tr > th.sorting:after, table.dataTable thead > tr > th.sorting_asc:after, table.dataTable thead > tr > th.sorting_desc:after, table.dataTable thead > tr > th.sorting_asc_disabled:after, table.dataTable thead > tr > th.sorting_desc_disabled:after, table.dataTable thead > tr > td.sorting:after, table.dataTable thead > tr > td.sorting_asc:after, table.dataTable thead > tr > td.sorting_desc:after, table.dataTable thead > tr > td.sorting_asc_disabled:after, table.dataTable thead > tr > td.sorting_desc_disabled:after {*/
        /*    top: 54.5%;*/
        /*    content: "▼"/"";*/
        /*}*/
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        p {
            margin: 0;
        }

        .progress {
            height: 12px;
            position: relative;
            overflow: visible;
        }

        .card {
            background: #fff;
            /*border-width: 0;*/
            border-radius: .25rem;
            /*box-shadow: 0 1px 3px rgba(0, 0, 0, .05);*/
            /*margin-bottom: 1.5rem*/
            border: none;
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            /*background-clip: border-box;*/
            /*border-radius: .25rem*/
        }

        .card-header {
            text-align: center;
            align-self: center;
            font-size: 34px;
            color: #324D3D;
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
            height: 240px;
            border-radius: 14px;
            padding: 20px 20px 20px 0px;
            position: relative;
        }

        .c .c-container {
            width: 90%;
            height: 100%;
            background-color: #fff;
            border-radius: 10px;
            border: 3px solid var(--primary-color);
            padding: 20px;
        }

        .c-container h4 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .c p {
            font-size: 19px;
        }

        .c::after {
            position: absolute;
            content: attr(data-label);
            top: -5px;
            padding: 10px 20px;
            right: 45px;
            background-color: #BFDFCB;
            z-index: 12;
            border-radius: 20px;
            color: #fff;
        }

        table.dataTable thead > tr > th.sorting:before, table.dataTable thead > tr > th.sorting_asc:before, table.dataTable thead > tr > th.sorting_desc:before, table.dataTable thead > tr > th.sorting_asc_disabled:before, table.dataTable thead > tr > th.sorting_desc_disabled:before,
        table.dataTable thead > tr > td.sorting:before,
        table.dataTable thead > tr > td.sorting_asc:before,
        table.dataTable thead > tr > td.sorting_desc:before,
        table.dataTable thead > tr > td.sorting_asc_disabled:before,
        table.dataTable thead > tr > td.sorting_desc_disabled:before {
            bottom: 50%;
            content: "";
            content: "";
        }

        table.dataTable thead > tr > th.sorting:after, table.dataTable thead > tr > th.sorting_asc:after, table.dataTable thead > tr > th.sorting_desc:after, table.dataTable thead > tr > th.sorting_asc_disabled:after, table.dataTable thead > tr > th.sorting_desc_disabled:after,
        table.dataTable thead > tr > td.sorting:after,
        table.dataTable thead > tr > td.sorting_asc:after,
        table.dataTable thead > tr > td.sorting_desc:after,
        table.dataTable thead > tr > td.sorting_asc_disabled:after,
        table.dataTable thead > tr > td.sorting_desc_disabled:after {
            top: 50%;
            content: "";
            content: "";
        }

        .desc {
            align-self: center;
            font-weight: bold;
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

<%@ include file="header.jsp" %>

<div class="body">
    <div class="card text-white mb-3" style="padding: 30px 40px">
        <div class="card-header">
            <img src="/resources/img/${info[0].categoryImg}" width="80px" style="margin-bottom: 10px;"/>
            ${info[0].savingName}</div>
        <div class="card-body">
            <div class="card" style="margin: 0px; border: none;">
                <c:set var="progressRate" value="${info[0].progressRate}"/>
                <c:set var="progressRateAsDouble" value="${progressRate * 1.0}"/>

                <c:choose>
                    <c:when test="${progressRateAsDouble >= 0 && progressRateAsDouble < 25}">
                        <div class="desc">시작은 어렵지만, 꾸준히 모아보세요! 💪</div>
                    </c:when>
                    <c:when test="${progressRateAsDouble >= 25 && progressRateAsDouble < 50}">
                        <div class="desc">멋져요! 이미 절반을 향해 달려가고 있어요! 🚀</div>
                    </c:when>
                    <c:when test="${progressRateAsDouble >= 50 && progressRateAsDouble < 75}">
                        <div class="desc">절반 이상을 정복했어요! 끝까지 힘을 내요! 🔥</div>
                    </c:when>
                    <c:when test="${progressRateAsDouble >= 75 && progressRateAsDouble <= 100}">
                        <div class="desc">목표를 향한 마지막 스퍼트! 🌟</div>
                    </c:when>
                </c:choose>

                <br><br>
                <div style="justify-content: space-between;display: flex;">
                    <div class="middle-title">적금 진행도</div>
                    <div id="progressBarContainer" style="width: 84%; margin-top: 5px"></div>
                </div>
            </div>

            <div class="middle-title" style="margin-top: 80px">적금 상세 정보</div>
            <c:if test="${info.size() == 1}">
            <table border="1"
                   style="width: 100%; border-collapse: collapse; display: flex; gap: 250px;">
                </c:if>
                <c:if test="${info.size() > 1}">
                <table border="1"
                       style="width: 100%; border-collapse: collapse; display: flex; gap: 30px;">
                    </c:if>
                    <tbody class="info">
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">계좌 번호</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;">${info[0].accountNumber}</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">적금 상품</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;">${info[0].category}</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">개설자</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;">${info[0].guestName}</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">현재 잔액</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;"><fmt:formatNumber value="${info[0].balance}" type="number"
                                                                    pattern="#,###원"/></td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">금리(연율)</td>
                        <td style="width: 30px;"></td>
                        <c:if test="${info.size() == 1}">
                            <td style="padding: 8px;">${info[0].rate}% (기본 금리)</td>
                        </c:if>
                        <c:if test="${info.size() > 1}">
                            <td style="padding: 8px;">${info[0].rate}% (기본 금리) + <span
                                    style="color: var(--primary-color); font-weight: bold; font-size: 20px">${info[0].priorRate * (info.size()-1)}% (우대 금리 적용)</span>=
                                <span style="font-size: 20px; font-weight: bold; color: var(--primary-color)">${info[0].rate + info[0].priorRate * (info.size()-1)}%</span>
                            </td>
                        </c:if>
                    </tr>
                    </tbody>
                    <tbody class="info">
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">연결 계좌</td>
                        <td style="width: 30px;"></td>
                        <c:forEach var="infoItem" items="${info}">
                            <c:if test="${sessionScope.guest_id eq infoItem.guestId}">
                                <td style="padding: 8px;">${infoItem.depositAccountNumber}</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">적금 개설일</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;">${info[0].openingDate.split(" ")[0]}</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">적금 만기 예정일</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;">${info[0].endDate.split(" ")[0]}</td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">적금 만기 시 원금</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;"><fmt:formatNumber value="${info[0].finalAmount}" type="number"
                                                                    pattern="#,###원"/></td>
                    </tr>
                    <tr>
                        <td style="padding: 8px; font-weight: bold;">적금 만기 시 이자</td>
                        <td style="width: 30px;"></td>
                        <td style="padding: 8px;"><fmt:formatNumber value="${info[0].interestAmount}" type="number"
                                                                    pattern="#,###원"/></td>
                    </tr>
                    </tbody>
                </table>
                <br>
                <hr>
                <div style="display: flex">
                    <div class="container rounded mt-0 bg-white p-0">
                        <div class="middle-title" style="margin-top: 50px">공유 적금 참여자</div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">구분</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">적금 가입일</th>
                                    <th scope="col">총 기여 금액</th>
                                    <th scope="col">기여도</th>
                                    <th scope="col">납입 금액</th>
                                    <th scope="col">납입 주기</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="infoItem" items="${info}">
                                    <!-- 소유자의 정보 -->
                                    <c:if test="${infoItem.openerId eq infoItem.guestId}">
                                        <tr class="bg-blue">
                                            <td class="pt-2 mt-1">개설자</td>
                                            <td class="pt-2 mt-1">${infoItem.guestName}</td>
                                            <td class="pt-2 mt-1">${infoItem.joinDate.split(" ")[0]}</td>
                                            <td class="pt-2"><fmt:formatNumber value="${infoItem.contributionAmount}"
                                                                               type="number" pattern="#,###원"/></td>
                                            <td class="pt-2">${infoItem.contributionRatio}%</td>
                                            <td class="pt-2"><fmt:formatNumber value="${infoItem.transferAmount}"
                                                                               type="number"
                                                                               pattern="#,###원"/></td>
                                            <td class="pt-2">${infoItem.transferPeriod}</td>
                                        </tr>
                                        <tr id="spacing-row">
                                            <td></td>
                                        </tr>
                                    </c:if>

                                    <!-- 참여자의 정보 -->
                                    <c:if test="${infoItem.openerId ne infoItem.guestId}">
                                        <tr class="bg-blue ">
                                            <td class="pt-2 mt-1">참여자</td>
                                            <td class="pt-2 mt-1">${infoItem.guestName}</td>
                                            <td class="pt-2 mt-1">${infoItem.joinDate.split(" ")[0]}</td>
                                            <td class="pt-2"><fmt:formatNumber value="${infoItem.contributionAmount}"
                                                                               type="number" pattern="#,###원"/></td>
                                            <td class="pt-2">${infoItem.contributionRatio}%</td>
                                            <td class="pt-2"><fmt:formatNumber value="${infoItem.transferAmount}"
                                                                               type="number"
                                                                               pattern="#,###원"/></td>
                                            <td class="pt-2">${infoItem.transferPeriod}</td>
                                        </tr>
                                        <tr id="spacing-row">
                                            <td></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>

                    <div class="card"
                         style="align-self: center; margin-top: 90px; width: 45%;">
                        <div class="card-body" style="width: 100%; padding: 0px;">
                            <iframe class="chartjs-hidden-iframe"
                                    style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; inset: 0px;"></iframe>
                            <iframe class="chartjs-hidden-iframe"
                                    style="width: 400px;display: block;border: 0px;height: 0px;margin: 0px;position: absolute;inset: 0px;"></iframe>
                            <div class="chartjs-size-monitor"
                                 style="position: absolute;left: 0px;top: 0px;right: 0px;bottom: 0px;overflow: hidden;pointer-events: none;visibility: hidden;width: 400px;z-index: -1;">
                                <div class="chartjs-size-monitor-expand"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                </div>
                                <div class="chartjs-size-monitor-shrink"
                                     style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                    <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                </div>
                            </div>
                            <canvas id="chart-line" class="chartjs-render-monitor"></canvas>
                        </div>
                    </div>
                </div>

                <div class="middle-title" style="margin-top: 50px">이체 내역</div>
                <table id="transactionTable" class="display" style="width:100%">
                    <thead>
                    <tr style="background: var(--primary-color) !important">
                        <th class="text-white" style="text-align: center">회차</th>
                        <th class="text-white" style="text-align: center">이름</th>
                        <th class="text-white" style="text-align: center">입금 계좌</th>
                        <th class="text-white" style="text-align: center">출금 계좌</th>
                        <th class="text-white" style="text-align: center">납입일</th>
                        <th class="text-white" style="text-align: center">납입금</th>
                        <th class="text-white" style="text-align: center">잔액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="i" value="${history_info.size()}"/>
                    <c:forEach var="historyItem" items="${history_info}">
                        <tr>
                            <td>${i}회차</td>
                            <td style="text-align: center">${historyItem.guestName}</td>
                            <td style="text-align: center">${historyItem.accountNumberIn}</td>
                            <td style="text-align: center">${historyItem.accountNumberOut}</td>
                            <td style="text-align: center">${historyItem.transferDate.split(" ")[0]}</td>
                            <td style="text-align: end"><fmt:formatNumber value="${historyItem.amount}" type="number"
                                                                          pattern="#,###원"/></td>
                            <td style="text-align: end"><fmt:formatNumber value="${historyItem.balanceAfterIn}"
                                                                          type="number"
                                                                          pattern="#,###원"/></td>
                        </tr>
                        <c:set var="i" value="${i - 1}"/>
                    </c:forEach>
                    </tbody>
                </table>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>

</div>
</html>

<%@ include file="footer.jsp" %>
<script>
    $(document).ready(function () {
        // DataTable 초기화
        $.noConflict();
        $('#transactionTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'excel', 'pdf', 'print'
            ],
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.13.6/i18n/ko.json"
            },
            "order": [[4, 'desc']], // 거래일시를 내림차순으로 정렬
            "paging": true, // 페이지 나누기 사용
            "info": true,
            "initComplete": function (settings, json) {
                // '엑설' 버튼의 span 요소를 선택
                let excelButtonSpan = document.querySelector('.buttons-excel span');

                // span의 텍스트를 '엑셀'로 변경
                if (excelButtonSpan) {
                    excelButtonSpan.textContent = '엑셀';
                }
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        var ctx = $("#chart-line");

        // Initialize arrays to hold labels and data
        var labels = [];
        var data = [];

        // Iterate through info array and populate labels and data arrays
        <c:forEach var="infoItem" items="${info}">
        labels.push("${infoItem.guestName}");
        data.push(${infoItem.contributionRatio});
        </c:forEach>

        new Chart(ctx, {
            type: 'pie', // Change chart type if needed
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    backgroundColor: ["#ee9ca7", "#bfe6ba"]
                }]
            },
            options: {}
        });

        var progressBar = createProgressBar(${info[0].progressRate});
        $("#progressBarContainer").append(progressBar);
    });

    function createProgressBar(progressRate) {
        var progressBarContainer = $("<div style='width: 100%; height: 30px; border-radius: 20px; background: #e7e0e0;'>").addClass("progress");

        var progressBar = $("<div style='background-image: linear-gradient(to top, #c1dfc4 0%, #deecdd 100%);'>").addClass("progress-bar")
            .attr("role", "progressbar")
            .attr("aria-valuemin", "0")
            .attr("aria-valuemax", "100")
            .css("width", "0%")
            .css("borderRadius", "20px");

        var progressText = $("<div style='text-align: center; color: #324D3D; font-size: 14px; margin-left: 10px; margin-top: 4px; z-index: 2; padding-right: 4px; align-self: self-end;'>").text(Math.round(progressRate) + "%");
        progressBar.append(progressText);
        progressBarContainer.append(progressBar);
        var container = progressBarContainer;
        progressBar.animate({width: progressRate + '%'}, 650); // 0.6초 동안 애니메이션 실행

        return container;
    }
</script>
