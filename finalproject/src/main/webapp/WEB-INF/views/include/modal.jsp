<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        #modalContainer {
            width: 100%;
            height: 100%;
            margin: 0 auto;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        #closeModalButton {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 20px;
            color: #555;
        }

        #modalTitle {
            font-size: 23px;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 16px;
            margin-bottom: 8px;
            display: block;
        }

        .form-select,
        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .form-submit {
            background-color: #F2D8DD;
            color: #fff;
            font-size: 18px;
            padding: 10px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-submit:hover {
            box-shadow: 2px 2px 10px #a5a5a5;
            transform: scale(1.03);
        }

        .date-inputs {
            display: flex;
            justify-content: space-between;
        }

        .date-inputs input {
            width: 200px;
        }
    </style>
</head>
<body>
<div id="modalContainer">
    <div style="text-align: end">
        <button id="closeModalButton">×</button>
    </div>
    <div id="modalTitle">일정을 입력하세요</div>
    <div>
        <label class="form-label" for="petSelection">반려견</label>
        <select class="form-select" id="petSelection">
        </select>
    </div>
    <div class="date-inputs">
        <div>
            <label class="form-label">시작 날짜</label>
            <input autocomplete="off" type="date" class="form-control" id="calendar_start_date"
                   name="calendar_start_date">
        </div>
        <div>
            <label class="form-label">마감 날짜</label>
            <input autocomplete="off" type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
        </div>
    </div>
    <div>
        <label class="form-label">일정 내용</label>
        <input style="width: 480px" autocomplete="off" type="text" class="form-control" id="eventDescription"
               name="eventDescription">
    </div>

    <div style="text-align: center">
        <button class="form-submit" type="button" id="addEventButton">일정 등록</button>
    </div>
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

    const closeModalButton = document.getElementById("closeModalButton");
    const modalContainer = document.getElementById("modalContainer");

</script>
</body>
</html>
