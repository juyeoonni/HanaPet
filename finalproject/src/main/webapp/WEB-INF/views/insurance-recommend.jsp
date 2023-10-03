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
        .form-select {
            width: 200px; /* 원하는 너비 설정 */
            border-radius: 8px; /* 둥근 모서리 */
            font-size: 16px; /* 글자 크기 */
            transition: background-color 0.3s ease; /* 부드러운 효과를 위한 transition */
        }

        .form-select:hover {
            background-color: #f8f8f8; /* 마우스 호버 시 배경색 변경 */
        }

        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 60px;
        }
    </style>


</head>
<jsp:include page="include/header.jsp"/>

<div class="body">
    <div class="menu-title">
        보험 추천
    </div>
    <div style="display: flex; place-content: center; justify-content: space-between; padding: 0px 50px">
        <div style="width: 450px; text-align: center">
            <h5>가장 주의해야할 질병</h5><br><br>
            <c:forEach var="dataList" items="${breedData}">
                <p>${dataList.breed} => ${dataList.disease}</p>
            </c:forEach>
        </div>

        <div style="width: 400px; text-align: -webkit-center;">
            <h5>나이대별 질병 TOP3</h5>
            <select id="ageDropdown" class="form-select">
                <c:forEach var="ageItem" items="${ageTopThree}">
                    <option value="${ageItem.age_group}">${ageItem.age_group}</option>
                </c:forEach>
            </select>
            <br>
            <canvas id="diseaseChart"></canvas>
        </div>

    </div>
<br><br>
    <div style="display:flex; place-content: center">
        <div style="width: 650px; text-align: center">
            <h5>가장 많은 품종</h5>
            <canvas id="breedChart"></canvas>
        </div>
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

        // Global variable to hold the chart instance
        let myChart;

        function updateDiseaseChart(age) {
            let selectedData;

            <c:forEach var="data" items="${ageTopThree}">
            if ("${data.age_group}" === age) {
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
        }

        // Update the chart when ageDropdown value changes
        document.getElementById("ageDropdown").addEventListener('change', function () {
            updateDiseaseChart(this.value);
        });

        // Set default value for ageDropdown and update the chart accordingly
        let ageDropdown = document.getElementById("ageDropdown");
        ageDropdown.value = "1살 미만";
        updateDiseaseChart("1살 미만");
    });
</script>

