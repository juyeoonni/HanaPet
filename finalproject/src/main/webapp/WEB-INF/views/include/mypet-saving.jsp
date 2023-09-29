<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <script src="/resources/js/apiKey.js"></script>

    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
    <script>
        Kakao.init(config.KAKAO_JAVASCRIPT_KEY); // 사용하려는 앱의 JavaScript 키 입력
    </script>
    <style>

        .accordion-collapse .account-container:last-child {
            border-bottom: none !important;
        }

        .nav-item .nav-link {
            border-bottom: #75a989 !important;
        }

        .nav-tabs .nav-link.active {
            background: #75a989 !important;
            color: white !important;
        }

        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        .top-container, .left-container {
            display: flex;
            justify-content: space-between;
            gap: 35px;
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

        #text-right {
            text-align: end;
            font-weight: bold;
        }

        .accordion-button {
            background-color: white !important;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        }

        .smallsize {
            font-size: 18px;
            font-weight: bold;
        }

        .accordion-body {
            padding: 15px !important;
        }

        .account-container {
            padding: 35px 40px;
            border-bottom: 2px solid #E1E6DE !important;
        }

        /* 기본 버튼 스타일 */
        .custom-btn {
            background-color: #75A989;
            border: 1px solid #fff;
            color: #fff; /* 텍스트 색상을 흰색으로 지정 */
        }

        /* 선택된 버튼 스타일 */
        .custom-btn:checked {
            background-color: #BFDFCB !important; /* 선택된 버튼의 배경색 변경 */
            border: 1px solid #fff; /* 선택된 버튼의 테두리 스타일 변경 */
            color: #fff; /* 선택된 버튼의 텍스트 색상을 흰색으로 유지 */
        }

        /* 호버 상태일 때의 스타일 */
        .custom-btn:hover {
            background-color: #BFDFCB; /* 호버 상태일 때 배경색 변경 */
            border: 1px solid #fff; /* 호버 상태일 때 테두리 스타일 변경 */
            color: #fff; /* 호버 상태일 때 텍스트 색상을 흰색으로 유지 */
        }
    </style>

</head>
<div style="display:flex;">
    <div id="top-box">
        <div class="guest">
            <img src="/resources/img/logo-one.png" width="40px"/> <%=guest_name%>님
        </div>
        <div id="info-text">
            총
        </div>
        <br>
        <div id="text-right">
            총 자산
        </div>

    </div>
    <div id="top-box2">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card" style="padding-bottom: 10px">
                <div class="card-body">
                    <h5 class="card-title" style="padding-bottom: 5px"><b>자산 한눈에 보기</b></h5>
                    <div class="table-responsive">
                        <table class="table table-striped" style="margin-bottom: 0px">
                            <tbody>
                            <tr>
                                <td>
                                    반려견 적금
                                </td>
                                <td id="jk">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    반려견 보험
                                </td>
                                <td>
                                    -
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    내 계좌
                                </td>
                                <td id="ma">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="accordion" id="accordionPanelsStayOpenExample">
