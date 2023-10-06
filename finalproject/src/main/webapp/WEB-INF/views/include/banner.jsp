<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
            crossorigin="anonymous"></script>

    <style>
        .section {
            width: 1100px;
        }

        #carouselExampleAutoplaying {
            background: #E1E6DE;
            margin-top: 20px;
            width: 100%;
            height: 480px;
        }

        .event {
            font-size: 37px;
            font-weight: bold;
            margin-top: 10px;
            color: white;
        }

        .event-small {
            font-family: net-medium;
            font-size: 27px;
            margin-bottom: 30px;
            color: white;
        }

        .carousel-item {
            padding: 60px 200px;
        }
    </style>
</head>

<body>

<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner" style="height: 480px; width: 100%;">
        <div class="carousel-item active"
             style="background-image: url('/resources/img/test2.svg'); background-color: black; height: 480px"
             data-bs-interval="2600">

            <div >
                <span style="font-size: 22px; font-family: 'net-bold'; color: white">이벤트</span>
                <div class="event">가족들 초대하면<br>최대 연 0.9% 추가 우대</div>
                <br>
                <div class="event-small">가족들과 함께 반려견의 노후를 대비해보세요</div>
                <div style="display:flex; gap: 10px">
                    <button class="button" id="share">공유 시작하기</button>
                    <button class="button" id="make">아직 적금이 없다면?</button>
                </div>
            </div>
        </div>
        <div class="carousel-item"
             style='background-image: url("http://www.chungdamah.co.kr/theme/hp001/img/main_visual1.jpg"); background-color: black; height: 500px; background-position: 50% 10%'
             data-bs-interval="2600">
            <h3 class="event">소중한 우리 반려견의 건강한 삶을 위해 </h3>
            <h3 class="event">하나펫손해보험</h3>
            <p class="event-small">우리 아이에게 딱 맞는 보험 찾으러 가기</p>
        </div>
        <div class="carousel-item dark-overlay" data-bs-interval="2600"
             style='background-image: url("/resources/img/main3.png"); height: 500px; background-position: 50% 30%; background-repeat: no-repeat; background-size: cover'>
            <div style="text-align: center">
                <h3 class="event" style="z-index: 100">소중한 우리 반려견의 건강한 삶을 위해 </h3>
                <h3 class="event">하나펫손해보험</h3>
                <p class="event-small">우리 아이에게 딱 맞는 보험 찾으러 가기</p>
            </div>
        </div>
    </div>

    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<script>
    document.getElementById('scrollToSectionButton').addEventListener('click', function () {
        scrollToTarget();
    });

    function scrollToTarget() {
        const targetElement = document.querySelector('.scroll-target');
        const targetTop = targetElement.getBoundingClientRect().top + window.scrollY;
        window.scrollTo({top: targetTop, behavior: 'smooth'});
    }
</script>
</body>
</html>
