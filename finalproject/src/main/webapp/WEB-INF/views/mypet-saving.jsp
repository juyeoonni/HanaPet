<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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

        /* 막대 그래프 컨테이너 스타일 */
        .progress-bar-container {
            width: 100%;
            height: 35px; /* 막대 그래프의 높이 조절 */
            background-color: #ccc; /* 막대 그래프 바의 배경색 */
            border-radius: 50px; /* 모서리를 둥글게 만듭니다. */
            margin-bottom: 5px; /* 각 막대 그래프 사이에 간격 추가 */
        }

        /* 막대 그래프 바 초기 스타일 */
        .progress-bar {
            height: 100%;
            background-color: #4CAF50; /* 막대 그래프의 색상 */
            text-align: center;
            line-height: 20px; /* 텍스트를 수직으로 중앙 정렬 */
            color: #fff; /* 텍스트 색상 */
            border-radius: 50px; /* 왼쪽 모서리만 둥글게 만듭니다. */
            width: 0; /* 초기 너비를 0으로 설정 */
            transition: width 1s ease-in-out; /* 너비 변화에 대한 애니메이션 설정 */
        }

        /* 막대 그래프 진행률 텍스트 스타일 */
        .progress-text {
            margin-left: 5px; /* 텍스트와 막대 그래프 사이의 간격 추가 */
        }

        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        .top-container, .left-container {
            display: flex;
            justify-content: space-between;
        }

        .button-container {
            text-align: end;
        }

        .middle-box {
            background: #75A989;
            box-shadow: 0px 3px 3px rgba(0, 0, 0, 0.25);
            border-radius: 10px 10px 0px 0px;
            width: auto;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0px 30px;
        }

        #top-box {
            width: 100%;
            height: 120px;
            margin-top: 10px;
            background: #E1E6DE;
            /*box-shadow: 4px 4px 15px 1px rgba(0, 0, 0, 0.2);*/
            border-radius: 10px;
            margin-bottom: 40px;
        }

        .text-right {
            text-align: end;
        }

        .accordion-button {
            background-color: white !important;
            border: 2px solid #E1E6DE;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        }

        .smallsize {
            font-size: 15px;
        }

        .accordion-body {
            padding: 15px !important;
        }

        .account-container {
            padding: 20px 0px;
            border-bottom: 2px solid #E1E6DE !important;
        }
    </style>

</head>

<body>
<%@ include file="include/header.jsp" %>

<div class="body">
    <div class="menu-title"> 마이 페이지</div>
    <div class="middle-box">
        <div>
            <button>
                반려견 적금
            </button>
            <button>
                반려견 보험
            </button>
            <button>
                내 계좌
            </button>
        </div>
    </div>
    <div id="top-box">
        <div>
            최유림님
        </div>
        <div>
            총 2마리의 반려견과 함께 총 3개의 계좌를 보유하고 있습니다.
        </div>
        <div class="text-right">
            총 잔액 18456,123원
        </div>
    </div>
    <div>

    </div>

    <div class="accordion" id="accordionPanelsStayOpenExample">
        <!-- Placeholder for the accordion items -->
    </div>
</div>

<%
    String guest_id = (String) session.getAttribute("guest_id");
    // 여기서 필요한 세션값과 변수들을 설정하세요
%>

<script>
    $(document).ready(function () {

        var guest_id = '<%= guest_id %>'; // Java 값을 JavaScript 변수로 전달

        $.ajax({
            url: "/pets",
            type: "GET",
            data: {
                guest_id: guest_id
            },
            dataType: "json",
            success: function (petsData) {
                console.log(guest_id);
                console.log(petsData);
                var promises = [];

                petsData.forEach(function (pet) {
                    var accordionItem = $("<div>").addClass("accordion-item");
                    var accordionHeader = $("<h2>").addClass("accordion-header");
                    var imageElement = $('<img style="width: 60px; height:60px; border-radius: 50%">').attr('src', 'resources/img/dog' + pet.pet_id + '.jpg').addClass('petimg');
                    var accordionButton = $('<button style="padding:15px;">').addClass("accordion-button")
                        .attr("type", "button")
                        .attr("data-bs-toggle", "collapse")
                        .attr("data-bs-target", "#accordionItem" + pet.pet_id)
                        .attr("aria-expanded", "false")
                        .attr("aria-controls", "accordionItem" + pet.pet_id)
                        .html('<div class="button-content" style="display: flex; justify-content: space-between; align-items: center; width: 90%">'
                            + '<div class="left">'
                            + '<span class="petimg">' + imageElement.prop('outerHTML') + '</span>'
                            + '<span class="petname">' + pet.name + '</span>'
                            + '</div>'
                            + '<div class="smallsize" id="total-' + pet.pet_id + '">'
                            + '</div>'
                            + '<div class="right">'
                            + '<div>' + pet.gender + '|' + pet.age + '살 ' + pet.breed + '</div>'
                            + '<div>2개의 적금 보유</div>'
                            + '</div>'
                            + '</div>');
                    var accordionCollapse = $("<div>").addClass("accordion-collapse collapse show") // 처음에 show로 펼쳐주기
                        .attr("id", "accordionItem" + pet.pet_id);
                    var accordionBody = $("<div>").addClass("accordion-body");

                    var savingAccountPromise = $.ajax({
                        url: "/savingaccounts",
                        type: "GET",
                        data: {
                            guest_id: guest_id,
                            pet_id: pet.pet_id
                        },
                        dataType: "json"
                    }).then(function (myAccountsOfPet) {

                        let total_balance = 0;

                        myAccountsOfPet.forEach(function (account) {
                            // 필요한 정보 추출
                            var categoryImg = account.categoryImg;
                            var saving_name = account.savingName;
                            var balance = account.balance;
                            var account_number = account.accountNumber;
                            var openerId = account.openerId;
                            var progress_rate = account.progressRate;


                            console.log("밸런스" + balance);
                            total_balance += parseInt(balance);

                            console.log("최종" + total_balance)

                            // 막대 그래프 생성 및 업데이트 로직을 추가하세요.
                            var progressBar = createProgressBar(progress_rate); // 막대 그래프 생성 함수


                            // 주요 컨테이너 생성
                            var container = $('<div>').addClass('account-container');
                            var topContainer = $('<div>').addClass('top-container');
                            var leftContainer = $('<div>').addClass('left-container');
                            var rightContainer = $('<div>').addClass('right-container');
                            var buttonContainer = $('<div>').addClass('button-container');

                            // 이미지 요소 생성 및 추가
                            var imgElement = $('<img style="width: 60px; height:60px;">').attr('src', 'resources/img/' + categoryImg).addClass('category-img');
                            leftContainer.append(imgElement);

                            var Div = $('<div>');
                            // 적금 이름과 진행률 추가
                            var nameDiv = $('<div>').text(saving_name);
                            // var progressDiv = $('<div>').text(progress_rate);
                            Div.append(nameDiv, progressBar);
                            leftContainer.append(Div);

                            // 계좌 번호와 잔액 추가
                            var accountNumberDiv = $('<div>').text(account_number.slice(0, 15) + '*');
                            var balanceDiv = $('<div>').text('잔액 ' + balance + '원');
                            rightContainer.append(accountNumberDiv, balanceDiv);

                            // "공유하기" 버튼 생성
                            var kakaoLink = $('<button>').attr('id', 'kakaotalk-sharing-btn-' + account_number).attr('href', 'javascript:;').text("공유하기").css('cursor', 'pointer').css('pointer-events', 'auto');
                            buttonContainer.append(kakaoLink);

                            // "자세히 보기" 버튼 생성
                            var detailsButton = $('<button>').text('자세히 보기');

                            // 버튼에 클릭 이벤트 리스너 추가
                            detailsButton.on('click', function () {
                                window.location.href = '/mypet-saving/detail'; // 원하는 다음 페이지의 URL로 변경
                            });

                            buttonContainer.append(detailsButton);

                            // 생성한 컨테이너들을 상위 컨테이너에 추가
                            topContainer.append(leftContainer, rightContainer);
                            container.append(topContainer);
                            container.append(buttonContainer);

                            // 생성한 컨테이너를 화면에 추가
                            accordionBody.append(container);

                            // Kakao 공유 버튼을 생성하고 설정
                            kakaoLink.on('click', function () {
                                const sharedUrl = 'http://localhost:8080/invited-pw?account-number=' + account.accountNumber;

                                Kakao.Share.createDefaultButton({
                                    container: '#kakaotalk-sharing-btn-' + account_number,
                                    objectType: 'feed',
                                    content: {
                                        title: 'HanaPet 공유 적금에 초대되었어요!',
                                        description: pet.name + '를 위해 공유 적금에 참여해보세요!🐶 비밀번호는 381924입니다.',
                                        imageUrl: 'https://postfiles.pstatic.net/MjAyMzA5MTBfMTg2/MDAxNjk0MzM0MzI1NTIy.4l3dX_IM59DAvZREh6SKYk8pxBVd6kttYnha-5qNyuUg.a-pIK9JsI0PZPa1grgYGbTeQUtMjVL4aE-xGA-q3j80g.PNG.yulim_choi/A4_-_1.png?type=w966',
                                        link: {
                                            mobileWebUrl: sharedUrl,
                                            webUrl: sharedUrl,
                                        },
                                    },
                                    buttons: [
                                        {
                                            title: '적금 참여하기',
                                            link: {
                                                mobileWebUrl: sharedUrl,
                                                webUrl: sharedUrl,
                                            },
                                        }
                                    ]
                                });
                            });
                        });
                        $("#total-" + pet.pet_id).text("총 잔액 " + total_balance + "원");
                    }).fail(function () {
                        console.log("Error fetching savingaccounts data.");
                    });
                    promises.push(savingAccountPromise);

                    accordionCollapse.append(accordionBody);
                    accordionHeader.append(accordionButton);
                    accordionItem.append(accordionHeader, accordionCollapse);

                    $("#accordionPanelsStayOpenExample").append(accordionItem);
                });
                $.when.apply($, promises).then(function () {
                    console.log("All Ajax requests completed.");
                });
            },
            error: function () {
                console.log("Error fetching pets data.");
            }
        });


    });

    function createProgressBar(progressRate) {
        // 막대 그래프 컨테이너를 생성합니다.
        var progressBarContainer = $("<div>").addClass("progress-bar-container");

        // 막대 그래프 바를 생성합니다.
        var progressBar = $("<div>").addClass("progress-bar");

        // 막대 그래프의 스타일을 설정합니다.
        progressBar.css("width", progressRate + "%");

        // 막대 그래프에 진행률을 표시하는 텍스트를 생성합니다.
        var progressText = $("<div>").addClass("progress-text").text(progressRate + "%");

        // 막대 그래프 바와 진행률 텍스트를 막대 그래프 컨테이너에 추가합니다.
        progressBarContainer.append(progressBar, progressText);

        // 막대 그래프 컨테이너를 반환합니다.
        return progressBarContainer;
    }

</script>

</body>
</html>
