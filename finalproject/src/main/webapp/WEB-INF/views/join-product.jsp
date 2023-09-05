<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>Join-Product</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>

        .first-section {
            text-align: center;
        }

        #productCategory {
            font-size: 31px;
            margin-bottom: 15px;
        }

        #productDescription {
            font-family: font-medium;
            margin-bottom: 15px;
        }

        .line {
            background: #CFDBC8;
            border-radius: 80px;
            width: auto;
            height: 2.5px;
            margin-bottom: 20px;
        }

        .title {
            font-family: font-medium;
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* 테이블 전체 스타일 */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        /* 테이블 행 스타일 */
        tr {
            border-bottom: 1px solid #ddd;
        }

        /* 테이블 셀 스타일 */
        td {
            padding: 20px 0px 20px 30px;
            text-align: left;
            font-family: font-medium;
        }

        /* 라벨 셀 스타일 */
        td.form-label {
            font-weight: bold;
            width: 190px;
        }

        /* 입력 필드 스타일 */
        .input-form {
            width: 400px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-right: 5px;
        }

        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            appearance: none;
            margin: 0;
        }

        /* 드롭다운 스타일 */
        .form-select {
            width: 400px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* 확인 버튼 스타일 */
        .Button {
            display: inline-block;
            text-align: center;
            width: 150px;
            height: 44px;
            font-size: 18px;
            padding: 10px 20px;
            color: #fff;
            border: none;
            cursor: pointer;
            background: #75A989;
            border-radius: 10px;
            outline: none;
        }

        #joinButton {
            margin-top: 50px;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        }

        #confirmButton {
            margin-left: 40px;
        }

        /* 오류 메시지 스타일 */
        .text-danger {
            color: #dc3545;
            font-size: 14px;
            margin-top: 5px;
        }

        /* 라디오 버튼 스타일 */
        input[type="radio"] {
            margin-right: 5px;
        }

        tbody tr:nth-child(1) {
            border-top: 3px solid #75A989;
        }

        tbody tr:nth-last-child(1) {
            border-bottom: 3px solid #75A989;
        }

        /* 홀수 번째 td 배경색 스타일 */
        td:nth-child(odd) {
            background-color: #E1E6DE;
        }

        ::placeholder {
            color: #BFDFCB;
        }

        #endDateMessage, #pwMessage {
            margin-top: 5px;
            font-size: 17px;
            color: #75A989;
        }

        .color {
            margin-left: 40px;
        }

        #current_balance, #able_balance, .color div div {
            font-size: 17px;
            color: #75A989;
            margin-right: 6px;
            font-family: font-medium;
        }

        ::placeholder {
            font-family: font-medium;
        }

        .pe input[type=radio] {
            display: none;
        }

        .pe input[type=radio] + label {
            display: inline-block;
            text-align: center;
            width: 150px;
            height: 36px;
            font-size: 18px;
            border: none;
            border: 1px solid #75A989;
            cursor: pointer;
            background: #ffffff;
            border-radius: 10px;
            padding-top: 8px;
            margin-right: 20px;
        }

        .pe input[type=radio]:checked + label {
            display: inline-block;
            text-align: center;
            width: 150px;
            height: 36px;
            font-size: 18px;
            color: #fff;
            border: none;
            cursor: pointer;
            background: #75A989;
            border-radius: 10px;
            outline: none;
            padding-top: 8px;
        }

    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <%@ include file="include/product-header.jsp" %>
    <div class="title">적금 상품 가입</div>
    <form>
        <br>
        <div>기본 정보</div>
        <br>
        <table class="table">
            <tr>
                <td class="form-label">출금 계좌번호</td>
                <td>
                    <div style="display: flex">
                        <select class="form-select" id="accountNumberSelection" required onchange="updateBalance()">
                            <!-- Ajax로 옵션 추가될 예정 -->
                        </select>
                        <div class="color">
                            <div style="display: flex">
                                <div>현재 잔액:</div>
                                <div id="current_balance"></div>
                            </div>
                            <div style="display: flex">
                                <div>출금 가능 금액:</div>
                                <div id="able_balance"></div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="form-label">계좌 비밀번호</td>
                <td>
                    <div style="display: flex">
                        <div>
                            <input type="password" class="input-form" id="accountPassword"
                                   placeholder="계좌 비밀번호를 입력해주세요."
                                   required>
                            <div id="pwMessage"></div>
                        </div>
                        <button class="Button" id="confirmButton">확인</button>
                    </div>
                </td>
            </tr>
        </table>
        <br>
        <div>상품 정보</div>
        <br>
        <table class="table">
            <tr>
                <td class="form-label">반려견 정보</td>
                <td>
                    <select class="form-select" id="petSelection" required>
                        <!-- Ajax로 옵션 추가될 예정 -->
                    </select>
                </td>
            </tr>
            <tr>
                <td class="form-label">가입 기간</td>
                <td>
                    <input type="number" class="input-form" id="joinPeriod" placeholder="적금 기간을 입력해주세요" required><span>개월</span>
                    <div id="conditionMessage2" class="mt-2 text-danger"></div>
                    <div id="endDateMessage"></div>
                </td>
            </tr>
            <tr>
                <td class="form-label">가입 금액</td>
                <td>
                    <input type="number" class="input-form" id="joinAmount" placeholder="금액을 입력해주세요."
                           required><span>월</span>
                    <div id="conditionMessage1" class="mt-2 text-danger"></div>
                </td>
            </tr>
            <tr>
                <td class="form-label">이체 주기</td>
                <td>
                    <div class="pe" id="transferCycle" required>
                        <input type="radio" id="period1" name="period" value="매주">
                        <label for="period1">매주</label>
                        <input type="radio" id="period2" name="period" value="매월" checked>
                        <label for="period2">매월</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="form-label">자동이체 SMS 통보</td>
                <td>
                    <div class="pe" id="transferSMS" required>
                        <input type="radio" id="transferSMSyes" name="transferSMS" value="yes" checked><label
                            for="transferSMSyes">신청함</label>
                        <input type="radio" id="transferSMSno" name="transferSMS" value="no"><label for="transferSMSno">신청안함</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="form-label">적금 만기 SMS 통보</td>
                <td>
                    <div class="pe" id="finishSMS" required>
                        <input type="radio" id="finishSMSyes" name="finishSMS" value="yes" checked><label
                            for="finishSMSyes">신청함</label>
                        <input type="radio" id="finishSMSno" name="finishSMS" value="no"><label
                            for="finishSMSno">신청안함</label>
                    </div>
                </td>
            </tr>
        </table>

        <!-- 조건 충족 여부에 따른 가입 버튼 -->
        <div style="text-align: center">
            <button type="button" class="Button" id="joinButton">가입하기</button>
        </div>
    </form>
