<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            width: 100%; /* 원하는 너비 설정 */
            border-radius: 8px; /* 둥근 모서리 */
            font-size: 20px; /* 글자 크기 */
            transition: background-color 0.3s ease; /* 부드러운 효과를 위한 transition */
        }

        .form-select:hover {
            background-color: #f8f8f8; /* 마우스 호버 시 배경색 변경 */
        }

        .menu-title {
            font-weight: bold;
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        #selectedDisease {
            margin-top: 40px;
            margin-bottom: 30px;
            font-weight: bold;
            color: var(--primary-color);
        }

        .center {
            text-align: center;
            margin-bottom: 70px;
            margin-top: 50px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .center:hover {
            transform: translateY(-10px); /* 위로 10px 움직임 */
        }

        .center:hover ~ .center {
            transform: translateY(10px); /* 아래로 10px 움직임 */
        }


        .title {
            background: #E1E6DE;
            box-shadow: 4px 4px 4px 4px rgba(0.1, 0.1, 0.1, 0.1);
            border-radius: 8px;
            height: 40px;
            padding-top: 9px;
            font-weight: bold;
        }

        .box {
            display: flex;
            place-content: center;
        }

        .top-box {
            background: #E1E6DE;
            box-shadow: 4px 4px 4px 4px rgba(0.1, 0.1, 0.1, 0.1);
            border-radius: 15px;
            padding: 30px 30px 30px 70px;
            margin-bottom: 90px;
            width: 100%;
            height: 150px;
            display: flex;
            justify-content: space-between;
        }

        .insurance-product {
            padding: 30px 50px;
            margin-bottom: 30px;
            border: 3px solid #E1E6DE; /* 5px 크기의 #BFDFCB 테두리 설정 */
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
        }

        .tag {
            display: inline-block;
            background-color: #E1E6DE;
            padding: 5px 10px;
            margin: 5px;
            border-radius: 5px;
        }

        .selected-value {
            display: inline-block;
            background-color: var(--primary-color);
            padding: 5px 10px;
            margin: 5px;
            border-radius: 5px;
            color: white;
        }


        .details-btn {
            display: inline-block;
            padding: 8px 12px;
            background-color: var(--primary-color);
            color: #FFFFFF;
            border-radius: 4px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .details-btn:hover {
            transform: scale(1.02);

        }
    </style>


</head>
<jsp:include page="include/header.jsp"/>

<div class="body">
    <div class="menu-title">
        보험 추천
    </div>
    <div class="box">
        <div class="top-box">
            <div>
                <h4 style="font-weight: bold">우리 아이에게 딱 맞는 펫보험은?🔍</h4>
                <br>
                <h5 style="font-weight: bold; color: var(--primary-color);">나이와 품종으로 추천 보험을 알려줄개, 우리
                    아이의 정보를 입력해보개!</h5>
            </div>
            <div>
                <img src="/resources/img/insurance-dog.png" style="margin-top: -10px; width: 190px">
            </div>
        </div>
    </div>
    <div style="display: flex; place-content: center; justify-content: space-between; padding: 0px 50px">
        <div style="width: 450px; text-align: center">
            <h5 class="title">품종 별 가장 주의해야 할 질병</h5><br>
            <div style="text-align: -webkit-center;">
                <select id="breedDropdown" class="form-select">
                    <option value="" selected disabled>품종을 선택하세요</option>
                    <c:forEach var="breedItem" items="${breedData}">
                        <option value="${breedItem.disease}">${breedItem.breed}</option>
                    </c:forEach>
                    <option value="웰시코기">웰시코기</option>
                    <option value="진돗개">진돗개</option>
                    <option value="비글">비글</option>
                    <option value="골든 리드리버">골든 리드리버</option>
                    <option value="사모예드">사모예드</option>
                    <option value="시베리아허스키">시베리아허스키</option>
                    <option value="시바견">시바견</option>
                    <option value="스피츠">스피츠</option>
                    <option value="비숑">비숑</option>
                    <option value="슈나우저">슈나우저</option>
                    <option value="미니어처">미니어처</option>
                    <option value="퍼그">퍼그</option>
                    <option value="불독">불독</option>
                    <option value="시베리안 허스키">시베리안 허스키</option>
                    <option value="코커 스패니엘">코커 스패니엘</option>
                    <option value="레브라도 리트리버">레브라도 리트리버</option>
                    <option value="보더콜리">보더콜리</option>
                </select>
            </div>
            <div class="d-card">
                <h5 id="selectedDisease"></h5>
                <div>
                    <img id="img" style="width: 250px; margin-bottom: 30px;"/>
                    <div id="desc">
                    </div>
                </div>
            </div>
        </div>


        <div style="width: 450px; text-align: -webkit-center; ">
            <h5 class="title"> 나이대별 질병 TOP3</h5><br>
            <select id="ageDropdown" class="form-select">
                <option value="" selected disabled>나이대를 선택하세요</option>
                <c:forEach var="ageItem" items="${ageTopThree}">
                    <option value="${ageItem.age_group}">${ageItem.age_group}</option>
                </c:forEach>
            </select>
            <div class="d-card" style="padding: 40px 30px; width: 110%">
                <canvas id="diseaseChart"></canvas>
            </div>
        </div>
    </div>
    <div class="center">
        <img src="/resources/img/down-one-arrow.png" id="arrow" width="60px" style="display: none"/>
        <br>
        <button id="recommendationButton" style="display: none; font-weight: bold; font-size: 20px">Click</button>
    </div>
    <div class="recommend">
    </div>
</div>

<%--    <div style="display:flex; place-content: center">--%>
<%--        <div style="width: 650px; text-align: center">--%>
<%--            <h5>가장 많은 품종</h5>--%>
<%--            <canvas id="breedChart"></canvas>--%>
<%--        </div>--%>
<%--    </div>--%>
<script>
    let word = "";
    $(document).ready(function () {
        $('#breedDropdown').on('change', function () {
            const selectedDisease = $(this).find('option:selected').val();
            if (selectedDisease) {
                $('#selectedDisease').text(selectedDisease);

                if (selectedDisease === '외이염') {
                    $('#img').attr('src', '/resources/img/외이염.png');
                    $('#desc').html('외이염은 개의 이도에 염증이 생기는 질병입니다.<br><br>통증이 있는 질병이고 귀 안의 복잡한 구조 때문에 더 치료가 어렵습니다. 강아지에게 발생하는 흔한 피부 질병으로 정상적인 귀의 세척능력이 떨어졌을 때 귀지의 축적에서 시작됩니다. 이런 귀지의 축적은 염증을 일으키고 곰팡이나 박테리아 같은 이차 감염을 일으킵니다.');
                    word = "피부";
                } else if (selectedDisease === '피부염/습진') {
                    $('#img').attr('src', '/resources/img/피부염.png');
                    $('#desc').html('강아지의 피부염 원인은 다양합니다: 외부 기생충: 강아지의 피부에 벼룩이나 진드기, 또는 사상충 같은 기생충이 붙게 되면 피부염이 발생할 수 있습니다. 알러지: 환경에 있는 알레르겐 또는 특정 음식, 그리고 벼룩에 대한 알러지 반응으로 인해 피부염이 발생하기도 합니다. 감염: 박테리아나 효모, 진균과 같은 미생물에 의한 감염이 피부에 생길 수 있습니다. 호르몬 불균형: 갑상선 기능이 저하되거나 쿠싱증후군과 같은 내분비 문제로 인해 피부염이 발생할 수 있습니다. 물리적, 화학적 자극: 과도하게 강아지를 목욕시키거나, 피부에 맞지 않는 화장품을 사용하거나, 물리적인 손상이 생기면 피부염의 원인이 될 수 있습니다. 강아지의 피부염 증상에는 다음과 같은 것들이 있습니다. 가려움: 강아지가 피부를 자주 긁거나 핥는 것을 볼 수 있습니다. 홍반: 강아지의 피부 부위가 붉게 보일 수 있습니다. 물집, 궤양, 부종: 피부염이 심각해지면 물집이나 궤양, 부종이 생길 수 있습니다. 탈모: 강아지가 긁거나 핥는 부위에서 털이 빠져 탈모가 발생하기도 합니다. 냄새: 피부에서 나쁜 냄새가 날 수 있습니다. 이는 감염이 발생했을 때 특히 그렇습니다.');
                    word = "피부";
                } else {
                    $('#img').attr('src', '/resources/img/예방의학.png');
                    $('#desc').text('기타 질병에 대한 설명');
                    word = "";
                }
                // 스크롤 로직
                $('html, body').animate({
                    scrollTop: $("#breedDropdown").offset().top
                }, 90);
                $('#recommendationButton').css('display', 'contents');
                $('#arrow').css('display', 'inline');

            } else {
                $('#selectedDisease').text("");  // No breed selected, clear the text
            }
        });

        $('.center').on('click', function () {
            $.ajax({
                url: '/getInsuRecommend',
                method: 'GET',
                data: {
                    word: word
                },
                dataType: 'json',
                success: function (data) {

                    let resultHTML = '<div style="text-align: center; margin-bottom: 20px">';
                    const selectedBreedText = $('#breedDropdown option:selected').text();
                    const selectedAgeText = $('#ageDropdown option:selected').text();

                    if (selectedBreedText !== "품종을 선택하세요") {
                        resultHTML += '<span class="selected-value">' + selectedBreedText + '</span> ';
                    }

                    if (selectedAgeText !== "나이대를 선택하세요") {
                        resultHTML += '<span class="selected-value">' + selectedAgeText + '</span> ';
                    }

                    // 결과를 담을 변수 초기화
                    resultHTML += '</div><h5 style="text-align: center; font-weight: bold; margin-bottom: 20px">추천 보험 ' + data.length + '개</h5>';

                    // data를 순회하면서 HTML 생성
                    for (let i = 0; i < data.length; i++) {
                        resultHTML += '<div class="insurance-product">';
                        resultHTML += '<p>' + data[i].description + '</p>';
                        resultHTML += '<h4 style="font-weight: bold">' + data[i].insurance_name + '</h4>';

                        // data[i].rec_guarantee를 ','로 나누고 각 단어를 카드 형태로 생성
                        const tags = data[i].rec_guarantee.split(',').map(tag => {
                            return '<span class="tag">' + tag.trim() + '</span>';  // trim()을 사용하여 여백 제거
                        }).join(' ');  // 각 태그를 공백으로 연결

                        resultHTML += '<div class="tags">' + tags + '</div>';
                        resultHTML += '<br><h5 style="text-align: end; font-weight: bold">' + data[i].period + ' ' + Number(data[i].amount).toLocaleString() + '원</h5>';
                        resultHTML += '<div style="text-align: end"><a href="/insurance-detail" class="details-btn" onclick="saveInsuranceInfo(\'' + data[i].insurance_name + '\', ' + 'Number(data[i].amount).toLocaleString()원' + ')">자세히 보기</a></div>';
                        resultHTML += '</div>';
                    }

                    // 결과 HTML을 .recommend 클래스 요소에 추가
                    $('.recommend').html(resultHTML);

                    $('html, body').animate({
                        scrollTop: $(".recommend").offset().top
                    }, 90);
                },
                
                error: function (xhr, status, error) {
                    console.error('Error fetching account list:', error);
                }
            });
        });

    });

    // 각각의 data[i].insurance_name과 data[i].amount을 클릭 이벤트 핸들러에 전달하기 위한 함수
    function saveInsuranceInfo(insuranceName, amount) {
        var insuranceInfo = {
            insuranceName: insuranceName,
            insuranceAmount: amount
        };

        // 세션에 정보 저장
        sessionStorage.setItem("selectedInsurance", JSON.stringify(insuranceInfo));
    }

    document.addEventListener('DOMContentLoaded', function () {
        // breedRatio를 위한 막대차트
        let breedLabels = [];
        let breedPercentages = [];

        <c:forEach var="data" items="${breedRatio}">
        breedLabels.push("${data.breed}");
        breedPercentages.push("${data.percentage}");
        </c:forEach>

        // let breedCtx = document.getElementById('breedChart').getContext('2d');
        // new Chart(breedCtx, {
        //     type: 'bar',
        //     data: {
        //         labels: breedLabels,
        //         datasets: [{
        //             label: '퍼센트',
        //             data: breedPercentages,
        //             backgroundColor: [
        //                 '#edafb8',
        //                 '#f7e1d7',
        //                 '#dedbd2',
        //                 '#b0c4b1',
        //                 '#4a5759'
        //             ]
        //         }]
        //     }
        // });

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

            if (myChart) {
                myChart.destroy();
            }

            const legendMargin = {
                id: 'legendMargin',
                beforeInit(chart, legend, options) {
                    const fitValue = chart.legend.fit;
                    const spacing = 40; // 추가할 간격

                    chart.legend.fit = function fit() {
                        fitValue.bind(chart.legend)();
                        return (this.height += spacing);
                    };
                },
            };

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
                },
                options: {
                    plugins: {
                        legend: {
                            labels: {
                                // 글자 크기 조정
                                font: {
                                    size: 17, // 원하는 글자 크기를 설정합니다.
                                    weight: 'bold'
                                },
                                padding: 20
                            }
                        }
                    }
                },
                plugins: [legendMargin]
            });
        }

        // Update the chart when ageDropdown value changes
        document.getElementById("ageDropdown").addEventListener('change', function () {
            updateDiseaseChart(this.value);
            // 스크롤 로직
            $('html, body').animate({
                scrollTop: $("#breedDropdown").offset().top
            }, 90); // 1000ms (1초) 동안 스크롤

            $('#recommendationButton').css('display', 'contents');
            $('#arrow').css('display', 'inline');
        });
    });
</script>

