<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>OneBank Pet Love Savings</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <!-- 부트스트랩 CSS 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <h2 class="mb-4">${param.category} 상품 가입</h2>
    <form>
        <!-- 기본 정보 -->
        <div class="mb-3">
            <label for="petSelection" class="form-label">Select Your Pet</label>
            <select class="form-select" id="petSelection" required>
                <option value="" disabled selected>Select a pet</option>
                <option value="dog">Dog</option>
                <!-- 다른 옵션 추가 가능 -->
            </select>
        </div>

        <!-- 출금 계좌 정보 -->
        <div class="mb-3">
            <label for="accountNumber" class="form-label">Withdrawal Account Number</label>
            <input type="text" class="form-control" id="accountNumber" placeholder="Enter account number" required>
        </div>

        <!-- 계좌 비밀번호 -->
        <div class="mb-3">
            <label for="accountPassword" class="form-label">Account Password</label>
            <input type="password" class="form-control" id="accountPassword" placeholder="Enter account password"
                   required>
        </div>

        <!-- 상품 정보 -->
        <div class="mb-3">
            <label for="joinAmount" class="form-label">Join Amount</label>
            <input type="number" class="form-control" id="joinAmount" placeholder="Enter join amount" required>
            <p id="conditionMessage1" class="mt-2 text-danger"></p>
        </div>
        <div class="mb-3">
            <label for="joinPeriod" class="form-label">Join Period (Months)</label>
            <input type="number" class="form-control" id="joinPeriod" placeholder="Enter join period" required>
            <p id="conditionMessage2" class="mt-2 text-danger"></p>
        </div>

        <div class="mb-3">
            <label for="transferCycle" class="form-label">Transfer Cycle</label>
            <select class="form-select" id="transferCycle" required>
                <option value="" disabled selected>Select transfer cycle</option>
                <option value="monthly">Monthly</option>
                <option value="quarterly">Quarterly</option>
                <option value="yearly">Yearly</option>
            </select>
        </div>

        <!-- 조건 충족 여부에 따른 가입 버튼 -->
        <button type="submit" class="btn btn-primary" id="joinButton">Join Now</button>

    </form>
</div>
</body>

<!-- 부트스트랩 JS 링크 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        const joinAmountInput = document.getElementById('joinAmount');
        const joinPeriodInput = document.getElementById('joinPeriod');
        const joinButton = document.getElementById('joinButton');
        const conditionMessage1 = document.getElementById('conditionMessage1');
        const conditionMessage2 = document.getElementById('conditionMessage2');

        // 가입 버튼 활성화/비활성화 함수
        function toggleJoinButton() {
            const joinAmount = parseFloat(joinAmountInput.value);
            const joinPeriod = parseFloat(joinPeriodInput.value);
            const minBalance = parseFloat('${param.min_balance}');
            const minPeriod = parseFloat('${param.min_period}');
            let message1 = '';
            let message2 = '';

            if (joinAmount < minBalance) {
                message1 += '최소 금액을 넘겨야 합니다. ';
            }

            if (joinPeriod < minPeriod) {
                message2 += '최소 기간을 넘겨야 합니다. ';
            }

            conditionMessage1.textContent = message1;
            conditionMessage2.textContent = message2;

        }

        // 입력 값 변경 시 가입 버튼 상태 업데이트
        joinAmountInput.addEventListener('input', toggleJoinButton);
        joinPeriodInput.addEventListener('input', toggleJoinButton);

        // 폼 제출 시 조건 확인 후 페이지 이동 막기
        $('form').submit(function (event) {
            const joinAmount = parseFloat(joinAmountInput.value);
            const joinPeriod = parseFloat(joinPeriodInput.value);
            const minBalance = parseFloat('${param.min_balance}');
            const minPeriod = parseFloat('${param.min_period}');

            if (joinAmount >= minBalance && joinPeriod >= minPeriod) {
                return true; // 조건을 만족할 경우 폼 제출 및 페이지 이동
            } else {
                event.preventDefault(); // 조건을 만족하지 않을 경우 폼 제출 및 페이지 이동 중지
            }
        });
    });
</script>
</html>
