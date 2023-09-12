<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>HanaPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <!-- 부트스트랩 CSS 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 부트스트랩 JS 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        #productJoinPeriod, #productEndDate {
            font-weight: bold;
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
            background: #75A989;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
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
            font-size: 17px;
            margin-bottom: 7px;
            margin-top: 7px;
            font-family: font-medium;
        }

        .accordion-button {
            color: white !important;
            background-color: #75A989 !important;
        }

        p {
            font-size: 17px;
            font-family: font-medium;
        }

        #joinForm {
            text-align-last: center;
            margin-top: 50px;
        }

        .centered-div {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            font-size: 23px;
            font-family: 'font-medium';
            font-weight: bold;
            margin-top: 60px;
        }


    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <%@ include file="include/product-header.jsp" %>

    <div class="accordion" id="productAccordion"> <!-- 아코디언을 감싸는 컨테이너 -->
        <div class="accordion-item"> <!--아코디언의 각 항목을 나타내고, 하나의 아코디언 항목은 헤더와 본문으로 구성됨-->
            <h2 class="accordion-header"> <!--아코디언 항목의 헤더 역할, 펼치기/접기 버튼이 들어감-->
                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseProduct"
                        aria-expanded="true" aria-controls="collapseProduct">
                    적금 상품 상세 정보
                </button>
            </h2>
            <div id="collapseProduct" class="accordion-collapse collapse show" aria-labelledby="headingProduct"
                 data-bs-parent="#productAccordion">
                <div class="accordion-body" style="border: 3px solid #BFDFCB; border-radius: 0px 0px 5px 5px;">
                    <div class="product-info">상품 특징: 만 3세 이하 펫 우대 적금</div>
                    <div class="product-info">가입 대상: 반려견을 등록한 모든 Hanna Pet 손님</div>
                    <div class="product-info">이자 지급 방법: 만기일시지급식 : 만기(후)해지시 이자를 지급</div>
                    <div class="product-info">적립 방법: 자유적립식</div>
                    <div id="productRate" class="product-info"></div>
                    <div id="productMinBalance" class="product-info"></div>
                    <div id="productJoinPeriod" class="product-info"></div>
                    <div id="productEndDate" class="product-info"></div>
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
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree" aria-expanded="true" aria-controls="collapseAgree">
                    <input type="checkbox" name="agree" value="1" style="width: 16px; height: 15px;">
                    <span style="font-size: 18px; color: white">&nbsp공유 적금 기본 약관<strong
                            style="font-weight: bold;"> (필수)</strong> </span>
                </button>
            </label>
            </h2>
            <div id="collapseAgree" class="accordion-collapse collapse" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion1">
                <div class="accordion-body" style="border: 3px solid #BFDFCB; border-radius: 0px 0px 5px 5px;">
                    <div class="accordion-body">
                        <p style="text-align: right; margin-bottom: 30px; font-size: 12px;">개정준법감시인 심의필
                            제2022-약관-104호(2022.06.23)</p>
                        <p style="text-align: center; font-size: 20px; font-weight: bold; margin-bottom: 50px;">공유 적금
                            기본약관</p>
                        <p style="font-weight: bold; margin-bottom: 10px;">제1조 적용범위</p>
                        <p style="margin-bottom: 20px;">이 약관은 공유 적금 거래에 적용한다.</p>
                        <p style="font-weight: bold; margin-bottom: 10px;">제2조 만기 지급</p>
                        <p style="margin-bottom: 20px; font-weight: bold;"> ① 적립식 적금 계약의 만기 시점에는 모든 예치금은 계약을 개설한 예금주에게
                            반환됩니다. 이로서, 예금주는 적금
                            계약에 따른 모든 권리를 주장하고, 은행은 이를 존중하며 예금주에게 지급할 책임을 집니다.</p>
                        <p style="margin-bottom: 20px; font-weight: bold;">② 만기 지급액은 적립식 적금 계약 내용 및 이 약관에 근거하여 정산됩니다. 이
                            계약은 예금주의 투자와 노력에 대한
                            보상으로, 만기일에는 예금주가 적립한 모든 자금이 돌아오게 됩니다.</p>
                        <p style="margin-bottom: 20px; font-weight: bold;">③ 은행은 이 약관에 따라 예금주에게 만기 지급액을 신속하게 지급할 의무를
                            가집니다. 예금주는 해당 지급액을
                            예금주의 지정한 계좌로 받게 될 것이며, 이로써 계약 내용에 따라 은행은 예금주의 모든 권리를 이행하게 됩니다.</p>

                        <p style="font-weight: bold; margin-bottom: 10px;">제3조 실명거래</p>
                        <p style="margin-bottom: 8px;">① 거래처는 실명으로 거래하여야 한다.</p>
                        <p style="line-height: 1.2; margin-bottom: 15px;">② 은행은 거래처의 실명확인을 위하여 주민등록증ㆍ사업자등록증 등 실명확인증표 또는
                            그밖에
                            필요한 서류의 제시나 제출을 요구할 수 있고, 거래처는 이에 따라야 한다.</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="accordion" id="agreeAccordion1">
        <div class="accordion-item">
            <h2 class="accordion-header"><%--@declare id="agree"--%><label for="agree" style="width:100%">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseAgree1" aria-expanded="true" aria-controls="collapseAgree1">
                    <input type="checkbox" name="agree" value="1" style="width: 16px; height: 15px;">
                    <span style="font-size: 18px; color: white">&nbsp적금거래기본 약관</span>
                </button>
            </label>
            </h2>
            <div id="collapseAgree1" class="accordion-collapse collapse" aria-labelledby="headingProduct"
                 data-bs-parent="#agreeAccordion1">
                <div class="accordion-body" style="border: 3px solid #BFDFCB; border-radius: 0px 0px 5px 5px;">
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
                <div class="accordion-body" style="border: 3px solid #BFDFCB; border-radius: 0px 0px 5px 5px;">
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
                <div class="accordion-body" style="border: 3px solid #BFDFCB; border-radius: 0px 0px 5px 5px;">
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
                <div class="accordion-body" style="border: 3px solid #BFDFCB; border-radius: 0px 0px 5px 5px;">
                    <div class="accordion-body">
                        <p style="text-align: right;">개정준법감시인 심사필번호 제2021-약관-121호(2021.03.22)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form id="joinForm" action="/join-product">
        <input type="hidden" id="category" name="category">
        <input type="hidden" id="savingName" name="savingName">
        <input type="hidden" id="min_balance" name="min_balance">
        <input type="hidden" id="petName" name="petName">
        <input type="hidden" id="joinPeriod" name="joinPeriod">
        <input type="hidden" id="endDate" name="endDate">
        <input type="hidden" id="accountNumber" name="accountNumber">
        <input class="join" value="가입하기" readonly>
    </form>
