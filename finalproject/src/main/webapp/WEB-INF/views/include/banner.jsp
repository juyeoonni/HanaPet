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

        /* Rectangle 31 */

        #carouselExampleAutoplaying {
            background: #75A989;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 30px;
            padding-top: 30px;
            width: 790px;
            height: 400px;
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
    <div class="carousel-inner" style="height: 400px; width: 70%; margin-left: 120px;">
        <div class="carousel-item active" style="height: 400px;" data-bs-interval="1900">
            <span>이벤트</span>
            <h3>가족들 초대하면</h3>
            <h3>최대 연 0.9% 추가 우대!!</h3>
            <div>가족들과 함께 반려견의 노후를 대비해보세요</div>
            <div>
                <button>적금 공유하러 가개</button>
            </div>
        </div>
        <div class="carousel-item" style="height: 400px;" data-bs-interval="1900">
            <h3>소중한 우리 반려견의 건강한 삶을 위해 </h3>
            <h3>하나펫손해보험</h3>
            <p>우리 아이에게 딱 맞는 보험을 찾으러 가기</p>
        </div>
        <div class="carousel-item" style="height: 400px;" data-bs-interval="1900">
            <h5>Third slide label</h5>
            <p>Some representative placeholder content for the third slide.</p>
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
