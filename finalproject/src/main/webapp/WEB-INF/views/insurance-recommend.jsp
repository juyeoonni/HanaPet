<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>insurance-recommend</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
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
    <h2>반려견의 TOP1</h2>
    <c:forEach var="dataList" items="${breedData}">
        <p>${dataList.breed}</p>
        <p>${dataList.disease}</p>
    </c:forEach>

    <canvas id="breedChart"></canvas>

    <select id="ageDropdown">
        <c:forEach var="ageItem" items="${ageTopThree}">
            <option value="${ageItem.age_group}">${ageItem.age_group}</option>
        </c:forEach>
    </select>
    <div style="width: 400px;">
        <canvas id="diseaseChart"></canvas>
    </div>


</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // breedRatio를 위한 막대차트
        let breedLabels = [];
        let breedPercentages = [];

        <c:forEach var="data" items="${breedRatio}">
        breedLabels.push("${data.breed}");
        breedPercentages.push("${data.percentage}");
        </c:forEach>

        let breedCtx = document.getElementById('breedChart').getContext('2d');
        new Chart(breedCtx, {
            type: 'bar',
            data: {
                labels: breedLabels,
                datasets: [{
                    label: '퍼센트',
                    data: breedPercentages,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            }
        });


        // Global variable to hold the chart instance
        let myChart;

        document.getElementById("ageDropdown").addEventListener('change', function () {
            let selectedAge = this.value;
            let selectedData;

            <c:forEach var="data" items="${ageTopThree}">
            if ("<c:out value="${data.age_group}"/>" === selectedAge) {
                selectedData = {
                    diseases: [
                        "${data.top_disease_1}",
                        "${data.top_disease_2}",
                        "${data.top_disease_3}"
                    ],
                    percentages: [
                        "${data.top_disease_1_percentage}",
                        "${data.top_disease_2_percentage}",
                        "${data.top_disease_3_percentage}"
                    ]
                };
            }
            </c:forEach>

            let diseaseCtx = document.getElementById('diseaseChart').getContext('2d');

            // If chart instance exists, destroy it to avoid overlaying
            if (myChart) {
                myChart.destroy();
            }

            myChart = new Chart(diseaseCtx, {
                type: 'doughnut',
                data: {
                    labels: selectedData.diseases,
                    datasets: [{
                        data: selectedData.percentages,
                        backgroundColor: [
                            '#edafb8',
                            '#f7e1d7',
                            '#dedbd2',
                            '#b0c4b1',
                            '#4a5759'
                        ]
                    }]
                }
            });
        });
    });
</script>


<%--<div class="body">--%>
<%--    <div class="chart-container1">--%>
<%--        <c:forEach var="dataList" items="${breedRatio}">--%>
<%--            <div class="chart-container1-1">--%>
<%--                <div class="chart-head">${dataList.breed}</div>--%>
<%--                <div style="width: 200px">--%>
<%--                    <canvas id="memberChart_${dataList.breed}"></canvas>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    <c:forEach var="dataList" items="${breedRatio}">--%>
<%--    var ctx = document.getElementById(`memberChart_${dataList.breed}`).getContext('2d');--%>
<%--    var labels = [];--%>
<%--    var data = [];--%>

<%--    labels.push("${dataList.breed}");--%>
<%--    data.push(${dataList.percentage});--%>

<%--    labels.push("그외");--%>
<%--    var total = data.reduce((accumulator, currentValue) => accumulator + currentValue, 0);--%>
<%--    data.push(100 - total);--%>

<%--    var myChart = new Chart(ctx, {--%>
<%--        type: 'doughnut',--%>
<%--        data: {--%>
<%--            labels: labels,--%>
<%--            datasets: [{--%>
<%--                data: data,--%>
<%--                borderColor: '#fff',--%>
<%--                borderWidth: 1,--%>
<%--                backgroundColor: [--%>
<%--                    '#edafb8',--%>
<%--                    '#f7e1d7',--%>
<%--                    '#dedbd2',--%>
<%--                    '#b0c4b1',--%>
<%--                    '#4a5759'--%>
<%--                ]--%>
<%--            }]--%>
<%--        },--%>
<%--        options: {--%>
<%--            plugins: {--%>
<%--                legend: {--%>
<%--                    display: false--%>
<%--                },--%>
<%--                title: {--%>
<%--                    display: true,--%>
<%--                    text: 'TOP3',--%>
<%--                    font: {--%>
<%--                        size: 18--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>
<%--    </c:forEach>--%>
<%--</script>--%>
