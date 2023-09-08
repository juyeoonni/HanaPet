<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="resources/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .menu-item{
            padding-top: 12px !important;
        }
        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        .middle-box {
            background: #75A989;
            box-shadow: 0px 3px 3px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            width: auto;
            height: 50px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0px 30px;
        }
    </style>
</head>
<body>
<jsp:include page="include/header.jsp"/>
<div class="body">
    <div class="menu-title">
        펫 보험 상품
    </div>
    <div class="middle-box">
        <span>전체 5개 보험</span>
    </div>
    <jsp:include page="include/insurance-card.jsp"/>
</div>
</body>


