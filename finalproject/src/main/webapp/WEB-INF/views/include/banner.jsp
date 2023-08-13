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
</head>
<body>

<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel"
     style="background: linear-gradient(to right, rgba(0, 132, 133, 0.9), rgba(69, 186, 125, 0.9)); padding-top: 30px;">

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
    </div>
    <div class="carousel-inner" style="height: 300px; width: 70%; margin-left: 220px;">
        <div class="carousel-item active" style="height: 300px;" data-bs-interval="2000">
            <h2>토리 왕자님은 11살이에요!</h2>
            <p>토리 또래 친구들의 적금 TOP 2!</p>
            <div>
                <button>의료/건강 적금</button>
                <button>숙박/여행 적금</button>
            </div>
        </div>
        <div class="carousel-item" style="height: 300px;" data-bs-interval="2000">
            <h5>Second slide label</h5>
            <p>Some representative placeholder content for the second slide.</p>
        </div>
        <div class="carousel-item" style="height: 300px;" data-bs-interval="2000">
            <h5>Third slide label</h5>
            <p>Some representative placeholder content for the third slide.</p>
        </div>
    </div>
    <%} else {%>
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
    </div>
    <div class="carousel-inner" style="height: 300px; width: 70%; margin-left: 220px;">
        <div class="carousel-item active" style="height: 300px;" data-bs-interval="2000">
            <h2>반려견의 생애주기로 보는 하나 펫 금융 서비스, 나랑 평생 함께하개를 시작해보세요!</h2>
            <p>바로가기</p>
        </div>
        <div class="carousel-item" style="height: 300px;" data-bs-interval="2000">
            <h5>Second slide label</h5>
            <p>Some representative placeholder content for the second slide.</p>
        </div>
    </div>
    <%}%>

    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

</body>
</html>
