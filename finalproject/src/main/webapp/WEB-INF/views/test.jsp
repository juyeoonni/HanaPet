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
</head>
<body>
<div class="accordion" id="accordionPanelsStayOpenExample">
    <!-- Placeholder for the accordion items -->
    <div class="accordion-item">
        <h2 class="accordion-header">

            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#accordionItem1"
                    aria-expanded="false" aria-controls="accordionItem1">
                <div class="button-content" style="display: flex; justify-content: space-between; align-items: center; width: 90%">
                    <div class="left">
                        <span class="petimg">
                        </span>
                        <span class="petname">토리</span>
                    </div>
                    <div class="right">
                        <div>남|11살 푸들</div>
                        <div>3개의 적금 보유</div>
                    </div>
                </div>
            </button>
        </h2>
        <div class="accordion-collapse collapse show" id="accordionItem1">
            <div class="accordion-body"><p>Account Number: 123-215-981-74261, Balance: 50000</p>
                <p>Account Number: 123-539-628-38215, Balance: 0</p></div>
        </div>
    </div>
</div>
</body>
</html>
