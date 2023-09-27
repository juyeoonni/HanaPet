<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.kopo.finalproject.savingaccount.model.dto.MyPageHistoryInfo" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">--%>
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
    <style>
        .menu-title {
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
            border: 1px solid rgba(19, 24, 44, .125);
            border-radius: .25rem
        }

        .card-header {
            color: black;
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
    </style>
</head>

<body>
<%@ include file="header.jsp" %>

<div class="body">
<%--    <div class="card text-white mb-3">--%>
<%--        <div class="card-header"> ${info[0].savingName}</div>--%>
<%--        <div class="card-body">--%>

<%--            <div class="card">--%>
<%--                <c:set var="progressRate" value="${info[0].progressRate}"/>--%>
<%--                <c:set var="progressRateAsDouble" value="${progressRate * 1.0}"/>--%>

<%--                <c:choose>--%>
<%--                    <c:when test="${progressRateAsDouble >= 0 && progressRateAsDouble < 25}">--%>
<%--                        <div>시작은 어렵지만, 꾸준히 모아보세요! 💪</div>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${progressRateAsDouble >= 25 && progressRateAsDouble < 50}">--%>
<%--                        <div> 멋져요! 이미 절반을 향해 달려가고 있어요! 🚀</div>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${progressRateAsDouble >= 50 && progressRateAsDouble < 75}">--%>
<%--                        <div>절반 이상을 정복했어요! 끝까지 힘을 내요! 🔥</div>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${progressRateAsDouble >= 75 && progressRateAsDouble <= 100}">--%>
<%--                        <div>목표를 향한 마지막 스퍼트! 🌟</div>--%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>

<%--                <br>--%>
<%--                <div class="progress mb-2">--%>
<%--                    <div class="progress-bar p-green mx1" role="progressbar" style="width: ${info[0].progressRate}%"--%>
<%--                         aria-valuenow="20"--%>
<%--                         aria-valuemin="0" aria-valuemax="100">--%>
<%--                    </div>--%>
<%--                    <div class="icon1 d-flex align-items-center justify-content-center">--%>
<%--                        <span class="far fa-star "></span>--%>
<%--                    </div>--%>
<%--                    <div class="icon2 d-flex align-items-center justify-content-center"--%>
<%--                         style="left: ${info[0].progressRate}%">--%>
<%--                        <span class="fas fa-check "></span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- infos 공통 부분 출력 -->--%>
<%--            <p> 계좌 번호: ${info[0].accountNumber}</p>--%>
<%--            <p> 적금 개설일: ${info[0].openingDate}</p>--%>
<%--            <p> 적금 만기 예정일: ${info[0].endDate}</p>--%>
<%--            <p> 적금 상품: ${info[0].category}</p>--%>
<%--            <img src="/resources/img/${info[0].categoryImg}" width="40px"/>--%>
<%--            <p>개설자: ${info[0].openerId}</p>--%>
<%--            <p> 현재 잔액: <fmt:formatNumber value="${info[0].balance}" type="number" pattern="#,###원"/></p>--%>

<%--            <p> 진행률: ${info[0].progressRate}</p>--%>
<%--            <p> 적금 만기 시 원금: <fmt:formatNumber value="${info[0].finalAmount}" type="number" pattern="#,###원"/></p>--%>
<%--            <p> 적금 만기 시 이자: <fmt:formatNumber value="${info[0].interestAmount}" type="number" pattern="#,###원"/></p>--%>
<%--            <br>--%>
<%--            <hr>--%>
<%--            <div>참여자 정보</div>--%>
<%--            <c:forEach var="infoItem" items="${info}">--%>
<%--                <c:if test="${infoItem.openerId eq infoItem.guestId}">--%>
<%--                    <div class="c" data-label="Coming Soon">--%>
<%--                        <div class="c-container">--%>
<%--                            <p>이름: ${infoItem.guestId}</p>--%>
<%--                            <p>가입일: ${infoItem.joinDate}</p>--%>
<%--                            <p>현재까지 기여 금액: <fmt:formatNumber value="${infoItem.contributionAmount}" type="number"--%>
<%--                                                             pattern="#,###원"/></p>--%>
<%--                            <p>기여도: ${infoItem.contributionRatio}</p>--%>
<%--                            <p>가입 금액: <fmt:formatNumber value="${info[0].transferAmount}" type="number"--%>
<%--                                                        pattern="#,###원"/></p>--%>
<%--                            <p>납입 주기: ${infoItem.transferPeriod}</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:if>--%>
<%--                <c:if test="${infoItem.openerId ne infoItem.guestId}">--%>
<%--                    <div style="border: 1px solid; margin-bottom: 10px">--%>
<%--                        <p>이름: ${infoItem.guestId}</p>--%>
<%--                        <p>가입일: ${infoItem.joinDate}</p>--%>
<%--                        <p>현재까지 기여 금액: <fmt:formatNumber value="${infoItem.contributionAmount}" type="number"--%>
<%--                                                         pattern="#,###원"/></p>--%>
<%--                        <p>기여도: ${infoItem.contributionRatio}</p>--%>
<%--                        <p>가입 금액: <fmt:formatNumber value="${info[0].transferAmount}" type="number"--%>
<%--                                                    pattern="#,###원"/></p>--%>
<%--                        <p>납입 주기: ${infoItem.transferPeriod}</p>--%>
<%--                    </div>--%>
<%--                </c:if>--%>


<%--            </c:forEach>--%>
<%--            <hr>--%>


<%--            <div class="page-content page-container" id="page-content">--%>
<%--                <div class="padding">--%>
<%--                    <div class="row">--%>
<%--                        <div class="container-fluid d-flex justify-content-center">--%>
<%--                            <div class="col-sm-8 col-md-6">--%>
<%--                                <div class="card">--%>
<%--                                    <div class="card-header">기여도</div>--%>
<%--                                    <div class="card-body">--%>
<%--                                        <div class="chartjs-size-monitor"--%>
<%--                                             style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">--%>
<%--                                            <div class="chartjs-size-monitor-expand"--%>
<%--                                                 style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">--%>
<%--                                                <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>--%>
<%--                                            </div>--%>
<%--                                            <div class="chartjs-size-monitor-shrink"--%>
<%--                                                 style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">--%>
<%--                                                <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <canvas id="chart-line" width="299" height="200" class="chartjs-render-monitor"--%>
<%--                                                style="display: block; width: 299px; height: 200px;"></canvas>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <script>--%>
<%--                $(document).ready(function () {--%>
<%--                    var ctx = $("#chart-line");--%>
<%--                    new Chart(ctx, {--%>
<%--                        type: 'pie',--%>
<%--                        data: {--%>
<%--                            labels: ["Spring", "Summer"],--%>
<%--                            datasets: [{--%>
<%--                                data: [${info[0].contributionRatio}, ${info[1].contributionRatio}],--%>
<%--                                backgroundColor: ["rgba(255, 0, 0, 0.5)", "rgba(100, 255, 0, 0.5)", "rgba(200, 50, 255, 0.5)", "rgba(0, 100, 255, 0.5)"]--%>
<%--                            }]--%>
<%--                        },--%>
<%--                        options: {--%>
<%--                            title: {--%>
<%--                                display: true,--%>
<%--                                text: '적금 참여자'--%>
<%--                            }--%>
<%--                        }--%>
<%--                    });--%>
<%--                });--%>
<%--            </script>--%>
<%--            <div style="display: flex;">--%>
<%--                <span>전체 보기</span>/--%>
<%--                <span>내 내역만 보기</span>--%>
<%--            </div>--%>

<%--            <div class="container d-flex justify-content-center mt-50 mb-50">--%>
<%--                <div class="card w-100">--%>
<%--                    <div class="card-header header-elements-inline">--%>
<%--                        <h5 class="card-title" style="margin-left: -20px;"><b style=" font-size: 24px !important;">거래--%>
<%--                            내역</b></h5>--%>
<%--                        <div class="header-elements">--%>
<%--                            <div class="list-icons text-muted font-weight-light">--%>
<%--                                <a class="list-icons-item" data-action="collapse" data-abc="true"><i--%>
<%--                                        class="fa fa-minus font-weight-light"></i></a>--%>
<%--                                <a class="list-icons-item" data-action="reload" data-abc="true"><i--%>
<%--                                        class="fa fa-refresh"></i></a>--%>
<%--                                <a class="list-icons-item" data-action="remove" data-abc="true"><i--%>
<%--                                        class="fa fa-close"></i></a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="table-responsive">--%>
<%--                        <table class="table">--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <th>회차</th>--%>
<%--                                <th>이름</th>--%>
<%--                                <th>입금 계좌</th>--%>
<%--                                <th>출금 계좌</th>--%>
<%--                                <th>납입일</th>--%>
<%--                                <th>납입금</th>--%>
<%--                                <th>잔액</th>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>

<%--                            <div style="border: 1.5px solid">--%>
<%--                                <c:set var="i" value="${history_info.size()}"/>--%>
<%--                                <c:forEach var="historyItem" items="${history_info}">--%>
<%--                                <tr>--%>
<%--                                    <td>${i}회차</td>--%>
<%--                                    <td> ${historyItem.guestId}</td>--%>
<%--                                    <td> ${historyItem.accountNumberIn}</td>--%>
<%--                                    <td> ${historyItem.accountNumberOut}</td>--%>
<%--                                    <td> ${historyItem.transferDate.split(" ")[0]}</td>--%>
<%--                                    <td><fmt:formatNumber value="${historyItem.amount}" type="number"--%>
<%--                                                          pattern="#,###원"/>--%>
<%--                                    </td>--%>
<%--                                    <td><fmt:formatNumber value="${historyItem.balanceAfterIn}" type="number"--%>
<%--                                                          pattern="#,###원"/></td>--%>
<%--                            </div>--%>
<%--                            <c:set var="i" value="${i - 1}"/>--%>
<%--                            </tr>--%>
<%--                            </c:forEach>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js'></script>--%>

<%--</div>--%>
</body>
</html>
