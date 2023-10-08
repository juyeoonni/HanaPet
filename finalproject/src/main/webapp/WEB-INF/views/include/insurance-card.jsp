<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
    img {
        width: 160px;
    }

    .card {
        padding: 30px;
        margin-bottom: 30px;
        border: 3px solid #E1E6DE; /* 5px 크기의 #BFDFCB 테두리 설정 */
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
    }

    .desc {
        color: var(--primary-color);
        font-size: 17px;
        margin-top: 20px;
    }

    .name {
        font-size: 28px;
        font-family: font-medium;
        font-weight: bold;
        margin-bottom: 40px;
    }

    .content-detail {
        display: flex;
    }

    .left {
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* 3개의 열을 생성합니다. */
        gap: 20px; /* 열 사이의 간격을 조절할 수 있습니다. */
        margin-right: 75px;
    }

    .title {
        width: 12rem;
        padding-bottom: 5px;
    }

    .title div:nth-child(1) {
        font-size: 15px;
        margin-bottom: 5px;
        padding-bottom: -5px;
    }

    .title div:nth-child(2) {
        font-size: 16px;
        margin-bottom: 5px;
        font-family: font-medium;
        color: #B6D2C1;
    }

    .title div:nth-child(3) {
        font-size: 20px;
        font-family: font-medium;
        font-weight: bold;
    }

    /* 선택된 체크박스의 색상 */
    input[type="checkbox"]:checked {
        background-color: var(--primary-color); /* 선택된 상태일 때 배경 색상 변경 */
        border: 2px solid var(--primary-color); /* 선택된 상태일 때 테두리 색상 변경 */
    }

    .bold {
        font-weight: bold;
        font-family: font-medium;
        margin-top: -20px;
    }

    .lauCaU {
        font-size: 16px;
    }

    .sc-KfMfS {
        color: var(--primary-color);
        margin-right: 20px; /* 원하는 마진 크기로 조정합니다. */
        margin-bottom: 9px;
    }

    .disabled {
        color: #E1E6DE;
    }

    .money p:nth-child(1) {
        margin-top: 20px;
        font-weight: bold;
        font-family: font-medium;
        font-size: 29px;
        color: var(--primary-color);
    }

    .money p:nth-child(2) {
        margin-top: -10px;
        margin-bottom: 40px;
        font-size: 14px;
        color: #324D3D;
    }

    .buttons {
        display: flex;
    }

    .join-btn:hover {
        box-shadow: 2px 2px 10px #a5a5a5;
        transform: scale(1.05);
    }

    .join-btn {
        background-color: var(--primary-color);
        border: none;
        color: rgb(255, 255, 255);
        cursor: pointer;
        text-align: center;
        width: 200px;
        border-radius: 10px;
        font-size: 18px;
        padding: 10px 20px;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        outline: none;
    }


</style>

<div>
    <c:forEach var="insuranceProduct" items="${insuranceProductList}" varStatus="loop">
        <div class="card">
            <img src="resources/img/${insuranceProduct.image}"/>
            <div class="card-content">
                <div class="desc">${insuranceProduct.description}</div>
                <div class="name">${insuranceProduct.insurance_name}
                </div>
                <div class="content-detail">
                    <div class="left">
                            ${insuranceProduct.guarantee}
                    </div>
                    <div class="right">
                        <p class="bold">보험료 납입 옵션</p>
                        <div class="check-option">
                            <div class="sc-cHPgQl eHGAsI">
                                <label for="1year${loop.index}" class="sc-KfMfS lauCaU
                                    ${(insuranceProduct.year != '1년형') ? 'disabled' : ''}">
                                    <input type="radio"
                                           name="period${loop.index}"
                                           id="1year${loop.index}"
                                           class="sc-gHLcSH bRNyiY"
                                           value="1년형"
                                        ${(insuranceProduct.year == '1년형') ? 'checked' : ''}
                                        ${(insuranceProduct.year != '1년형') ? 'disabled' : ''}>
                                    1년형
                                </label>
                                <label for="3year${loop.index}" class="sc-KfMfS lauCaU
                                    ${(insuranceProduct.year != '3년형') ? 'disabled' : ''}">
                                    <input type="radio"
                                           name="period${loop.index}"
                                           id="3year${loop.index}"
                                           class="sc-gHLcSH bRNyiY"
                                           value="3년형"
                                        ${(insuranceProduct.year == '3년형') ? 'checked' : ''}
                                        ${(insuranceProduct.year != '3년형') ? 'disabled' : ''}>
                                    3년형
                                </label>
                            </div>
                            <div class="sc-cHPgQl eHGAsI">
                                <label for="lump${loop.index}" class="sc-KfMfS lauCaU
                                    ${(insuranceProduct.period != '일시납') ? 'disabled' : ''}">
                                    <input type="radio"
                                           name="payment${loop.index}"
                                           id="lump${loop.index}"
                                           class="sc-gHLcSH bRNyiY"
                                           value="일시납"
                                        ${(insuranceProduct.period == '일시납') ? 'checked' : ''}
                                        ${(insuranceProduct.period != '일시납') ? 'disabled' : ''}>
                                    일시납
                                </label>
                                <label for="monthly${loop.index}" class="sc-KfMfS lauCaU
                                    ${(insuranceProduct.period !='월납') ? 'disabled' : ''}">
                                    <input type="radio"
                                           name="payment${loop.index}"
                                           id="monthly${loop.index}"
                                           class="sc-gHLcSH bRNyiY"
                                           value="월납"
                                        ${(insuranceProduct.period == '월납') ? 'checked' : ''}
                                        ${(insuranceProduct.period != '월납') ? 'disabled' : ''}>
                                    월납
                                </label>
                            </div>
                        </div>
                        <div class="money">
                            <p>${insuranceProduct.period} <fmt:formatNumber value="${insuranceProduct.amount}"
                                                                            type="number"
                                                                            pattern="#,###"/>원</p>
                            <p>${insuranceProduct.amount_desc}</p>
                        </div>
                        <div class="buttons">
                            <button class="join-btn">가입하기
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </c:forEach>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 모든 join-btn 요소를 가져옵니다.
        var joinButtons = document.getElementsByClassName("join-btn");

        // 각 버튼에 이벤트 리스너를 추가합니다.
        for (let btn of joinButtons) {
            btn.addEventListener("click", function (event) {
                // 클릭된 버튼의 부모 요소를 통해 필요한 정보를 가져옵니다.
                var cardContent = event.target.closest(".card-content");
                var insuranceName = cardContent.querySelector(".name").textContent.trim();
                var insuranceAmount = cardContent.querySelector(".money p").textContent.split(" ")[1].trim();

                // 정보를 객체로 저장
                var insuranceInfo = {
                    insuranceName: insuranceName,
                    insuranceAmount: insuranceAmount
                };

                // 세션에 정보 저장
                sessionStorage.setItem("selectedInsurance", JSON.stringify(insuranceInfo));

                // 새 페이지로 이동
                window.location.href = "/insurance-detail";
            });
        }
    });
</script>
