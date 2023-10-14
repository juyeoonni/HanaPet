<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>HanaPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="/resources/css/common.css">
    <!-- 부트스트랩 CSS 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 부트스트랩 JS 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .circle-container {
            display: flex;
            width: 1200px;
            height: 300px;
            margin-bottom: 30px;
        }

        .circle1, .circle2, .circle3, .circle4 {
            width: 300px;
            height: 300px;
            border-radius: 9999px;
            background-color: rgba(117, 169, 137, 0.73);
            transform: translateX(45.5px);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        .circle2 {
            background-color: rgba(191, 223, 203, 0.73);
            transform: translateX(-11.5px);
        }

        .circle3 {
            background-color: rgba(225, 230, 222, 0.73);
            transform: translateX(-68.5px);
        }

        .circle4 {
            background-color: rgba(238, 224, 234, 0.73);
            transform: translateX(-125.5px);
        }


        .join {
            display: inline-block;
            text-align: center;
            width: 150px;
            font-size: 18px;
            padding: 10px 20px;
            color: #fff;
            border: none;
            cursor: pointer;
            background: var(--primary-color);
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            outline: none;
        }

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
            margin-bottom: 50px;
        }

        .product-info {
            font-size: 19px;
            padding-bottom: 7px;
            padding-top: 7px;
            font-family: font-medium;
        }

        .product-info-bold {
            font-family: font-bold;
        }

        .accordion-button {
            color: white !important;
            background-color: var(--primary-color) !important;
        }

        p {
            font-size: 17px;
            font-family: font-medium;
        }

        #joinForm {
            text-align-last: center;
            margin-top: 120px;
        }

        .centered-div {
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            font-size: 23px;
            font-family: 'font-medium';
            font-weight: bold;
            margin-top: 60px;
        }

        .bottom-centered-div {
            display: flex;
            justify-content: center;
            align-items: flex-end;
            font-size: 17px;
            margin-bottom: 30px;
        }

    </style>