</div>
</body>

<%
    String guest_id = (String) session.getAttribute("guest_id");
%>
<script>
    let flag1 = false;
    let flag2 = false;

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
                    option.value = account.balance;
                    option.textContent = account.account_number;
                    accountNumberSelection.appendChild(option);
                });
                document.getElementById("current_balance").textContent = data[0].balance;
                document.getElementById("able_balance").textContent = data[0].balance;
            },
            error: function (xhr, status, error) {
                console.error('Error fetching account list:', error);
            }
        });

        // Ajax로 예금 계좌 비밀번호 일치 확인
        $("#confirmButton").click(function (event) {
            // 선택된 계좌 옵션의 text 가져오기
            const account_number = $("#accountNumberSelection option:selected").text();
            // 입력한 계좌 비밀번호 가져오기
            const account_pw = $("#accountPassword").val();

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
                        document.getElementById('pwMessage').textContent = "비밀번호가 틀립니다.";
                        flag1 = false;
                    } else { // 비번 일치하는 경우
                        document.getElementById('pwMessage').textContent = "비밀번호가 일치합니다.";
                        flag1 = true;
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching account list:', error);
                }
            });
            event.preventDefault();
        });

        const joinAmountInput = document.getElementById('joinAmount');
        const joinPeriodInput = document.getElementById('joinPeriod');
        const conditionMessage1 = document.getElementById('conditionMessage1');
        const conditionMessage2 = document.getElementById('conditionMessage2');

        const minBalance = parseFloat('${param.min_balance}');
        const minPeriod = parseFloat('${param.min_period}');

        // 가입 버튼 활성화/비활성화 함수
        function toggleJoinButton() {

            const joinAmount = parseFloat(joinAmountInput.value);
            const joinPeriod = parseFloat(joinPeriodInput.value);
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

            flag2 = joinAmount >= minBalance && joinPeriod >= minPeriod;
        }

        function endDate() {
            const minPeriod = parseFloat('${param.min_period}');
            const joinPeriod = parseInt(joinPeriodInput.value);
            const endDate = calculateEndDate(joinPeriod);
            const endDateMessage = document.getElementById('endDateMessage');
            let message3 = '';
            if (joinPeriod >= minPeriod) {
                message3 += "적금 만기 예정일은 " + endDate + " 입니다.";
            }
            endDateMessage.textContent = message3;
        }

        function calculateEndDate(months) {
            var today = new Date(); // 현재 날짜 가져오기
            var endDate = new Date(today); // 현재 날짜를 복사하여 사용

            endDate.setMonth(today.getMonth() + months); // 월을 더해 몇 개월 후의 날짜 계산

            // 날짜 포맷 설정 (예: "YYYY-MM-DD")
            var year = endDate.getFullYear();
            var month = String(endDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1을 해주고 2자리로 포맷
            var day = String(endDate.getDate()).padStart(2, '0'); // 일자를 2자리로 포맷

            return year + '년 ' + month + '월 ' + day + '일';
        }

        // 입력 값 변경 시 가입 버튼 상태 업데이트
        joinAmountInput.addEventListener('input', toggleJoinButton);
        joinPeriodInput.addEventListener('input', toggleJoinButton);
        joinPeriodInput.addEventListener('input', endDate);


        // 세션에서 제품 정보 가져오기
        const productInfo = JSON.parse(sessionStorage.getItem("selectedProduct"));

        // 제품 정보를 화면에 표시
        if (productInfo) {
            $("#productImg").attr("src", "/resources/img/" + productInfo.image);
            $("#productCategory").text(productInfo.category + " 펫 적금");
            $("#productDescription").text(productInfo.description);
            $("#productRate").text("이자율: " + productInfo.rate);
            $("#productMinPeriod").text("최소 기간: " + productInfo.min_period);
            $("#productMinBalance").text("최소 잔액: " + productInfo.min_balance);
        }
    });

    function updateBalance() {
        // select 요소에서 선택한 값을 가져오기
        const selectedValue = document.getElementById("accountNumberSelection").value;

        // 선택한 값을 # 요소에 표시
        document.getElementById("current_balance").textContent = selectedValue;
        document.getElementById("able_balance").textContent = selectedValue;

        // 계좌 비밀번호 입력창 reset
        document.getElementById('accountPassword').value = "";
        document.getElementById('pwMessage').textContent = "";
        flag1 = false;

    }

    document.getElementById('joinButton').addEventListener('click', function (event) {
        if (flag1 && flag2) {
            window.location.href = '/card'; // 페이지 이동 처리
        } else {
            if (!flag1) alert("계좌 비밀번호를 확인해주세요.");
            else alert("가입 조건을 확인해주세요.");
            event.preventDefault(); // 조건을 만족하지 않을 경우 폼 제출 및 페이지 이동 중지
        }
    });

</script>