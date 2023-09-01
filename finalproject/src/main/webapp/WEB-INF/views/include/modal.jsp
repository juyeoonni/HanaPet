<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div>
    <div>일정을 입력하세요</div>
    <div>
        <label class="form-label" for="petSelection">반려견</label>
        <select class="form-select" id="petSelection">
        </select></div>
    <div>
        <label class="form-label">시작 날짜</label>
        <input autocomplete="off" type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
    </div>
    <div>
        <label class="form-label">마감 날짜</label>
        <input autocomplete="off" type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
    </div>
    <div>
        <label class="form-label">일정 내용</label>
        <input autocomplete="off" type="text" class="form-control" id="eventDescription" name="eventDescription">
    </div>


</div>
<script>
    const startDateInput = document.getElementById("calendar_start_date");
    const endDateInput = document.getElementById("calendar_end_date");

    startDateInput.addEventListener("input", function () {
        // Only update endDateInput if it doesn't have a value
        if (!endDateInput.value) {
            endDateInput.value = this.value;
        }

        // Prevent selecting an end date before the start date
        endDateInput.min = this.value;
    });

    endDateInput.addEventListener("input", function () {
        // Prevent selecting an end date before the start date
        startDateInput.max = this.value;
    });
</script>
</body>
</html>