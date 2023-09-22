<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>

        /* 막대 그래프 컨테이너 스타일 */
        .progress-bar-container {
            width: 100%;
            height: 35px; /* 막대 그래프의 높이 조절 */
            background-color: #ccc; /* 막대 그래프 바의 배경색 */
            border-radius: 50px; /* 모서리를 둥글게 만듭니다. */
            margin-bottom: 5px; /* 각 막대 그래프 사이에 간격 추가 */
        }

        /* 막대 그래프 바 초기 스타일 */
        .progress-bar {
            height: 100%;
            background-color: #4CAF50; /* 막대 그래프의 색상 */
            text-align: center;
            line-height: 20px; /* 텍스트를 수직으로 중앙 정렬 */
            color: #fff; /* 텍스트 색상 */
            border-radius: 50px; /* 왼쪽 모서리만 둥글게 만듭니다. */
            width: 0; /* 초기 너비를 0으로 설정 */
            transition: width 1s ease-in-out; /* 너비 변화에 대한 애니메이션 설정 */
        }

        /* 막대 그래프 진행률 텍스트 스타일 */
        .progress-text {
            margin-left: 5px; /* 텍스트와 막대 그래프 사이의 간격 추가 */
        }

        .menu-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 40px;
        }

        .top-container, .left-container {
            display: flex;
            justify-content: space-between;
        }

        .button-container {
            text-align: end;
        }

        .middle-box {
            background: #75A989;
            box-shadow: 0px 3px 3px rgba(0, 0, 0, 0.25);
            border-radius: 10px 10px 0px 0px;
            width: auto;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0px 30px;
        }

        #top-box {
            width: 100%;
            height: 120px;
            margin-top: 10px;
            background: #E1E6DE;
            /*box-shadow: 4px 4px 15px 1px rgba(0, 0, 0, 0.2);*/
            border-radius: 10px;
            margin-bottom: 40px;
        }

        #text-right {
            text-align: end;
        }

        .accordion-button {
            background-color: white !important;
            border: 2px solid #E1E6DE;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        }

        .smallsize {
            font-size: 15px;
        }

        .accordion-body {
            padding: 15px !important;
        }

        .account-container {
            padding: 20px 0px;
            border-bottom: 2px solid #E1E6DE !important;
        }

        /* 기본 버튼 스타일 */
        .custom-btn {
            background-color: #75A989;
            border: 1px solid #fff;
            color: #fff; /* 텍스트 색상을 흰색으로 지정 */
        }

        /* 선택된 버튼 스타일 */
        .custom-btn:checked {
            background-color: #BFDFCB !important; /* 선택된 버튼의 배경색 변경 */
            border: 1px solid #fff; /* 선택된 버튼의 테두리 스타일 변경 */
            color: #fff; /* 선택된 버튼의 텍스트 색상을 흰색으로 유지 */
        }

        /* 호버 상태일 때의 스타일 */
        .custom-btn:hover {
            background-color: #BFDFCB; /* 호버 상태일 때 배경색 변경 */
            border: 1px solid #fff; /* 호버 상태일 때 테두리 스타일 변경 */
            color: #fff; /* 호버 상태일 때 텍스트 색상을 흰색으로 유지 */
        }
    </style>

</head>

<body>
<div id="top-box">
    <div>
        <%=guest_name%>님
    </div>
    <div id="info-text3">
        총
    </div>
    <div id="text-right3">
        총 잔액
    </div>
</div>
<div class="account-box" id="account-box">
    <!-- 동적으로 카드 넣기 -->
</div>
<script>
    $(document).ready(function () {
        var guest_id = '<%= guest_id %>'; // Java 값을 JavaScript 변수로 전달
        var totalAmount = 0;

        // Ajax로 예금 계좌 목록 가져와서 옵션 추가
        $.ajax({
            url: '/depositaccounts',
            method: 'GET',
            data: {
                guest_id: guest_id
            },
            dataType: 'json',
            success: function (data) {
                const accountBox = document.getElementById('account-box');

                data.forEach(function (account) {
                    totalAmount += account.balance;
                    // 새로운 카드 요소 생성
                    const card = document.createElement('div');
                    card.classList.add('card-box'); // 원하는 클래스 추가

                    // 카드 본문 생성
                    const cardBody = document.createElement('div');
                    cardBody.classList.add('card-body'); // 원하는 클래스 추가

                    // 카드 내용 구성
                    const accountNumber = document.createElement('div');
                    accountNumber.textContent = '계좌번호: ' + account.account_number;

                    const balance = document.createElement('div');
                    balance.textContent = '잔액: ' + account.balance + '원';

                    const accountName = document.createElement('div');
                    accountName.textContent = '계좌명: ' + account.account_name;

                    const history = document.createElement('button');
                    history.textContent = '거래 내역';

                    // 카드 본문에 내용 추가
                    cardBody.appendChild(accountNumber);
                    cardBody.appendChild(balance);
                    cardBody.appendChild(accountName);
                    cardBody.appendChild(history)

                    // 카드에 본문 추가
                    card.appendChild(cardBody);

                    // 카드를 account-box에 추가
                    accountBox.appendChild(card);
                });
                document.getElementById("info-text3").textContent += " " + data.length + "개의 계좌가 있습니다.";
                document.getElementById("text-right3").textContent += totalAmount + "원";
            },
            error: function (xhr, status, error) {
                console.error('Error fetching account list:', error);
            }
        });
    });

</script>

</body>
