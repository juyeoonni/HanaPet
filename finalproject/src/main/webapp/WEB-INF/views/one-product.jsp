<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <!-- 부트스트랩 CSS 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div class="accordion" id="productAccordion">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseProduct"
                        aria-expanded="true" aria-controls="collapseProduct">
                    제품 상세 정보
                </button>
            </h2>
            <div id="collapseProduct" class="accordion-collapse collapse show" aria-labelledby="headingProduct"
                 data-bs-parent="#productAccordion">
                <div class="accordion-body">
                    <div id="productCategory"></div>
                    <div id="productDescription"></div>
                    <div id="productRate"></div>
                    <div id="productMinPeriod"></div>
                    <div id="productMinBalance"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 부트스트랩 JS 링크 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        // 세션에서 제품 정보 가져오기
        var productInfo = JSON.parse(sessionStorage.getItem("selectedProduct"));

        // 제품 정보를 화면에 표시
        if (productInfo) {
            $("#productCategory").text("카테고리: " + productInfo.category);
            $("#productDescription").text("설명: " + productInfo.description);
            $("#productRate").text("이자율: " + productInfo.rate);
            $("#productMinPeriod").text("최소 기간: " + productInfo.min_period);
            $("#productMinBalance").text("최소 잔액: " + productInfo.min_balance);
        }
    });
</script>
</body>
</html>
