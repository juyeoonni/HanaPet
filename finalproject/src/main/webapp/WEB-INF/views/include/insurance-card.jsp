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
        border: 3px solid #E1E6DE;
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
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
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

    input[type="checkbox"]:checked {
        background-color: var(--primary-color);
        border: 2px solid var(--primary-color);
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
        margin-right: 20px;
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
        var joinButtons = document.getElementsByClassName("join-btn");

        for (let btn of joinButtons) {
            btn.addEventListener("click", function (event) {
                var cardContent = event.target.closest(".card-content");
                var insuranceName = cardContent.querySelector(".name").textContent.trim();
                var insuranceAmount = cardContent.querySelector(".money p").textContent.split(" ")[1].trim();

                var insuranceInfo = {
                    insuranceName: insuranceName,
                    insuranceAmount: insuranceAmount
                };
                sessionStorage.setItem("selectedInsurance", JSON.stringify(insuranceInfo));
                window.location.href = "/insurance-detail";
            });
        }
    });
</script>
