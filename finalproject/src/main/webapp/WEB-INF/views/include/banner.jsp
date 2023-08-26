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


    </style>
</head>

<body>

<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel"
     style="background: linear-gradient(135deg, #008c8c, #ffffff)
 ;     box-shadow: 5px 5px 10px rgba(0,0,0,0.1); padding-top: 30px; margin-top: 40px; margin-left: 200px; margin-right: 200px; border-radius: 30px">

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>

    <%-- 로그인이 된 상태이면 로그아웃, 아니면 로그인 --%>
    <%
        if ((String) session.getAttribute("name") != null) {
    %>
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                aria-label="Slide 4"></button>
    </div>
    <div class="carousel-inner" style="height: 400px; width: 70%; margin-left: 120px;">
        <div class="carousel-item active" style="height: 400px;" data-bs-interval="1900">
            <h2>토리 왕자님은 11살이에요!</h2>
            <p>토리 또래 친구들의 적금 TOP 2!</p>
            <div>
                <button>의료/건강 적금</button>
                <button>숙박/여행 적금</button>
            </div>
        </div>
        <div class="carousel-item" style="height: 400px;" data-bs-interval="1900">
            <h5>Second slide label</h5>
            <p>Some representative placeholder content for the second slide.</p>
        </div>
        <div class="carousel-item" style="height: 400px;" data-bs-interval="1900">
            <h5>Third slide label</h5>
            <p>Some representative placeholder content for the third slide.</p>
        </div>
    </div>
    <%} else {%>
    <div class="carousel-indicators" style="display: flex; flex-direction: column; align-items: center;">
        <div>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                    aria-label="Slide 4"></button>
        </div>

    </div>
    <div class="carousel-inner" style="height: 400px; padding-left: 120px; padding-right: 120px;">
        <div class="carousel-item active" style="height: 400px;" data-bs-interval="1900">
            <div class="section">
                <h4>반려견 생애주기와 추천 적금</h4>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                    <div>
                        <div>
                            <img src="../../../resources/img/img.png" width="280px"
                                 class="scroll-zoomIn"/>
                            <p class="one">7가지 다양한 카테고리에서 당신의 반려견을 위한 최적의 적금 상품을 찾아보세요. 단기부터 장기, 그리고 특별한 선택까지 가족 모두 함께
                                결정할 수
                                있습니다.</p>
                            <button> 적금 상품 찾으러 가기</button>
                        </div>
                    </div>
                    <div>
                        <p class="two"> 당신의 반려견의 생애주기에 따라 더 나은 미래를 위한 적금을 선택하세요. 우리는 가장 적합한 상품을 추천하여 소중한 친구를 위한 특별한 적금을
                            찾아드립니다.</p>
                        <img src="../../../resources/img/main_추천적금.svg" width="360px" class="scroll-zoomIn"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="height: 400px;" data-bs-interval="1900">
            <div class="section">
                <div style="display: flex; height:740px">
                    <div>
                        <img src="../../../resources/img/main_펫스토리1.svg" height="280px" class="scroll-fadeInUp">
                    </div>
                    <div style="text-align: center; margin-left: 40px;">
                        <div style="margin-top: 10px;">
                            <h4>펫 스토리와 프라이빗한 공간</h4>
                        </div>
                        <img src="../../../resources/img/main_펫스토리2.svg" width="280px" style="margin-top: 50px"
                             class="scroll-slideInLeft">

                        <p style="margin-top: 50px">
                            반려견 한 마리마다 고유한 펫 스토리 공간을 소유하세요. 가족들과 함께하는 소중한 순간을 기록하고, 모두가 볼 수 없는 특별한 공간에서 공유하세요.</p>

                        <a href="">
                            <button> 반려견의 소중한 순간 기록하러 가기</button>
                        </a>

                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="height: 400px;" data-bs-interval="1900">
            <div class="section">
                <h4>펫 캘린더와 일정 공유</h4>
                <p>가족들과 함께하는 펫 캘린더로 손쉽게 반려견의 일정을 관리하세요. 중요한 일정을 빠르게 공유하며 가족들과 더 밀접하게 소통하세요.</p>
                <img src="../../../resources/img/main_펫캘린더.svg" width="280px"/>
            </div>
        </div>
        <div class="carousel-item" style="height: 400px;" data-bs-interval="1900">
            <div class="section">
                <h4>적금 공유와 모임적금</h4>
                <p>선택한 적금을 가족들과 함께 공유하며, 반려견의 노후를 준비하세요. 모임 적금으로 더 많은 가족들이 함께 참여하여 특별한 순간을 만드세요.</p>
            </div>
        </div>
    </div>

    <%}%>

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
