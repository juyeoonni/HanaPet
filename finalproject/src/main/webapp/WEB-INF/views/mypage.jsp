<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .guest {
            font-weight: bold;
            font-size: 23px;
            padding-bottom: 20px;
        }

        #top-box {
            width: 140%;
            padding: 30px;
            margin-top: 10px;
            background: #E1E6DE;
            margin-right: 10px;
            border-radius: 10px;
            margin-bottom: 40px;
        }

        #top-box2 {
            width: 100%;
            margin-top: 10px;
            background: #E1E6DE;
            box-shadow: 4px 4px 15px 1px rgba(0, 0, 0, 0.17);
            border-radius: 10px;
            margin-bottom: 40px;
        }

        .nav-link:hover {
            transform: none !important;
        }

    </style>
</head>
<body>
<%
    String guest_id = (String) session.getAttribute("guest_id");
    String guest_name = (String) session.getAttribute("name");
%>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div class="menu-title"> 마이 페이지</div>
    <div class="d-flex align-items-center">
        <ul class="nav nav-tabs flex-grow-1" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" data-bs-toggle="tab" href="#home" aria-selected="true" role="tab"
                   style="font-weight: bold">반려견 적금</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#profile" aria-selected="false" role="tab"
                   style="font-weight: bold">반려견 보험</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" data-bs-toggle="tab" href="#d" aria-selected="false" role="tab"
                   style="font-weight: bold">내 계좌</a>
            </li>
        </ul>
        <div style="border-bottom: 1px solid var(--primary-color); margin-bottom: -13.2px; padding-bottom: 6px; padding-right: 6px; font-weight: bold; color: var(--primary-color); cursor: pointer;">
            내 정보 수정
        </div>
    </div>

    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade show active" id="home" role="tabpanel">
            <%@ include file="include/mypet-saving.jsp" %>
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel">
            <%@ include file="include/mypet-insurance.jsp" %>
        </div>
        <div class="tab-pane fade" id="d" role="tabpanel">
            <%@ include file="include/mypet-account.jsp" %>
        </div>
    </div>

</div>
<%@ include file="include/footer.jsp" %>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js'></script>
</body>
