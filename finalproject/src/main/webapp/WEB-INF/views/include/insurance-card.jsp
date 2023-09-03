<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    img {
        width: 160px;
    }

    .card {
        padding: 20px;
    }

    .desc {
        color: #008485;
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
        margin-right: 100px;
    }

    .title {
        font-size: 15px;
        font-family: font-medium;
    }

    .des {
        font-size: 15px;
        color: #999999;
        font-family: font-medium;
        margin-top: -10px;
    }

    .plus {
        margin-left: 50px;
    }

    .minus {
        margin-left: -10px;
    }

    .top {
        margin-top: 20px;
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
        color: #999999;
        margin-right: 20px; /* 원하는 마진 크기로 조정합니다. */
        margin-bottom: 9px;
    }

    .money {
        margin-top: 20px;
        font-weight: bold;
        font-family: font-medium;
        margin-bottom: 10px;
    }

    .buttons {
        display: flex;
    }

    .detail-btn {
        background-color: rgb(255, 170, 0);
        border: 0.1rem solid rgb(255, 170, 0);
        color: rgb(255, 255, 255);
        cursor: pointer;
        text-align: center;
        width: 120px;
        border-radius: 0.5rem;
        margin-right: 20px;
    }

    .join-btn {
        background-color: rgb(255, 170, 0);
        border: 0.1rem solid rgb(255, 170, 0);
        color: rgb(255, 255, 255);
        cursor: pointer;
        text-align: center;
        width: 120px;
        border-radius: 0.5rem;
    }

</style>
<div class="card"><img
        src="https://prod.petfins.net/company/17/c2299d83-c219-425a-ba08-4890a3247477_현대해상.png" alt="보험사로고"
        class="image">
    <div class="card-content">
        <div class="desc">슬개골 빼고 다 보장하는</div>
        <div class="name">하이펫애견보험 종합형 플랜</div>
        <div class="content-detail">
            <div class="left">
                <div class="title"><p>치료비</p>
                    <p class="des">사고/질병당 50만원, 연 1,000만원</p>
                    <p class="bold">10,000,000원</p></div>
                <div class="title plus"><p>피부질환</p>
                    <p class="des">치료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title minus"><p>구강질환</p>
                    <p class="des">치료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title top"><p>배상책임</p>
                    <p class="des">1사고당 500만원, 연 500만원</p>
                    <p class="bold">5,000,000원</p></div>
                <div class="title plus top"><p>애견장례비</p>
                    <p class="des">15만원 (1회 한도)</p>
                    <p class="bold">150,000원</p></div>
            </div>
            <div class="right"><p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI"><label for="1year0" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                     name="period0"
                                                                                                     id="1year0"
                                                                                                     class="sc-gHLcSH bRNyiY"
                                                                                                     value="1년형"
                                                                                                     checked>1년형</label><label
                            for="3year0" class="sc-KfMfS lauCaU"><input type="radio" name="period0" id="3year0"
                                                                        disabled="" class="sc-gHLcSH bRNyiY"
                                                                        value="3년형">3년형</label></div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump0" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                    name="payment0"
                                                                                                    id="lump0"
                                                                                                    class="sc-gHLcSH bRNyiY"
                                                                                                    value="일시납">일시납</label><label
                            for="monthly0" class="sc-KfMfS lauCaU"><input type="radio" name="payment0" id="monthly0"
                                                                          class="sc-gHLcSH bRNyiY" value="월납" checked>월납</label>
                    </div>
                </div>
                <div class="money"><p> 월납 31,246원</p>
                    <p class="des">기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="detail-btn">자세히 보기</button>
                    <button class="join-btn">가입하기</button>
                </div>
            </div>
        </div>
    </div>
</div>