</head>
<%@ include file="include/header.jsp" %>
<div class="body">
    <%@ include file="include/product-header.jsp" %>

    <div class="circle-container">
        <span class="circle1">
        <div class="centered-div"> 펫코노미 시대<br>반려동물을 위한<br>목돈마련 저축상품</div>
        <div class="bottom-centered-div">특징</div>
    </span>
        <span class="circle2">
        <div class="centered-div"></div>
        <div class="bottom-centered-div">기간</div>
    </span>
        <span class="circle3">
        <div class="centered-div"></div>
        <div class="bottom-centered-div">가입 금액</div>
    </span>
        <span class="circle4">
        <div class="centered-div"></div>
        <div class="bottom-centered-div">최대 금리</div>
    </span>

    </div>
    <div style="font-size: 15px; text-align: end; margin-bottom: 60px">
        (2023.05.10 기준, 세전)
    </div>

    <div class="accordion" id="productAccordion"> <!-- 아코디언을 감싸는 컨테이너 -->
        <div class="accordion-item"> <!--아코디언의 각 항목을 나타내고, 하나의 아코디언 항목은 헤더와 본문으로 구성됨-->
            <h2 class="accordion-header"> <!--아코디언 항목의 헤더 역할, 펼치기/접기 버튼이 들어감-->
                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseProduct"
                        aria-expanded="true" aria-controls="collapseProduct">
                    적금 상품 상세 정보
                </button>
                <!--accordion-button: 아코디언 항목의 헤더에서 사용자가 클릭할 수 있는 버튼, 클릭하면 항목이 펼쳐지거나 접힘-->
                <!--data-bs-toggle, data-bs-target: 부트스트랩의 아코디언을 동작시키기 위한 속성으로, 클릭 시 펼치기/접기 동작을 정의-->
            </h2>
            <div id="collapseProduct" class="accordion-collapse collapse show" aria-labelledby="headingProduct"
                 data-bs-parent="#productAccordion">
                <!--accordion-collapse: 펼쳐지거나 접힐 때의 상태를 설정/ collapse: 접혀있음, show: 펼쳐진 상태-->
                <div class="accordion-body"
                     style="border: 3px solid #E1E6DE; border-radius: 0px 0px 5px 5px; padding: 100px 150px">
                    <!--아코디언 항목이 펼쳐졌을 때 내용이 들어가는 영역-->
                    <table align="center" width=100%>
                        <tr>
                            <td class="product-info-bold">상품 특징</td>
                            <td class="product-info" style="padding-left: 150px;">펫코노미 시대(반려인 1,500만명) 반려동물을 위한 목돈마련
                                저축상품
                            </td>
                        </tr>
                        <tr>
                            <td class="product-info-bold">가입 대상</td>
                            <td class="product-info" style="padding-left: 150px;">반려견을 등록한 모든 Hanna Pet 손님</td>
                        </tr>
                        <tr>
                            <td class="product-info-bold" id="producBalanceLabel">가입 금액</td>
                            <td class="product-info" id="producBalance" style="padding-left: 150px;"></td>
                        </tr>
                        <tr>
                            <td class="product-info-bold" id="productPeriodLabel">가입 기간</td>
                            <td class="product-info" id="productPeriod" style="padding-left: 150px;"></td>
                        </tr>
                        <tr>
                            <td class="product-info-bold" id="productRateLabel">기본 금리</td>
                            <td class="product-info" id="productRate" style="padding-left: 150px;"></td>
                        </tr>
                        <tr>
                            <td class="product-info-bold" id="productPrimeRateLabel">우대 금리</td>
                            <td class="product-info" id="productPrimeRate" style="padding-left: 150px;"></td>
                        </tr>
                        <tr>
                            <td class="product-info-bold">이자지급방법</td>
                            <td class="product-info" style="padding-left: 150px;">만기일시지급식 : 만기(후)해지시 이자를 지급</td>
                        </tr>
                    </table>
                    <br><br>
                    <tr>
                        <td style="padding-left: 0px;">
                            <table align="center" width=100%>
                                <thead>
                                <tr>
                                    <th style="color: #555; font-weight: bold; border-bottom: 1.5px solid">적금 참여자</th>
                                    <th style="color: #555; font-weight: bold; border-bottom: 1.5px solid">우대금리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td style="height: 40px;">2명</td>
                                    <td id="primeRate2"></td>
                                </tr>
                                <tr>
                                    <td style="height: 40px;">3명</td>
                                    <td id="primeRate3"></td>
                                </tr>
                                <tr>
                                    <td style="height: 40px;">4명 이상</td>
                                    <td id="primeRate4"></td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </div>
            </div>
        </div>
    </div>
    <label for="agree_all" style="margin-bottom: 25px; margin-top: 80px;">
        <input type="checkbox" name="agree_all" id="agree_all" style="width: 18px; height: 16px;">
        <span style="font-size: 23px; text-align: center;">모두 동의합니다.</span>
    </label>

    <div class="accordion" id="agreeAccordion1">
        <div class="accordion-item">
            <h2 class="accordion-header"><%--@declare id="agree"--%><label for="agree" style="width:100%">
                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree1" aria-expanded="true" aria-controls="collapseAgree1">
                    <input type="checkbox" name="agree" value="1" style="width: 16px; height: 15px;">
                    <span style="font-size: 18px; color: white">&nbsp적금거래기본 약관</span>
                </button>
            </label>
            </h2>
            <div id="collapseAgree1" class="accordion-collapse collapse show" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion1">
                <div class="accordion-body" style="border: 3px solid #E1E6DE; border-radius: 0px 0px 5px 5px;">
                    <div class="accordion-body">
                        <p style="text-align: right; margin-bottom: 30px; font-size: 12px;">개정준법감시인 심의필
                            제2022-약관-104호(2022.06.23)</p>
                        <p style="text-align: center; font-size: 20px; font-weight: bold; margin-bottom: 50px;">예금거래
                            기본약관</p>
                        <p style="line-height: 1.2; margin-bottom: 15px;">이 적금거래기본약관(이하 “약관”이라 한다)은 (주)하나은행(이하 “은행”이라
                            한다)과
                            거래처(또는 예금주)가 서로 믿음을 바탕으로 예금거래를 빠르고 틀림 없이 처리하는 한편, 서로의 이해관계를 합리적으로 조정하기 위하여 기본적이고 일반적인 사항을 정한
                            것이다. 은행은 이 약관을 영업점에 놓아두고, 거래처는 영업시간 중 언제든지 이 약관을 볼 수 있고 또한 그 교부를 청구할 수 있다.</p>

                        <p style="font-weight: bold; margin-bottom: 10px;">제1조 적용범위</p>
                        <p style="margin-bottom: 20px;">이 약관은 거치식적금 및 적립식예금 거래에 적용한다.</p>

                        <p style="font-weight: bold; margin-bottom: 10px;">제2조 실명거래</p>
                        <p style="margin-bottom: 8px;">① 거래처는 실명으로 거래하여야 한다.</p>
                        <p style="line-height: 1.2; margin-bottom: 15px;">② 은행은 거래처의 실명확인을 위하여 주민등록증ㆍ사업자등록증 등 실명확인증표 또는
                            그밖에
                            필요한 서류의 제시나 제출을 요구할 수 있고, 거래처는 이에 따라야 한다.</p>
                        <p style="font-weight: bold; margin-bottom: 10px;">제3조 거래장소</p>
                        <p style="line-height: 1.2; margin-bottom: 20px;">거래처는 예금계좌를 개설한 영업점(이하 “개설점”이라 한다)에서 모든 예금거래를
                            한다.
                            다만, 은행이 정하는 바에 따라 다른 영업점이나 다른 금융기관, 또는 현금자동지급기ㆍ현금자동입출금기ㆍ컴퓨터ㆍ전화기 등(이하 “전산통신기기”)을 통하여 거래할 수
                            있다.</p>

                        <p style="font-weight: bold; margin-bottom: 10px;">제4조 거래방법</p>
                        <p style="line-height: 1.2; margin-bottom: 20px;">거래처는 은행에서 내준 통장(증서· 전자통장을 포함한다) 또는 수표· 어음용지로
                            거래하여야
                            한다. 그러나 입금할 때, 자동이체약정ㆍ전산통신 기기이용약정에 따라 거래하는 경우 및 기등록된 생체정보(이하”바이오 정보”), 실명확인증표 등을 통해 본인확인된
                            경우에는
                            통장없이(이하”무통장”)도 거래할 수 있다.</p>

                        <p style="font-weight: bold; margin-bottom: 10px;">제5조 인감, 비밀번호 등의 신고</p>
                        <p style="line-height: 1.2; margin-bottom: 8px;">① 거래처는 예금계좌를 개설할 때 인감 또는 서명, 비밀번호, 성명, 상호,
                            대표자명,
                            대리인명, 주소 등 거래에 필요한 사항을 신고하여야 한다. 다만, 비밀번호는 비밀번호 입력기(이하 “PIN-Pad기”라 한다)에 의하여 거래처가 직접 등록할 수
                            있으며,
                            거래처가 은행에 내점할 수 없는 경우 거래처는 개설된 예금의 첫거래 전에 은행이 정한 방법에 따라 전산통신기기를 이용하여 비밀번호를 등록하여야 한다.</p>
                        <p style="line-height: 1.2; margin-bottom: 8px;">② 제 1항에 불구하고 거치식·적립식 예금은 비밀번호를 신고하지 않을 수
                            있다.</p>
                        <p style="line-height: 1.2; margin-bottom: 8px;">③ 거래처는 인감과 서명을 함께 신고하거나, 인감 또는 서명을 추가 신고할 수
                            있다.</p>
                        <p style="line-height: 1.2; margin-bottom: 20px;">④ 통장을 발행하지 않은 경우, 은행은 거래처로부터 인감 또는 서명의 신고 절차를
                            생략할
                            수 있다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion2">
        <div class="accordion-item">
            <h2 class="accordion-header"><label for="agree" style="width:100%">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree2" aria-expanded="true" aria-controls="collapseAgree2">
                    <input type="checkbox" name="agree" value="1" style="width: 16px; height: 15px;">
                    <span style="font-size: 18px; color: white">&nbsp적립식 적금 약관</span>
                </button>
            </label>
            </h2>
            <div id="collapseAgree2" class="accordion-collapse collapse" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion">
                <div class="accordion-body" style="border: 3px solid #E1E6DE; border-radius: 0px 0px 5px 5px;">
                    <div class="accordion-body">
                        <p style="text-align: right; margin-bottom: 30px; font-size: 12px;">개정준법감시인 심사필번호
                            제2021-약관-121호(2021.03.22)</p>
                        <p style="text-align: center; font-size: 20px; font-weight: bold; margin-bottom: 50px;">
                            적립식예금약관</p>
                        <p style="font-weight: bold; margin-bottom: 10px;">제1조 적용범위</p>
                        <p style="line-height: 1.2; margin-bottom: 8px;">① 적립식예금(이하 '이 예금'이라 한다)이라 함은 기간을 정하고 그 기간중에 미리
                            정한
                            금액이나 불특정 금액을 정기 또는 부정기적으로 입금하는 예금을 말한다.</p>
                        <p style="line-height: 1.2; margin-bottom: 20px;">② 이 약관에서 정하지 아니한 사항은 예금거래기본약관의 규정을 적용한다.</p>
                        <p style="font-weight: bold; margin-bottom: 10px;">제2조 지급시기</p>
                        <p style="line-height: 1.2; margin-bottom: 20px;">이 예금은 약정한 만기일 이후 거래처가 청구할 때 지급한다. 다만 거래처가 부득이한
                            사정으로 청구할 때에는 만기전이라도 지급할 수 있다.</p>
                        <p style="font-weight: bold; margin-bottom: 10px;">제3조 저축금의 입금</p>
                        <p style="line-height: 1.2; margin-bottom: 20px;">거래처는 계약기간 동안 매월 약정한 날짜에 월저축금을 입금하여야 한다.</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion3">
        <div class="accordion-item">
            <h2 class="accordion-header"><label for="agree" style="width:100%">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree3" aria-expanded="true" aria-controls="collapseAgree3">
                    <input type="checkbox" name="agree" value="1" style="width: 16px; height: 15px;">
                    <span style="font-size: 18px; color: white">&nbsp개인(신용)정보 수집 이용 동의서<strong
                            style="font-weight: bold;"> (필수)</strong> </span>
                </button>
            </label>
            </h2>
            <div id="collapseAgree3" class="accordion-collapse collapse" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion3">
                <div class="accordion-body" style="border: 3px solid #E1E6DE; border-radius: 0px 0px 5px 5px;">
                    <div class="accordion-body">
                        <p style="text-align: right;">개정준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion4">
        <div class="accordion-item">
            <h2 class="accordion-header"><label for="agree" style="width:100%">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree4" aria-expanded="true" aria-controls="collapseAgree4">
                    <input type="checkbox" name="agree" value="1" style="width: 16px; height: 15px;">
                    <span style="font-size: 18px; color: white">&nbsp비과세종합저축특약</span>
                </button>
            </label>
            </h2>
            <div id="collapseAgree4" class="accordion-collapse collapse" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion3">
                <div class="accordion-body" style="border: 3px solid #E1E6DE; border-radius: 0px 0px 5px 5px;">
                    <div class="accordion-body">
                        <p style="text-align: right;">개정준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form id="joinForm" action="/join-product">
        <input type="hidden" id="category" name="category">
        <input type="hidden" id="min_period" name="min_period">
        <input type="hidden" id="max_period" name="max_period">
        <input type="hidden" id="min_balance" name="min_balance">
        <input type="hidden" id="max_balance" name="max_balance">
        <input type="hidden" id="rate" name="rate">
        <input type="hidden" id="prime_rate" name="prime_rate">
        <input class="join" value="가입하기" readonly>
    </form>
