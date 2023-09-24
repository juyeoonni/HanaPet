<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    img {
        width: 160px;
    }

    .card {
        padding: 30px;
        margin-bottom: 30px;
        border: 3px solid #BFDFCB; /* 5px 크기의 #BFDFCB 테두리 설정 */
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
    }

    .desc {
        color: #75A989;
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
        background-color: #75A989; /* 선택된 상태일 때 배경 색상 변경 */
        border: 2px solid #75A989; /* 선택된 상태일 때 테두리 색상 변경 */
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
        color: #75A989;
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
        color: #75A989;
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
        background-color: #75A989;
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

<body>
<div class="card"><img src="resources/img/insurance-logo.png"/>
    <div class="card-content">
        <div class="desc">입통원비가 따로 보장되는</div>
        <div class="name" id="insuranceName">프로미 반려동물보험 One형 플랜
        </div>
        <div class="content-detail">
            <div class="left">
                <div class="title">
                    <div>수술비</div>
                    <div>1회 150만원, 연 2회</div>
                    <div>3,000,000원</div>
                </div>
                <div class="title">
                    <div>치료비(입원)</div>
                    <div>1일 15만원, 연 20일</div>
                    <div>3,000,000원</div>
                </div>
                <div class="title">
                    <div>치료비(통원)</div>
                    <div>1회 15만원, 연 20회</div>
                    <div>3,000,000원</div>
                </div>
                <div class="title">
                    <div>피부 확장보장</div>
                    <div>치료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>구강확장보장</div>
                    <div>치료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>슬관절 확장보장</div>
                    <div>수술비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>배상책임</div>
                    <div>500만원 (1년 한도)</div>
                    <div>5,000,000원</div>
                </div>
                <div class="title">
                    <div>사망 위로금</div>
                    <div>15만원 (1회 한도)</div>
                    <div>150,000원</div>
                </div>
            </div>
            <div class="right">
                <p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI">
                        <label for="1year" class="sc-KfMfS lauCaU">
                            <input type="radio"
                                   name="period"
                                   id="1year"
                                   class="sc-gHLcSH bRNyiY"
                                   value="1년형"
                                   checked>1년형
                        </label>
                        <label for="3year" class="sc-KfMfS lauCaU disabled">
                            <input type="radio" name="period" id="3year"
                                   disabled="" class="sc-gHLcSH bRNyiY"
                                   value="3년형">3년형
                        </label>
                    </div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump" class="sc-KfMfS lauCaU">
                        <input type="radio"
                               name="payment"
                               id="lump"
                               class="sc-gHLcSH bRNyiY"
                               value="일시납" checked>일시납</label>
                        <label
                                for="monthly" class="sc-KfMfS lauCaU disabled">
                            <input type="radio" name="payment"
                                   id="monthly"
                                   disabled=""
                                   class="sc-gHLcSH bRNyiY" value="월납">월납
                        </label>
                    </div>
                </div>
                <div class="money">
                    <p>일시납 403,620원</p>
                    <p>기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="join-btn" id="join-btn">가입하기</button>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="card"><img src="resources/img/insurance-logo.png"/>
    <div class="card-content">
        <div class="desc">슬개골 빼고 다 보장하는</div>
        <div class="name">하이펫애견보험 종합형 플랜</div>
        <div class="content-detail">
            <div class="left">
                <div class="title">
                    <div>치료비</div>
                    <div>사고/질병당 50만원, 연 1,000만원</div>
                    <div>10,000,000원</div>
                </div>
                <div class="title">
                    <div>피부질환</div>
                    <div>치료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>구강질환</div>
                    <div>치료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>배상책임</div>
                    <div>1사고당 500만원, 연 500만원</div>
                    <div>5,000,000원</div>
                </div>
                <div class="title">
                    <div>애견장례비</div>
                    <div>15만원 (1회 한도)</div>
                    <div>150,000원</div>
                </div>
            </div>
            <div class="right">
                <p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI">
                        <label for="1year0" class="sc-KfMfS lauCaU">
                            <input type="radio"
                                   name="period0"
                                   id="1year0"
                                   class="sc-gHLcSH bRNyiY"
                                   value="1년형"
                                   checked>1년형
                        </label>
                        <label for="3year0" class="sc-KfMfS lauCaU disabled">
                            <input type="radio" name="period0" id="3year0"
                                   disabled="" class="sc-gHLcSH bRNyiY"
                                   value="3년형">3년형
                        </label>
                    </div>
                    <div class="sc-cHPgQl eHGAsI">
                        <label for="lump0" class="sc-KfMfS lauCaU">
                            <input type="radio"
                                   name="payment0"
                                   id="lump0"
                                   class="sc-gHLcSH bRNyiY"
                                   value="일시납">일시납
                        </label>
                        <label
                                for="monthly0" class="sc-KfMfS lauCaU">
                            <input type="radio" name="payment0" id="monthly0"
                                   class="sc-gHLcSH bRNyiY" value="월납" checked>월납
                        </label>
                    </div>
                </div>
                <div class="money"><p> 월납 31,246원</p>
                    <p>기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="join-btn">가입하기</button>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="card"><img src="resources/img/insurance-logo.png"/>
    <div class="card-content">
        <div class="desc">5,000원으로 대비하는</div>
        <div class="name">하이펫애견보험
            배상책임형 플랜
        </div>
        <div class="content-detail">
            <div class="left">
                <div class="title">
                    <div>배상책임</div>
                    <div>1사고당 500만원, 1년 한도</div>
                    <div>5,000,000원</div>
                </div>
                <div class="title">
                    <div>애견장례비</div>
                    <div>15만원 (1회 한도)</div>
                    <div>150,000원</div>
                </div>
            </div>
            <div class="right"><p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI"><label for="1year1" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                     name="period1"
                                                                                                     id="1year1"
                                                                                                     class="sc-gHLcSH bRNyiY"
                                                                                                     value="1년형"
                                                                                                     checked>1년형</label><label
                            for="3year1" class="sc-KfMfS lauCaU disabled"><input type="radio" name="period1" id="3year1"
                                                                                 disabled="" class="sc-gHLcSH bRNyiY"
                                                                                 value="3년형">3년형</label></div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump1" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                    name="payment1"
                                                                                                    id="lump1"
                                                                                                    class="sc-gHLcSH bRNyiY"
                                                                                                    value="일시납" checked>일시납</label><label
                            for="monthly1" class="sc-KfMfS lauCaU disabled"><input type="radio" name="payment1"
                                                                                   id="monthly1"
                                                                                   class="sc-gHLcSH bRNyiY" value="월납"
                                                                                   disabled="">월납</label>
                    </div>
                </div>
                <div class="money"><p>일시납 5,330원</p>
                    <p>기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="join-btn">가입하기</button>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="card"><img src="resources/img/insurance-logo.png"/>
    <div class="card-content">
        <div class="desc">의료비 80%까지 보장하는</div>
        <div class="name">펫퍼민트
            고급형 플랜
        </div>
        <div class="content-detail">
            <div class="left">
                <div class="title">
                    <div>수술비</div>
                    <div>의료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title ">
                    <div>통원의료비 (수술 포함)</div>
                    <div>1일 15만원, 연 500만원</div>
                    <div>5,000,000원</div>
                </div>
                <div class="title ">
                    <div>입원의료비 (수술 포함)</div>
                    <div>1일 15만원, 연 500만원</div>
                    <div>5,000,000원</div>
                </div>
                <div class="title">
                    <div>피부 확장보장</div>
                    <div>의료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>구강 확장보장</div>
                    <div>의료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>슬관절 확장보장</div>
                    <div>의료비 보장에 포함</div>
                    <div>보장</div>
                </div>
                <div class="title">
                    <div>배상책임</div>
                    <div>1,000만원 (1년 한도)</div>
                    <div>10,000,000원</div>
                </div>
            </div>
            <div class="right"><p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI"><label for="1year2" class="sc-KfMfS lauCaU disabled"><input
                            type="radio"
                            name="period2"
                            id="1year2"
                            disabled=""
                            class="sc-gHLcSH bRNyiY"
                            value="1년형"
                    >1년형</label><label
                            for="3year2" class="sc-KfMfS lauCaU"><input type="radio" name="period2" id="3year2"
                                                                        class="sc-gHLcSH bRNyiY"
                                                                        value="3년형" checked>3년형</label></div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump2" class="sc-KfMfS lauCaU disabled"><input
                            type="radio"
                            name="payment2"
                            id="lump2"
                            disabled=""
                            class="sc-gHLcSH bRNyiY"
                            value="일시납">일시납</label><label
                            for="monthly2" class="sc-KfMfS lauCaU"><input type="radio" name="payment2" id="monthly2"

                                                                          class="sc-gHLcSH bRNyiY" value="월납" checked>월납</label>
                    </div>
                </div>
                <div class="money"><p>월납

                    48,440원</p>
                    <p>기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="join-btn">가입하기</button>

                </div>
            </div>
        </div>
    </div>
</div>


<div class="card"><img src="resources/img/insurance-logo.png"/>
    <div class="card-content">
        <div class="desc">
        </div>
        <div class="name">LIFEPLUS 댕댕이보험
            실속형 플랜
        </div>
        <div class="content-detail">
            <div class="left">
                <div class="title">
                    <div>수술치료비</div>
                    <div>1회 150만원, 연 2회</div>
                    <div>3,000,000원</div>
                </div>
                <div class="title">
                    <div>입원치료비</div>
                    <div>1일 15만원, 연 20일</div>
                    <div>3,000,000원</div>
                </div>
                <div class="title ">
                    <div>통원치료비</div>
                    <div>1회 15만원, 연 20회</div>
                    <div>3,000,000원</div>
                </div>
                <div class="title">
                    <div>배상책임</div>
                    <div>500만원 (1년 한도)</div>
                    <div>5,000,000원</div>
                </div>
                <div class="title">
                    <div>유실견 찾기 지원금</div>
                    <div>15만원 (1회 한도)</div>
                    <div>150,000원</div>
                </div>
                <div class="title">
                    <div>애견장례비</div>
                    <div>15만원 (1회 한도)</div>
                    <div>150,000원</div>
                </div>

            </div>
            <div class="right"><p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI"><label for="1year3" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                     name="period3"
                                                                                                     id="1year3"
                                                                                                     class="sc-gHLcSH bRNyiY"
                                                                                                     value="1년형"
                                                                                                     checked>1년형</label><label
                            for="3year3" class="sc-KfMfS lauCaU disabled"><input type="radio" name="period3" id="3year3"
                                                                                 class="sc-gHLcSH bRNyiY"
                                                                                 disabled=""
                                                                                 value="3년형">3년형</label></div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump3" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                    name="payment3"
                                                                                                    id="lump3"
                                                                                                    class="sc-gHLcSH bRNyiY"
                                                                                                    value="일시납" checked>일시납</label><label
                            for="monthly3" class="sc-KfMfS lauCaU disabled"><input type="radio" name="payment3"
                                                                                   id="monthly3"
                                                                                   disabled="" class="sc-gHLcSH bRNyiY"
                                                                                   value="월납">월납</label>
                    </div>
                </div>
                <div class="money"><p>일시납 293,700원</p>
                    <p>기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="join-btn">가입하기</button>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("join-btn").addEventListener("click", function () {

        // 다음 버튼 클릭 시 제품 정보를 세션에 저장
        var insuranceInfo = {
            insuranceName: document.getElementById("insuranceName").textContent,
            insuranceAmount: "403620"
        };
        sessionStorage.setItem("selectedInsurance", JSON.stringify(insuranceInfo));

        // 새 페이지로 이동
        window.location.href = "/insurance-detail";
    });
</script>
</body>