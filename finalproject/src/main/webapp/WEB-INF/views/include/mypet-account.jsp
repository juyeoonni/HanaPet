<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
        .card-box {
            padding: 10px 20px 20px 10px;
            border-bottom: 1px solid;
        }

        .toggleSwitch {
            width: 50px; /* 전체 너비를 50%로 축소 */
            height: 25px; /* 전체 높이를 50%로 축소 */
            display: block;
            position: relative;
            border-radius: 15px; /* 반지름도 50%로 축소 */
            background-color: #fff;
            box-shadow: 0 0 8px 1.5px rgba(0 0 0 / 15%);
            cursor: pointer;
            margin-bottom: 10px; /* 마진도 50%로 축소 */
        }

        .toggleSwitch .toggleButton {
            width: 20px; /* 토글 버튼의 너비를 조절 */
            height: 20px; /* 토글 버튼의 높이를 조절 */
            position: absolute;
            top: 50%;
            left: 2px; /* 왼쪽 위치를 조절 */
            transform: translateY(-50%);
            border-radius: 50%;
            background: #75a989;
        }

        .toggles:checked ~ .toggleSwitch {
            background: #75a989;
        }

        .toggles:checked ~ .toggleSwitch .toggleButton {
            left: calc(100% - 22px); /* 토글 버튼의 왼쪽 위치를 조절 */
            background: #fff;
        }

        .toggleSwitch, .toggleButton {
            transition: all 0.2s ease-in;
        }

        #text-right3 {
            text-align: end;
        }

        td{
            color: #324D3D !important;
        }
    </style>

</head>

<body>
<div style="display:flex;">
    <div id="top-box">
        <div class="guest">
            <img src="/resources/img/logo-one.png" width="40px"/> <%=guest_name%>님
        </div>
        <div id="info-text3" style="color: #75a989">
            총
        </div>
        <div id="text-right3" style="font-weight: bold;">
            총 자산
        </div>
    </div>
    <div id="top-box2">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title" style="padding-bottom: 5px"><b>자산 한눈에 보기</b></h5>
                    <div class="table-responsive">
                        <table class="table table-striped" style="margin-bottom: 0px">
                            <tbody>
                            <tr>
                                <td>
                                    반려견 적금
                                </td>
                                <td id="jk3">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    반려견 보험
                                </td>
                                <td>
                                    -
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    내 계좌
                                </td>
                                <td id="ma3">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
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

                data.forEach(function (account, index) {
                    totalAmount += account.balance;

                    const card = document.createElement('div');
                    card.classList.add('card-box');

                    const cardBody = document.createElement('div');
                    cardBody.style.display = "flex";
                    cardBody.style.justifyContent = "space-between";
                    cardBody.classList.add('card-body');

                    const left = document.createElement('div');
                    const accountName = document.createElement('div');
                    accountName.style.fontWeight = 'bold'
                    accountName.textContent = account.account_name;
                    const accountNumber = document.createElement('div');
                    accountNumber.textContent = account.account_number.slice(0, 16) + '*';

                    left.appendChild(accountName);
                    left.appendChild(accountNumber);

                    const balance = document.createElement('div');
                    balance.id = 'balance' + index;
                    balance.style.alignSelf = 'center';
                    balance.textContent = Number(account.balance).toLocaleString() + '원';

                    const history = document.createElement('button');
                    history.textContent = '거래 내역';

                    const text = document.createElement("span");
                    text.style.marginRight = '10px';
                    text.textContent = '자산 보이기';
                    const checkbox = document.createElement("input");
                    checkbox.type = "checkbox";
                    checkbox.id = "toggle" + index;
                    checkbox.className = 'toggles';
                    checkbox.hidden = true;
                    const label = document.createElement("label");
                    label.setAttribute("for", "toggle" + index);
                    label.className = "toggleSwitch";
                    const span = document.createElement("span");
                    span.className = "toggleButton";
                    label.appendChild(span);

                    const togglebox = document.createElement("div");
                    togglebox.style.display = 'flex';
                    togglebox.appendChild(text);
                    togglebox.appendChild(checkbox);
                    togglebox.appendChild(label);

                    const right = document.createElement("right");
                    right.style.textAlign = 'end';
                    right.appendChild(togglebox);
                    right.appendChild(history);

                    cardBody.appendChild(left);
                    cardBody.appendChild(balance);
                    cardBody.appendChild(right);

                    card.appendChild(cardBody);
                    accountBox.appendChild(card);

                    const toggleCheckbox = document.getElementById("toggle" + index);
                    toggleCheckbox.addEventListener("change", function () {
                        const toggleButton = toggleCheckbox.nextElementSibling.querySelector(".toggleButton");
                        if (toggleCheckbox.checked) {
                            console.log("체크 박스가 체크되었습니다.");
                            document.getElementById('balance' + index).textContent = "체크";
                            toggleButton.style.left = 'calc(100% - 22px)';
                            // toggleButton.style.background = 'white'; // 토글 버튼의 배경색 변경
                            // toggleCheckbox.style.backgroundColor = '#75a989'; // 토글 체크박스의 배경색 변경
                        } else {
                            console.log("체크 박스가 해제되었습니다.");
                            document.getElementById('balance' + index).textContent = "잔액 숨김 중";
                            toggleButton.style.left = '2px';
                            // toggleButton.style.background = '#75a989'; // 토글 버튼의 배경색 변경
                            // toggleCheckbox.style.backgroundColor = 'white'; // 토글 체크박스의 배경색 변경
                        }
                    });

                });
                document.getElementById("info-text3").textContent += " " + data.length + "개의 계좌가 있습니다.";
                document.getElementById("text-right3").textContent += totalAmount.toLocaleString() + "원";
            },
            error: function (xhr, status, error) {
                console.error('Error fetching account list:', error);
            }
        });


    });


</script>

</body>
