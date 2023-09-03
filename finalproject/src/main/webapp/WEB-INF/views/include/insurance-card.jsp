<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    img {
        width: 160px;
    }

    .card {
        padding: 30px;
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
        margin-right: 100px;
    }

    .title {
        font-size: 15px;
        font-family: font-medium;
    }

    .des {
        font-size: 15px;
        color: #75A989;
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
        color: #75A989;
        margin-right: 20px; /* 원하는 마진 크기로 조정합니다. */
        margin-bottom: 9px;
    }

    .disabled{
        color: #E1E6DE;
    }

    .money p{
        margin-top: 20px;
        font-weight: bold;
        font-family: font-medium;
        font-size: 31px;
        color: #008485;
    }

    .money .des{
        margin-top: -20px;
        margin-bottom: 40px;
        font-size: 16px;
        color: #75A989;
    }

    .buttons {
        display: flex;
    }

    .detail-btn {
        margin-right: 20px;
    }

    .join-btn, .detail-btn {
        background-color: #75A989;
        border: 0.1rem solid #75A989;
        color: rgb(255, 255, 255);
        cursor: pointer;
        text-align: center;
        width: 120px;
        border-radius: 0.5rem;
        padding: 10px;
    }

</style>
<div class="card"><img src="resources/img/insurance-logo.png"/>
    <div class="card-content">
        <div class="desc">입통원비가 따로 보장되는</div>
        <div class="name">프로미 반려동물보험
            One형 플랜
        </div>
        <div class="content-detail">
            <div class="left">
                <div class="title"><p>수술비</p>
                    <p class="des">1회 150만원, 연 2회</p>
                    <p class="bold">3,000,000원</p></div>
                <div class="title plus"><p>치료비(입원)</p>
                    <p class="des">1일 15만원, 연 20일</p>
                    <p class="bold">3,000,000원</p></div>
                <div class="title plus"><p>치료비(통원)</p>
                    <p class="des">1회 15만원, 연 20회</p>
                    <p class="bold">3,000,000원</p></div>
                <div class="title top"><p>피부 확장보장</p>
                    <p class="des">치료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title plus top"><p>구강확장보장</p>
                    <p class="des">치료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title plus top"><p>슬관절 확장보장</p>
                    <p class="des">수술비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title top"><p>배상책임</p>
                    <p class="des">500만원 (1년 한도)</p>
                    <p class="bold">5,000,000원</p></div>
                <div class="title plus top"><p>사망 위로금</p>
                    <p class="des">15만원 (1회 한도)</p>
                    <p class="bold">150,000원</p></div>
            </div>
            <div class="right"><p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI"><label for="1year" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                    name="period"
                                                                                                    id="1year"
                                                                                                    class="sc-gHLcSH bRNyiY"
                                                                                                    value="1년형"
                                                                                                    checked>1년형</label><label
                            for="3year" class="sc-KfMfS lauCaU disabled"><input type="radio" name="period" id="3year"
                                                                       disabled="" class="sc-gHLcSH bRNyiY"
                                                                       value="3년형">3년형</label></div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                   name="payment"
                                                                                                   id="lump"
                                                                                                   class="sc-gHLcSH bRNyiY"
                                                                                                   value="일시납" checked>일시납</label><label
                            for="monthly" class="sc-KfMfS lauCaU disabled"><input type="radio" name="payment" id="monthly"
                                                                         disabled=""
                                                                         class="sc-gHLcSH bRNyiY" value="월납">월납</label>
                    </div>
                </div>
                <div class="money"><p>일시납

                    403,620원</p>
                    <p class="des">기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="detail-btn">자세히 보기</button>
                    <button class="join-btn">가입하기</button>
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
                            for="3year0" class="sc-KfMfS lauCaU disabled"><input type="radio" name="period0" id="3year0"
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