</div>
<script>
    $(document).ready(function () {
        var guest_id = '<%= guest_id %>'; // Java 값을 JavaScript 변수로 전달
        var totalAmount = 0;
        let totalAccount = 0;
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
                document.getElementById("info-text").textContent += " " + petsData.length + "마리의 반려견과 함께 총 ";
                petsData.forEach(function (pet) {
                    var gender = pet.gender == 'M' ? '남' : '여';
                    var pet_id = pet.pet_id;
                    var accordionItem = $("<div>").addClass("accordion-item");
                    var accordionHeader = $("<h2>").addClass("accordion-header");
                    var imageElement = $('<img style="width: 60px; height:60px; border-radius: 50%">').attr('src', 'resources/img/dog' + pet.pet_id + '.jpg').addClass('petimg');
                    var accordionButton = $('<button style="padding:15px 40px;">').addClass("accordion-button")
                        .attr("type", "button")
                        .attr("data-bs-toggle", "collapse")
                        .attr("data-bs-target", "#accordionItem" + pet.pet_id)
                        .attr("aria-expanded", "false")
                        .attr("aria-controls", "accordionItem" + pet.pet_id)
                        .html('<div class="button-content" style="display: flex; justify-content: space-between; align-items: center; width: 90%">'
                            + '<div class="left">'
                            + '<span class="petimg">' + imageElement.prop('outerHTML') + '</span>'
                            + '<span class="petname" style="font-size: 24px; font-weight: bold; margin-left: 20px;">' + pet.name + '</span>'
                            + '</div>'
                            + '<div style="display: flex; align-items: center;"><div style="text-align: end">'
                            + '<div class="smallsize" style=" margin-right: 40px;" id="total-' + pet.pet_id + '">'
                            + '</div> </div>'
                            + '<div class="right" style="margin-right: -40px">'
                            + '<div style="font-size: 20px; font-weight: bold; padding-bottom: 10px; ">' + gender + ' | ' + pet.age + '살 ' + pet.breed + '</div>'
                            + '<div id="petAccountCnt' + pet_id + '"></div>'
                            + '</div></div>'
                            + '</div>'
                        )
                    ;
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
                        totalAccount += myAccountsOfPet.length;
                        myAccountsOfPet.forEach(function (account) {
                            // 필요한 정보 추출
                            var categoryImg = account.categoryImg;
                            var saving_name = account.savingName;
                            var balance = account.balance;
                            var account_number = account.accountNumber;
                            var openerId = account.openerId;
                            var progress_rate = account.progressRate;

                            total_balance += parseInt(balance);

                            // 주요 컨테이너 생성
                            var container = $('<div>').addClass('account-container');
                            var topContainer = $('<div>').addClass('top-container');
                            var leftContainer = $('<div style="margin-top: 10px">').addClass('left-container');
                            var rightContainer = $('<div>').addClass('right-container');
                            var buttonContainer = $('<div>').addClass('button-container');

                            // 이미지 요소 생성 및 추가
                            var imgElement = $('<img style="width: 65px;">').attr('src', 'resources/img/' + categoryImg).addClass('category-img');
                            leftContainer.append(imgElement);

                            if (account.balance == '1000') {
                                var Div = $('<div>');
                                // 적금 이름과 진행률 추가
                                var nameDiv = $('<div style="font-weight: bold; font-size: 20px; margin-bottom: 10px">').text(saving_name);
                                var progressBar = createProgressBar(100); // 막대 그래프 생성 함수

                                Div.append(nameDiv, progressBar);
                                leftContainer.append(Div);

                                // 만기 알림
                                var endDiv = $('<div style="padding-top: 37px; font-size: 22px; font-weight: bold; color: #75a989;">').text('만기된 적금입니다.');
                                rightContainer.append(endDiv);

                            } else {
                                var Div = $('<div>');
                                // 적금 이름과 진행률 추가
                                var nameDiv = $('<div style="font-weight: bold; font-size: 20px; margin-bottom: 10px">').text(saving_name);
                                var progressBar = createProgressBar(progress_rate); // 막대 그래프 생성 함수

                                Div.append(nameDiv, progressBar);
                                leftContainer.append(Div);

                                // 계좌 번호와 잔액 추가
                                var accountNumberDiv = $('<div>').text(account_number.slice(0, 4) + '******' + account_number.slice(10));
                                var balanceDiv = $('<div>').text('잔액 ' + Number(balance).toLocaleString() + '원');
                                rightContainer.append(accountNumberDiv, balanceDiv);

                                // 내가 개설자일 때만 "공유하기" 버튼 생성
                                if (String(openerId) === guest_id) {
                                    var kakaoLink = $('<button style="background: #75a989; color: white; border: 3px solid #75a989 ; border-radius: 10px;  padding: 5px 15px; width: 122px">').attr('id', 'kakaotalk-sharing-btn-' + account_number).attr('href', 'javascript:;').text("공유하기").css('cursor', 'pointer').css('pointer-events', 'auto');
                                    buttonContainer.append(kakaoLink);

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
                                }

                                // "자세히 보기" 버튼 생성
                                var detailsButton = $('<button style="background: #75a989; color: white; border: 3px solid #75a989 ; border-radius: 10px; padding: 5px 15px; margin-left: 10px">').text('자세히 보기');

                                detailsButton.on('click', function () {
                                    var nextPageUrl = '/mypet-saving/detail?accountNumber=' + encodeURIComponent(account_number);
                                    window.location.href = nextPageUrl;
                                });

                                buttonContainer.append(detailsButton);
                            }

                            // 생성한 컨테이너들을 상위 컨테이너에 추가
                            topContainer.append(leftContainer, rightContainer);
                            container.append(topContainer);
                            container.append(buttonContainer);

                            // 생성한 컨테이너를 화면에 추가
                            accordionBody.append(container);
                        });

                        $("#total-" + pet.pet_id).text("총 잔액 " + total_balance.toLocaleString() + "원");
                        totalAmount += total_balance;
                        document.getElementById("petAccountCnt" + pet.pet_id).textContent = myAccountsOfPet.length + "개의 적금 보유";
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
                    document.getElementById("info-text").textContent += totalAccount + "개의 계좌를 보유하고 있습니다.";
                    console.log(totalAmount)
                    document.getElementById("text-right").textContent += totalAmount.toLocaleString() + "원";

                    document.getElementById('jk').textContent = document.getElementById('text-right').textContent.replace(/\s+/g, '').slice(3);
                    document.getElementById('ma').textContent = document.getElementById('text-right3').textContent.replace(/\s+/g, '').slice(3);
                    document.getElementById('jk2').textContent = document.getElementById('text-right').textContent.replace(/\s+/g, '').slice(3);
                    document.getElementById('ma2').textContent = document.getElementById('text-right3').textContent.replace(/\s+/g, '').slice(3);
                    document.getElementById('jk3').textContent = document.getElementById('text-right').textContent.replace(/\s+/g, '').slice(3);
                    document.getElementById('ma3').textContent = document.getElementById('text-right3').textContent.replace(/\s+/g, '').slice(3);

                });
            },
            error: function () {
                console.log("Error fetching pets data.");
            }

        });

        function createProgressBar(progressRate) {
            var progressBarContainer = $("<div style='width: 410px; height: 30px; border-radius: 20px; background: #f2f2f2;'>").addClass("progress");

            var progressBar = $("<div style='background:linear-gradient(to right, #d3959b, #bfe6ba)'>").addClass("progress-bar")
                .attr("role", "progressbar")
                .attr("aria-valuemin", "0")
                .attr("aria-valuemax", "100")
                .css("borderRadius", "20px")
                .css("width", "0%"); // 초기 너비를 0%로 설정

            progressBarContainer.append(progressBar);

            progressBar.animate({width: progressRate + '%'}, 750); // 0.6초 동안 애니메이션 실행

            var progressText = $("<div style='text-align: center; color: #324D3D; font-size: 14px; z-index: 2; padding-right: 4px; align-self: self-end;'>").text(Math.round(progressRate) + "%");

            progressBar.append(progressText);

            return progressBarContainer;
        }


    });

</script>
