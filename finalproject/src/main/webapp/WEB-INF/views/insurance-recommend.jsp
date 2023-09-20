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
<jsp:include page="include/header.jsp"/>

<div class="body">
    <div class="chart-container1">
        <c:forEach var="dataList" items="${breedData}">
            <div class="chart-container1-1">
                <div class="chart-head">${dataList[0].breed}</div>
                <div style="width: 400px">
                    <canvas id="memberChart_${dataList[0].breed}"></canvas>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script>
    <c:forEach var="dataList" items="${breedData}">
    var ctx = document.getElementById(`memberChart_${dataList[0].breed}`).getContext('2d');
    var labels = [];
    var data = [];

    <c:forEach var="item" items="${dataList}">
    labels.push("${item.disease}");
    data.push(${item.percentage});
    </c:forEach>

    labels.push("그외");
    var total = data.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
    data.push(100 - total);

    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                data: data,
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
    </c:forEach>
</script>

</body>