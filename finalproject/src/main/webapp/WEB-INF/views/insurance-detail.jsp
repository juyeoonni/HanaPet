<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="resources/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style>
        .jKVTZV {
            margin-bottom: 3rem;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
        }

        .kofJdj {
            width: 100%;
            display: flex;
            -webkit-box-pack: justify;
            justify-content: space-between;
            -webkit-box-align: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .jKVTZV img {
            cursor: pointer;
        }

        .jKVTZV span {
            margin-left: 10px;
            font-size: 16px;
            font-family: font-medium;
            cursor: pointer;
        }

        .eCtMMK {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
        }

        .kOrroZ p {
            font-size: 18px;
        }

        .gwCdmv {
            width: 12rem;
            padding-bottom: 32px;
            margin-right: 48px;
        }

        .gwCdmv div:nth-child(1) {
            font-size: 15px;
            margin-bottom: 5px;
            padding-bottom: -5px;
        }

        .gwCdmv div:nth-child(2) {
            font-size: 16px;
            margin-bottom: 5px;
            font-family: font-medium;
            color: #B6D2C1;
        }

        .gwCdmv div:nth-child(3) {
            font-size: 20px;
            font-family: font-medium;
            font-weight: bold;
        }

        .IXARV {
            display: flex;
            justify-content: normal;
            padding: 10px;
            margin-bottom: -0.5rem;
            justify-content: space-between;
        }

        .next {
            display: flex;
            margin: 60px 100px 0px 100px;
            justify-content: center;
        }

        .ejNQei {
            width: 10rem;
        }

        .eLifJ {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
        }

        .binzhv {
            position: relative;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
        }

        .binzhv span {
            font-size: 16px;
            font-family: font-medium;
            margin-bottom: 3px;
        }

        .bqRDfZ {
            width: 100%;
            display: flex;
            -webkit-box-pack: justify;
            justify-content: space-between;
            -webkit-box-align: center;
            align-items: center;
        }

        .dIsvBm {
            display: flex;
            margin-bottom: 1rem;
        }

        .ksyVmd {
            display: flex;
        }

        .hpKSpo {
            width: 25px;
            height: 25px;
            margin-right: 0.6rem;
            border-radius: 0.2rem;
            border: 0.1rem solid rgb(187, 187, 187);
            background-color: white;
            appearance: none;
            cursor: pointer;
        }

        .hpKSpo:checked {
            position: relative;
            display: inline-block;
            width: 25px;
            height: 25px;
            border-radius: 0.2rem;
            color: black;
        }

        .hpKSpo:checked::before {
            content: "✔";
            display: block;
            position: absolute;
            left: -0.1rem;
            top: -0.1rem;
            width: 25px;
            height: 25px;
            text-align: center;
            border-radius: 0.2rem;
            background: var(--primary-color);
            color: white;
            font-size: 1rem;
        }

        .cRXURy {
            margin-top: 60px;
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

        .HdAuc {
            font-size: 25px;
            font-width: bold;
            padding: 50px 100px 0px 100px;
        }

        .bqRDfZ {
            width: 100%;
            display: flex;
            -webkit-box-pack: justify;
            justify-content: space-between;
            -webkit-box-align: center;
            align-items: center;
        }

        .ksyVmd {
            display: flex;
        }

        .iiZsJI {
            width: 8rem;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            font-size: 20px;
            font-family: font-medium;
            font-weight: bold;
            cursor: pointer;
        }

        .issDsc {
            width: 8rem;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            font-size: 20px;
            color: #B6D2C1;
            font-weight: normal;
            cursor: pointer;
        }

        .kEbIyS {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            -webkit-box-align: center;
            align-items: center;
            justify-content: space-between;
        }

        .iEeHUW {
            margin-bottom: 10px;
            display: flex;
            -webkit-box-pack: justify;
            justify-content: space-between;
            width: 48%;
            padding: 15px;
            border: 1px solid #BFDFCB;
            border-radius: 10px;
        }

        .iEeHUW div:nth-child(1) {
            font-weight: bold;
        }

        .iEeHUW div {
            width: 13.5rem;
            font-size: 17px;
            line-height: 1.4;
        }

        .sc-gDeeJ {
            padding: 0px 100px 0px 100px;
        }


        .accordion {
            padding: 10px 100px 10px 100px;
        }

        .accordion-body {
            padding: 50px;
        }

        .accordion-button {
            background-color: var(--primary-color) !important;
        }

        .accordion-button span {
            color: white !important;
        }

        .kEjGyx {
            margin-top: 40px;
        }

    </style>
</head>
<body>
<jsp:include page="include/header.jsp"/>
<div class="body">
    <div class="sc-fFtkDt jKVTZV">
        <img src="resources/img/left-arrow.svg" width="17px" onclick="goBack()"/>
        <span onclick="goBack()">보험목록으로 돌아가기</span></div>
    <div class="sc-gDeeJ cmNFit">
        <div class="sc-cjbZfG kofJdj">
            <div class="sc-igHpSv kOrroZ"><p>입통원비가 따로 보장되는 </p>
                <p style="font-size: 30px; font-family: font-medium; font-weight: bold">프로미 반려동물보험 One형 플랜 </p></div>
            <img src="resources/img/insurance-logo.png" width="160px" height="41.87px"></div>
        <hr>
        <br>
        <div class="sc-hxWoir eCtMMK">
            <div class="sc-gfbRpc gwCdmv">
                <div>수술비</div>
                <div>1회 150만원, 연 2회</div>
                <div>3,000,000원</div>
            </div>
            <div class="sc-gfbRpc gwCdmv">
                <div>치료비 (입원)</div>
                <div>1일 15만원, 연 20일</div>
                <div>3,000,000원</div>
            </div>
            <div class="sc-gfbRpc gwCdmv">
                <div>치료비 (통원)</div>
                <div>1회 15만원, 연 20회</div>
                <div>3,000,000원</div>
            </div>
            <div class="sc-gfbRpc gwCdmv">
                <div>피부 확장보장</div>
                <div>치료비 보장에 포함</div>
                <div>보장</div>
            </div>
            <div class="sc-gfbRpc gwCdmv">
                <div>구강 확장보장</div>
                <div>치료비 보장에 포함</div>
                <div>보장</div>
            </div>
            <div class="sc-gfbRpc gwCdmv">
                <div>슬관절 확장보장</div>
                <div>수술비 보장에 포함</div>
                <div>보장</div>
            </div>
            <div class="sc-gfbRpc gwCdmv">
                <div>배상책임</div>
                <div>500만원 (1년 한도)</div>
                <div>5,000,000원</div>
            </div>
            <div class="sc-gfbRpc gwCdmv">
                <div>사망 위로금</div>
                <div>15만원 (1회 한도)</div>
                <div>150,000원</div>
            </div>
        </div>
        <hr>
        <div class="sc-hbyLVd IXARV">
            <div class="sc-oclUV ejNQei">
                <div class="sc-hLaujc eLifJ">
                    <div class="sc-jDDxOa binzhv"><span>가입가능나이</span>
                    </div>
                </div>
                <p class="sc-knuRna gHBZMy">만 9세까지</p></div>
            <div class="sc-oclUV ejNQei">
                <div class="sc-hLaujc eLifJ">
                    <div class="sc-jDDxOa binzhv"><span>갱신가능나이</span>
                    </div>
                </div>
                <p class="sc-knuRna gHBZMy">만 17세까지</p></div>
            <div class="sc-oclUV ejNQei">
                <div class="sc-hLaujc eLifJ">
                    <div class="sc-jDDxOa binzhv"><span>자기부담금</span>
                    </div>
                </div>
                <p class="sc-knuRna gHBZMy">3만원</p></div>
        </div>
        <hr>
        <br>
        <div class="sc-kTGBUR bqRDfZ">
            <div>
                <div class="sc-hbjaKc dIsvBm">
                    <div class="sc-jhfVAM clruKV">
                        <div class="sc-enyVUO ksyVmd"><label for="1year" class="sc-bwANAz iiZsJI"><input type="radio"
                                                                                                         id="1year"
                                                                                                         name="period"
                                                                                                         class="sc-ekGZSs hpKSpo"
                                                                                                         value="1년형"
                                                                                                         checked>1년형</label><label
                                for="3year" class="sc-bwANAz issDsc"><input type="radio" id="3year" name="period"
                                                                            class="sc-ekGZSs hpKSpo" value="3년형"
                                                                            disabled="">3년형</label></div>
                    </div>
                </div>
                <div class="sc-hbjaKc dIsvBm">
                    <div class="sc-jhfVAM clruKV">
                        <div class="sc-enyVUO ksyVmd"><label for="lump" class="sc-bwANAz iiZsJI"
                                                             style="font-weight: bold;"><input
                                type="radio" id="lump" name="payment" class="sc-ekGZSs hpKSpo"
                                value="일시납" checked>일시납</label><label
                                for="monthly" class="sc-bwANAz issDsc"><input
                                type="radio" id="monthly" name="payment" class="sc-ekGZSs hpKSpo" value="월납"
                                disabled="">월납</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <p class="HdAuc">담보항목별 상세설명</p>
    <div class="accordion" id="agreeAccordion1">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree1" aria-controls="collapseAgree1">
                    <span style="font-size: 18px;">수술비</span>
                </button>
            </h2>
            <div id="collapseAgree1" class="accordion-collapse collapse" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion1">
                <div class="accordion-body">
                    <div class="sc-ewDcJz kEbIyS">
                        <div class="sc-ehMyHa iEeHUW">
                            <div>대기기간</div>
                            <div>30일</div>
                        </div>
                        <div class="sc-ehMyHa iEeHUW">
                            <div>자기부담금</div>
                            <div>3만원</div>
                        </div>
                        <div class="sc-ehMyHa iEeHUW">
                            <div>보장범위 / 한도</div>
                            <div>1회 150만원, 연 2회</div>
                        </div>
                        <div class="sc-ehMyHa iEeHUW">
                            <div>보상비율</div>
                            <div>70%</div>
                        </div>
                    </div>
                    <div class="sc-djvmMF kEjGyx" style="opacity: 1;"><span
                            style="font-size:17px;">[수술비]<br> - 보장금액 : 1회 150만원, 연 2회<br> - 대기기간 : 30일<br> - 자기부담금 : 3만원<br> - 보상비율 : 70%<br> <br> <br> 제1조(보상하는 손해)<br> <br> ① 회사는 보험기간 중 보험증권에 기재된 반려동물에게 상해 또는&nbsp;질병(이하 "사고"라 합니다)이 발생하여 그 치료를 직접적인 목적으로 국내에서 수의사에게 치료를 받은 때에는 피보험자가 부담한 반려동물의 치료비를 이 약관에 따라 피보험자에게 치료비 보험금으로 보상하여 드립니다.&nbsp;단, 갱신계약의 경우에는 최초 보험가입시점 이후의 사고에 의한 경우에는 보험금을 지급합니다.<br> <br> ② 반려동물이 제1항의 사고로 치료를 받던 중에 보험기간이 만료된 경우에도 만료일부터 180일 이내의 치료비는 보상하여 드립니다. 다만 사고일 또는 발병일부터 365일 이내의 치료인 경우에 한합니다.</span>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="accordion" id="agreeAccordion2">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree2" aria-expanded="true" aria-controls="collapseAgree2">
                    <span style="font-size: 17px;">치료비 (입원)</span>
                </button>
            </h2>
            <div id="collapseAgree2" class="accordion-collapse collapse" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion">
                <div class="accordion-body">
                    <div class="sc-iXxrte fCQhDx">
                        <div class="sc-hKpBwk bblNaH" style="opacity: 1;">
                            <div class="sc-ewDcJz kEbIyS">
                                <div class="sc-ehMyHa iEeHUW">
                                    <div>대기기간</div>
                                    <div>30일</div>
                                </div>
                                <div class="sc-ehMyHa iEeHUW">
                                    <div>자기부담금</div>
                                    <div>3만원</div>
                                </div>
                                <div class="sc-ehMyHa iEeHUW">
                                    <div>보장범위 / 한도</div>
                                    <div>1일 15만원, 연 20일</div>
                                </div>
                                <div class="sc-ehMyHa iEeHUW">
                                    <div>보상비율</div>
                                    <div>70%</div>
                                </div>
                            </div>
                        </div>
                        <div class="sc-djvmMF kEjGyx" style="opacity: 1;"><span
                                style="font-size:17px">[치료비(입원)]<br> - 보장금액 : 1일 15만원, 연 20일<br> - 대기기간 : 30일<br> - 자기부담금 : 3만원<br> - 보상비율 : 70%<br> <br> <br> 제1조(보상하는 손해)<br> ① 회사는 보험기간 중 보험증권에 기재된 반려동물에게 상해 또는&nbsp;질병(이하 "사고"라 합니다)이 발생하여 그 치료를 직접적인 목적으로 국내에서 수의사에게 치료를 받은 때에는 피보험자가 부담한 반려동물의 치료비를 이 약관에 따라 피보험자에게 치료비 보험금으로 보상하여 드립니다.&nbsp;단, 갱신계약의 경우에는 최초 보험가입시점 이후의 사고에 의한 경우에는 보험금을 지급합니다.<br> <br> ② 반려동물이 제1항의 사고로 치료를 받던 중에 보험기간이 만료된 경우에도 만료일부터 180일 이내의 치료비는 보상하여 드립니다. 다만 사고일 또는 발병일부터 365일 이내의 치료인 경우에 한합니다.</span>
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion3">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree3" aria-expanded="true" aria-controls="collapseAgree2">
                    <span>치료비 (통원)</span>
                </button>
            </h2>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion4">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree4" aria-expanded="true" aria-controls="collapseAgree2">
                    <span>피부 확장보장</span>
                </button>
            </h2>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion5">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree5" aria-expanded="true" aria-controls="collapseAgree2">
                    <span>구강 확장보장</span>
                </button>
            </h2>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion6">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree6" aria-expanded="true" aria-controls="collapseAgree2">
                    <span>슬관절 확장보장</span>
                </button>
            </h2>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion7">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree7" aria-expanded="true" aria-controls="collapseAgree2">
                    <span>배상책임</span>
                </button>
            </h2>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion8">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree8" aria-expanded="true" aria-controls="collapseAgree2">
                    <span>사망 위로금</span>
                </button>
            </h2>
        </div>
    </div>

    <div class="next">
        <button class="sc-hWlEnr cRXURy" onclick="window.location.href='/join-insurance'">다음으로</button>

    </div>
</div>
<script>
    function goBack() {
        window.location.href = "/insurance-product";
    }
</script>


</body>