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

    <script src="/resources/js/apiKey.js"></script>

    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
    <script>
        Kakao.init(config.KAKAO_JAVASCRIPT_KEY); // 사용하려는 앱의 JavaScript 키 입력
    </script>
</head>

<body>
<%@ include file="include/header.jsp" %>

<div class="body">
    <c:forEach var="pet" items="${pets}">
        <div class="accordion" id="accordionPanelsStayOpenExample">
            ${pet.name}
        </div>
    </c:forEach>

    <a id="kakaotalk-sharing-btn" href="javascript:;" onclick="send()">
        <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
             alt="카카오톡 공유 보내기 버튼"/>
    </a>

    <div id="myModal" class="modal">
        <%@ include file="include/saving-modal.jsp" %>
    </div>
</div>

<script>
    Kakao.Share.createDefaultButton({
        container: '#kakaotalk-sharing-btn',
        objectType: 'feed',
        content: {
            title: 'HanaPet 공유 적금에 초대되었어요!',
            description: '토리를 위해 공유 적금에 참여해보세요🐶',
            imageUrl: 'https://postfiles.pstatic.net/MjAyMzA5MTBfMTg2/MDAxNjk0MzM0MzI1NTIy.4l3dX_IM59DAvZREh6SKYk8pxBVd6kttYnha-5qNyuUg.a-pIK9JsI0PZPa1grgYGbTeQUtMjVL4aE-xGA-q3j80g.PNG.yulim_choi/A4_-_1.png?type=w966',
            link: {
                // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
                mobileWebUrl: 'http://localhost:8080/mypet',
                webUrl: 'http://localhost:8080/mypet',
            },
        },
        buttons: [
            {
                title: '적금 참여하기',
                link: {
                    mobileWebUrl: 'http://localhost:8080/mypet',
                    webUrl: 'http://localhost:8080/mypet',
                },
            }
        ],
        serverCallbackArgs: {
            key: 'value', // 사용자 정의 파라미터 설정
        },
    });

    function send() {
        const requestData = {
            guest_id: 'guest2',
            account_number: '123-215-981-74261'
        };

        console.log(requestData);
        $.ajax({
            url: "/invite-saving",
            type: "POST",
            data: JSON.stringify(requestData),
            contentType: 'application/json',
            success: function (response) {
                console.log(response)
                if (response === "적금 초대 성공") {
                    modal.style.display = "block";
                } else {
                    console.error("적금 초대 실패");
                }
            },
            error: function () {
                console.log("Error post.");
            }
        });
    }
</script>

</body>
</html>
