<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Join-Product</title>
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
        <!-- 펫 정보 -->
        <div class="mb-3">
            <label for="petSelection" class="form-label">누구를 위한 적금인가요?</label>
            <select class="form-select" id="petSelection" required>
                <option value="" disabled selected>강아지를 선택해주세요.</option>
                <!-- Ajax로 옵션 추가될 예정 -->
            </select>
        </div>

        <!-- 출금 계좌 정보 -->
        <div class="mb-3">
            <label for="accountNumberSelection" class="form-label">어떤 계좌와 연결할까요?</label>
            <select class="form-select" id="accountNumberSelection" required>
                <option value="" disabled selected>연결하실 계좌를 선택해주세요.</option>
                <!-- Ajax로 옵션 추가될 예정 -->
            </select>
        </div>

        <!-- 계좌 비밀번호 -->
        <div class="mb-3">
            <label for="accountPassword" class="form-label">계좌 비밀번호</label>
            <input type="password" class="form-control" id="accountPassword" placeholder="계좌 비밀번호를 입력해주세요."
                   required>
            <button id="confirmButton">확인</button>
        </div>

        <!-- 상품 정보 -->
        <div class="mb-3">
            <label for="joinAmount" class="form-label">얼마를 입금할까요?</label>
            <input type="number" class="form-control" id="joinAmount" placeholder="금액을 입력해주세요." required>
            <p id="conditionMessage1" class="mt-2 text-danger"></p>
        </div>

        <div class="mb-3">
            <label for="joinPeriod" class="form-label">적금 기간</label>
            <input type="number" class="form-control" id="joinPeriod" placeholder="적금 기간을 입력해주세요" required>
            <p id="conditionMessage2" class="mt-2 text-danger"></p>
        </div>

        <div class="mb-3">
            <label for="transferCycle" class="form-label">자동이체 주기</label>
            <select class="form-select" id="transferCycle" required>
                <option value="" disabled selected>자동이체 주기를 선택해주세요</option>
                <option value="monthly">매달</option>
                <option value="weekly">매주</option>
            </select>
        </div>

        <!-- 조건 충족 여부에 따른 가입 버튼 -->
        <button type="submit" class="btn btn-primary" id="joinButton" onclick="location.href='/test';">가입하기</button>
    </form>
</div>
</body>

<!-- 부트스트랩 JS 링크 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<%
    String guest_id = (String) session.getAttribute("guest_id");
%>
<script>
    $(document).ready(function () {
        var guest_id = '<%= guest_id %>';

        // Ajax로 강아지 목록 가져와서 옵션 추가
        $.ajax({
            url: '/pets',
            method: 'GET',
            data: {
                guest_id: guest_id
            },
            dataType: 'json',
            success: function (data) {
                const petSelection = document.getElementById('petSelection');
                data.forEach(function (pet) {
                    const option = document.createElement('option');
                    option.value = pet.name;
                    option.textContent = pet.name;
                    petSelection.appendChild(option);
                });
            },
            error: function (xhr, status, error) {
                console.error('Error fetching pet list:', error);
            }
        });

        // Ajax로 예금 계좌 목록 가져와서 옵션 추가
        $.ajax({
            url: '/depositaccounts',
            method: 'GET',
            data: {
                guest_id: guest_id
            },
            dataType: 'json',
            success: function (data) {
                const accountNumberSelection = document.getElementById('accountNumberSelection');
                data.forEach(function (account) {
                    const option = document.createElement('option');
                    option.value = account.account_number;
                    option.textContent = account.account_number;
                    accountNumberSelection.appendChild(option);
                });
            },
            error: function (xhr, status, error) {
                console.error('Error fetching account list:', error);
            }
        });

        // Ajax로 예금 계좌 비밀번호 일치 확인
        $("#confirmButton").click(function () {
            // 선택된 계좌 옵션의 값 가져오기
            var account_number = $("#accountNumberSelection").val();
            // 입력한 계좌 비밀번호 가져오기
            var account_pw = $("#accountPassword").val();

            $.ajax({
                url: '/checkdepositaccountpw',
                method: 'GET',
                data: {
                    guest_id: guest_id,
                    account_number: account_number,
                    account_pw: account_pw
                },
                dataType: 'json',
                success: function (data) {
                    if (data < 1) { // 비번 틀린 경우
                        console.log("비밀번호 불일치");
                    } else { // 비번 일치하는 경우
                        console.log("비밀번호 일치");
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching account list:', error);
                }
            });
        });

        const joinAmountInput = document.getElementById('joinAmount');
        const joinPeriodInput = document.getElementById('joinPeriod');
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