<div class="card"><img src="resources/img/insurance-logo.png"/>
    <div class="card-content">
        <div class="desc">5,000원으로 대비하는</div>
        <div class="name">하이펫애견보험
            배상책임형 플랜
        </div>
        <div class="content-detail">
            <div class="left">
                <div class="title top"><p>배상책임</p>
                    <p class="des">1사고당 500만원, 1년 한도</p>
                    <p class="bold">5,000,000원</p></div>
                <div class="title plus top"><p>애견장례비</p>
                    <p class="des">15만원 (1회 한도)</p>
                    <p class="bold">150,000원</p></div>
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
                            for="monthly1" class="sc-KfMfS lauCaU disabled"><input type="radio" name="payment1" id="monthly1"
                                                                          class="sc-gHLcSH bRNyiY" value="월납"
                                                                          disabled="">월납</label>
                    </div>
                </div>
                <div class="money"><p>일시납 5,330원</p>
                    <p class="des">기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="detail-btn">자세히 보기</button>
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
                <div class="title"><p>수술비</p>
                    <p class="des">의료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title plus"><p>통원의료비 (수술 포함)</p>
                    <p class="des">1일 15만원, 연 500만원</p>
                    <p class="bold">5,000,000원</p></div>
                <div class="title plus"><p>입원의료비 (수술 포함)</p>
                    <p class="des">1일 15만원, 연 500만원</p>
                    <p class="bold">5,000,000원</p></div>
                <div class="title top"><p>피부 확장보장</p>
                    <p class="des">의료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title plus top"><p>구강 확장보장</p>
                    <p class="des">의료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title plus top"><p>슬관절 확장보장</p>
                    <p class="des">의료비 보장에 포함</p>
                    <p class="bold">보장</p></div>
                <div class="title top"><p>배상책임</p>
                    <p class="des">1,000만원 (1년 한도)</p>
                    <p class="bold">10,000,000원</p></div>
            </div>
            <div class="right"><p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI"><label for="1year2" class="sc-KfMfS lauCaU disabled"><input type="radio"
                                                                                                     name="period"
                                                                                                     id="1year2"
                                                                                                     disabled=""
                                                                                                     class="sc-gHLcSH bRNyiY"
                                                                                                     value="1년형"
                    >1년형</label><label
                            for="3year2" class="sc-KfMfS lauCaU"><input type="radio" name="period" id="3year2"
                                                                        class="sc-gHLcSH bRNyiY"
                                                                        value="3년형" checked>3년형</label></div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump2" class="sc-KfMfS lauCaU disabled"><input type="radio"
                                                                                                    name="payment"
                                                                                                    id="lump2"
                                                                                                    disabled=""
                                                                                                    class="sc-gHLcSH bRNyi"
                                                                                                    value="일시납">일시납</label><label
                            for="monthly2" class="sc-KfMfS lauCaU"><input type="radio" name="payment" id="monthly2"

                                                                          class="sc-gHLcSH bRNyiY" value="월납" checked>월납</label>
                    </div>
                </div>
                <div class="money"><p>월납

                    48,440원</p>
                    <p class="des">기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="detail-btn">자세히 보기</button>
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
                <div class="title"><p>수술치료비</p>
                    <p class="des">1회 150만원, 연 2회</p>
                    <p class="bold">3,000,000원</p></div>
                <div class="title"><p>입원치료비</p>
                    <p class="des">1일 15만원, 연 20일</p>
                    <p class="bold">3,000,000원</p></div>
                <div class="title plus"><p>통원치료비</p>
                    <p class="des">1회 15만원, 연 20회</p>
                    <p class="bold">3,000,000원</p></div>
                <div class="title top"><p>배상책임</p>
                    <p class="des">500만원 (1년 한도)</p>
                    <p class="bold">5,000,000원</p></div>
                <div class="title top"><p>유실견 찾기 지원금</p>
                    <p class="des">15만원 (1회 한도)</p>
                    <p class="bold">150,000원</p></div>
                <div class="title plus top"><p>애견장례비</p>
                    <p class="des">15만원 (1회 한도)</p>
                    <p class="bold">150,000원</p></div>

            </div>
            <div class="right"><p class="bold">보험료 납입 옵션</p>
                <div class="check-option">
                    <div class="sc-cHPgQl eHGAsI"><label for="1year3" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                     name="period"
                                                                                                     id="1year3"
                                                                                                     class="sc-gHLcSH bRNyiY"
                                                                                                     value="1년형" checked >1년형</label><label
                            for="3year3" class="sc-KfMfS lauCaU disabled"><input type="radio" name="period" id="3year3"
                                                                        class="sc-gHLcSH bRNyiY"
                                                                        disabled=""
                                                                        value="3년형">3년형</label></div>
                    <div class="sc-cHPgQl eHGAsI"><label for="lump3" class="sc-KfMfS lauCaU"><input type="radio"
                                                                                                    name="payment"
                                                                                                    id="lump3"
                                                                                                    class="sc-gHLcSH bRNyiY"
                                                                                                    value="일시납" checked>일시납</label><label
                            for="monthly3" class="sc-KfMfS lauCaU disabled"><input type="radio" name="payment" id="monthly3"
                                                                          disabled="" class="sc-gHLcSH bRNyiY"
                                                                          value="월납">월납</label>
                    </div>
                </div>
                <div class="money"><p>일시납

                    293,700원</p>
                    <p class="des">기존 보험료 대비 10% 할인</p></div>
                <div class="buttons">
                    <button class="detail-btn">자세히 보기</button>
                    <button class="join-btn">가입하기</button>
                </div>
            </div>
        </div>
    </div>
</div>