</div>

<script>
    $(document).ready(function () {
        // 세션에서 제품 정보 가져오기
        const productInfo = JSON.parse(sessionStorage.getItem("selectedProduct"));

        // 제품 정보를 화면에 표시
        if (productInfo) {
            $("#productImg").attr("src", "/resources/img/" + productInfo.image);
            $("#productCategory").text(productInfo.category + " 펫 적금");
            $("#productDescription").text(productInfo.description);
            $("#productRate").text("연 " + productInfo.rate + "%");
            $("#productPrimeRate").text("최대 연 " + parseFloat((productInfo.prime_rate * 3).toFixed(2)) + "%");
            $("#producBalance").text("월 " + productInfo.min_balance.toLocaleString() + "원 이상 ~ " + productInfo.max_balance.toLocaleString() + "원 이하");
            $("#productPeriod").text(productInfo.min_period + "개월 이상 " + productInfo.max_period + "개월 이하");
        }

        $("#primeRate2").text(parseFloat((productInfo.prime_rate).toFixed(2)) + "%");
        $("#primeRate3").text(parseFloat((productInfo.prime_rate * 2).toFixed(2)) + "%");
        $("#primeRate4").text(parseFloat((productInfo.prime_rate * 3).toFixed(2)) + "%");

        $(".circle2 .centered-div").html(productInfo.min_period + "개월 이상<br>" + productInfo.max_period + "개월 이하");

        // 가입 금액 정보 설정
        $(".circle3 .centered-div").html(productInfo.min_balance.toLocaleString() + "원 이상<br>" + productInfo.max_balance.toLocaleString() + "원 이하");

        // 최대 금리 정보 설정
        $(".circle4 .centered-div").text("연 " + (productInfo.rate + productInfo.prime_rate * 3) + "%");

        $("#joinForm").click(function () {
            // 선택된 약관 동의 여부 확인
            const isAgreed = document.getElementById("agree_all").checked;
            if (!isAgreed) {
                alert("약관에 동의해주세요.");
            } else {
                // 서버로 전송할 데이터 구성
                const productData = {
                    category: productInfo.category,
                    min_period: productInfo.min_period,
                    max_period: productInfo.max_period,
                    min_balance: productInfo.min_balance,
                    max_balance: productInfo.max_balance,
                    rate: productInfo.rate,
                    prime_rate: productInfo.prime_rate
                };

                // hidden 필드에 데이터 설정
                $("#category").val(productData.category);
                $("#min_period").val(productData.min_period);
                $("#max_period").val(productData.max_period);
                $("#min_balance").val(productData.min_balance);
                $("#max_balance").val(productData.max_balance);
                $("#rate").val(productInfo.rate);
                $("#prime_rate").val(productInfo.prime_rate);

                // form 제출
                $("#joinForm").submit();
            }
        });
    });

    const agreeChkAll = document.querySelector('input[name=agree_all]');

    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for (let i = 0; i < agreeChk.length; i++) {
            agreeChk[i].checked = e.target.checked;
        }
    });
</script>

<%@ include file="include/footer.jsp" %>