</div>
</body>
<script>
    $(document).ready(function () {
        // 세션에서 제품 정보 가져오기
        const productInfo = JSON.parse(sessionStorage.getItem("selectedProduct"));

        // 제품 정보를 화면에 표시
        if (productInfo) {
            $("#productImg").attr("src", "/resources/img/" + productInfo.image);
            $("#productCategory").text(productInfo.category + " 펫 적금");
            $("#productDescription").text(productInfo.description);
            $("#productRate").text("이자율: " + productInfo.rate);
            $("#productMinBalance").text("최소 잔액: " + productInfo.min_balance + "원");
            $("#productEndDate").text("적금 예상 만기일: " + productInfo.endDate.split(" ")[0]);
            $("#productJoinPeriod").text("가입 기간: " + productInfo.joinPeriod + "개월");

        }

        $("#joinForm").click(function () {
            // 선택된 약관 동의 여부 확인
            const isAgreed = document.getElementById("agree_all").checked;
            if (!isAgreed) {
                alert("약관에 동의해주세요.");
            } else {
                // 서버로 전송할 데이터 구성
                // hidden 필드에 데이터 설정
                $("#category").val(productInfo.category);
                $("#min_balance").val(productInfo.min_balance);
                $("#savingName").val(productInfo.savingName);
                $("#petName").val(productInfo.petName);
                $("#joinPeriod").val(productInfo.joinPeriod);
                $("#endDate").val(productInfo.endDate);
                $("#accountNumber").val(productInfo.accountNumber);

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

</html>