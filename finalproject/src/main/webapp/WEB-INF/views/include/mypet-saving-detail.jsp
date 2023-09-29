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
    <script src="/resources/js/apiKey.js"></script>

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
        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
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

        #transactionTable_wrapper {
            margin-top: 100px;
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

        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        p {
            margin: 0;
        }

        .card {
            margin: 20px 0;
            /*padding: 20px 30px;*/
        }

        .mx1 {
            margin: 0 1px;
        }

        .p-green {
            background-color: #75A989;
        }

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
            text-align: center;
            align-self: center;
            font-size: 30px;
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
            border: 3px solid #75A989;
            padding: 20px;
        }

        .c-container h4 {
            font-size: 26px;
            margin-bottom: 10px;
        }

        .c p {
            font-size: 17px;
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
    </style>
</head>

<body>
<%@ include file="header.jsp" %>

<div class="body">
    <div class="card text-white mb-3" style="padding: 30px 80px">
        <div class="card-header">
            <img src="/resources/img/${info[0].categoryImg}" width="80px"/>
            ${info[0].savingName}</div>
        <div class="card-body">

            <div class="card" style="margin: 0px;
            border: none;">
                <c:set var="progressRate" value="${info[0].progressRate}"/>
                <c:set var="progressRateAsDouble" value="${progressRate * 1.0}"/>

                <c:choose>
                    <c:when test="${progressRateAsDouble >= 0 && progressRateAsDouble < 25}">
                        <div style="align-self: center;">시작은 어렵지만, 꾸준히 모아보세요! 💪</div>
                    </c:when>
                    <c:when test="${progressRateAsDouble >= 25 && progressRateAsDouble < 50}">
                        <div style="align-self: center;"> 멋져요! 이미 절반을 향해 달려가고 있어요! 🚀</div>
                    </c:when>
                    <c:when test="${progressRateAsDouble >= 50 && progressRateAsDouble < 75}">
                        <div style="align-self: center;">절반 이상을 정복했어요! 끝까지 힘을 내요! 🔥</div>
                    </c:when>
                    <c:when test="${progressRateAsDouble >= 75 && progressRateAsDouble <= 100}">
                        <div style="align-self: center;">목표를 향한 마지막 스퍼트! 🌟</div>
                    </c:when>
                </c:choose>

                <br>
                <div id="progressBarContainer"></div>

            </div>


            <div class="relative w-64" style="width: 98%; margin-top: 80px; margin-bottom: 45px">

                <div class="absolute left-4 bottom-4 bg-red-600 h-full w-full rounded-xl"
                     style="background: #75A989"></div>

                <div class="relative bg-gray-800 text-gray-50 rounded-xl p-8 space-y-7" style="background: #CFDBC8">

                    <div class="h-2 w-20" style="background: #75A989; margin-left: 60px"></div>

                    <div class="text-5xl font-extrabold text-white"
                         style="display: flex; gap: 150px; padding-left: 60px">
                        <div style="color: white; font-weight: normal">
                            계좌 번호: ${info[0].accountNumber}
                            <br> <br>
                            적금 상품: ${info[0].category}
                            <br> <br>
                            개설자: ${info[0].guestName}
                            <br> <br>
                            현재 잔액: <fmt:formatNumber value="${info[0].balance}" type="number" pattern="#,###원"/>
                        </div>

                        <div style="color: white; font-weight: normal">
                            적금 개설일: ${info[0].openingDate.split(" ")[0]}<br> <br>
                            적금 만기 예정일: ${info[0].endDate.split(" ")[0]}<br> <br>
                            적금 만기 시 원금: <fmt:formatNumber value="${info[0].finalAmount}" type="number"
                                                          pattern="#,###원"/><br> <br>
                            적금 만기 시 이자: <fmt:formatNumber value="${info[0].interestAmount}" type="number"
                                                          pattern="#,###원"/>
                        </div>
                    </div>
                </div>
            </div>


            <br>
            <hr>
            <div style="display: flex">
                <div>
                    <div>참여자 정보</div>
                    <c:forEach var="infoItem" items="${info}">
                        <c:if test="${infoItem.openerId eq infoItem.guestId}">
                            <div class="c" data-label="소유자">
                                <div class="c-container">
                                    <p>이름: ${infoItem.guestName}</p>
                                    <p>가입일: ${infoItem.joinDate.split(" ")[0]}</p>
                                    <p>현재까지 기여 금액: <fmt:formatNumber value="${infoItem.contributionAmount}"
                                                                     type="number"
                                                                     pattern="#,###원"/></p>
                                    <p>기여도: ${infoItem.contributionRatio}%</p>
                                    <p>납입 금액: <fmt:formatNumber value="${infoItem.transferAmount}" type="number"
                                                                pattern="#,###원"/></p>
                                    <p>납입 주기: ${infoItem.transferPeriod}</p>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${infoItem.openerId ne infoItem.guestId}">
                            <div class="c" data-label="참여자">
                                <div class="c-container">
                                    <p>이름: ${infoItem.guestName}</p>
                                    <p>가입일: ${infoItem.joinDate.split(" ")[0]}</p>
                                    <p>현재까지 기여 금액: <fmt:formatNumber value="${infoItem.contributionAmount}"
                                                                     type="number"
                                                                     pattern="#,###원"/></p>
                                    <p>기여도: ${infoItem.contributionRatio}%</p>
                                    <p>납입 금액: <fmt:formatNumber value="${infoItem.transferAmount}" type="number"
                                                                pattern="#,###원"/></p>
                                    <p>납입 주기: ${infoItem.transferPeriod}</p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:if test="${fn:length(info) == 1}">
                        <style>
                            .c {
                                margin-top: 100px;
                            }
                        </style>
                    </c:if>
                </div>

                <div class="card"
                     style="align-self: center; margin-top: 50px; width: 100%; border: 1px solid rgba(19, 24, 44, .125);">
                    <div class="card-header" style="align-self: center; margin-bottom: 25px;">기여도</div>
                    <div class="card-body" style=" padding: 20px; width: 100%;">
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
                        <canvas id="chart-line" class="chartjs-render-monitor"
                                style="display: block; height: 105px; width: 210px;" height="131" width="262"></canvas>
                    </div>
                </div>
            </div>

            <table id="transactionTable" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>회차</th>
                    <th>이름</th>
                    <th>입금 계좌</th>
                    <th>출금 계좌</th>
                    <th>납입일</th>
                    <th>납입금</th>
                    <th>잔액</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="i" value="${history_info.size()}"/>
                <c:forEach var="historyItem" items="${history_info}">
                    <tr>
                        <td>${i}회차</td>
                        <td>${historyItem.guestName}</td>
                        <td>${historyItem.accountNumberIn}</td>
                        <td>${historyItem.accountNumberOut}</td>
                        <td>${historyItem.transferDate.split(" ")[0]}</td>
                        <td><fmt:formatNumber value="${historyItem.amount}" type="number" pattern="#,###원"/></td>
                        <td><fmt:formatNumber value="${historyItem.balanceAfterIn}" type="number"
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
</body>
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
            "order": [[0, 'desc']], // 거래일시를 내림차순으로 정렬
            "paging": false, // 페이지 나누기 사용
            "info": false
        });

        // Find the button element by its class name
        $(".buttons-excel span").text("엑셀");
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
        var progressBarContainer = $("<div style='width: 100%; height: 30px; border-radius: 20px; background: #f2f2f2;'>").addClass("progress");

        var progressBar = $("<div style='background:linear-gradient(to right, #d3959b, #bfe6ba)'>").addClass("progress-bar")
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
</html>
