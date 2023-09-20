<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>insurance-recommend</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
    </style>

</head>

<body>
<%@ include file="include/header.jsp" %>

<div class="body">
    <div class="chart-container1">
        <div class="chart-container1-1">
            <div class="chart-head">${breedData[0].breed}</div>
            <div style="width: 400px">
                <canvas id="memberChart"></canvas>
            </div>
        </div>
        <%--        <div class="chart-container1-2">--%>
        <%--            <div class="chart-head">5년간 카드가입수 추이</div>--%>
        <%--            <canvas id="cardChart" width="400" height="200"></canvas>--%>
        <%--        </div>--%>
    </div>
</div>
<%
    String guest_id = (String) session.getAttribute("guest_id");
    // 여기서 필요한 세션값과 변수들을 설정하세요
%>

<script>
    let ctx1 = document.getElementById('memberChart').getContext('2d');
    let labels1 = [];
    let data1 = [];

    <c:forEach var="item" items="${breedData}">
    labels1.push("${item.disease}");
    data1.push(${item.percentage});
    </c:forEach>
    labels1.push("그외");
    let total = data1.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
    data1.push(100 - total);
    let myChart1 = new Chart(ctx1, {
        type: 'doughnut',
        data: {
            labels: labels1,
            datasets: [{
                data: data1,
                borderColor: '#fff',
                borderWidth: 1,
                backgroundColor: [
                    '#edafb8',
                    '#f7e1d7',
                    '#dedbd2',
                    '#b0c4b1',
                    '#4a5759'
                ]
            }]
        },
        options: {
            plugins: {
                legend: {
                    display: false
                },
                title: {
                    display: true,
                    text: 'TOP3',
                    font: {
                        size: 18
                    }
                }
            }
        }
    });


</script>

</body>
