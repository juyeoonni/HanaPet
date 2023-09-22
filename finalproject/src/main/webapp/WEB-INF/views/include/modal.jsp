<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #closeModalButton {
            background: none;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div>
    <div style="text-align: end;">
        <button id="closeModalButton">X</button>
    </div>
    <div>일정을 입력하세요</div>
    <div>
        <label class="form-label" for="petSelection">반려견</label>
        <select class="form-select" id="petSelection">
        </select></div>
    <div style="display: flex; justify-content: space-between;">
        <div style="width: 270px;">
            <label class="form-label">시작 날짜</label>
            <input autocomplete="off" type="date" class="form-control" id="calendar_start_date"
                   name="calendar_start_date">
        </div>
        <div style="width: 270px;">
            <label class="form-label">마감 날짜</label>
            <input autocomplete="off" type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
        </div>
    </div>
    <div>
        <label class="form-label">일정 내용</label>
        <input autocomplete="off" type="text" class="form-control" id="eventDescription" name="eventDescription">
    </div>

    <button class="form-submit" type="button" id="addEventButton">일정 등록</button>


</div>
<script>
    const startDateInput = document.getElementById("calendar_start_date");
    const endDateInput = document.getElementById("calendar_end_date");

    startDateInput.addEventListener("input", function () {
        if (!endDateInput.value) {
            endDateInput.value = this.value;
        }

        endDateInput.min = this.value;
    });

    endDateInput.addEventListener("input", function () {
        startDateInput.max = this.value;
    });
</script>
</body>
</html>