<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>My Insurance</title>
    <!-- Favicons -->
    <link href="img/favicon.png" rel="icon"/>
    <link href="img/apple-touch-icon.png" rel="apple-touch-icon"/>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
    <link href="vendor/aos/aos.css" rel="stylesheet"/>
    <link href="vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
    <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>

    <!-- Variables CSS Files. Uncomment your preferred color scheme -->
    <link rel="stylesheet" type="text/css" href="css/variables.css">

    <!-- Template Main CSS File  -->
    <link href="css/main.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/main2.css"/>
    <script src="https://kit.fontawesome.com/fd3ad8981e.js" ; crossorigin="anonymous"></script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        table {
            font-size: 18px;
        }

        td {
            border: 1px solid darkgray;
        }

        .container {
            padding: 30px;
        }
    </style>
</head>
<body>

<div id='mask_wrap2'>
    <div id="wrap2">
        <div id="capture">
            <div class="container">
                <img src="/resources/img/pdf.png" style="width: 100%">
                <h4 class="mt-4 fw-bold">신청인 정보</h4>
                <table border="1" width="100%" class="mb-5" style="font-family: 'Pretendard-Regular';">
                    <tr>
                        <td class="text-center" style="width:200px;">성명</td>
                        <td class="text-start" style="padding-left: 20px;">최유림</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">주민등록번호</td>
                        <td class="text-start" style="padding-left: 20px;">981223-2371629</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">자택주소</td>
                        <td class="text-start"
                            style="padding-left: 20px;">서울시 강서구 화곡로 11번지
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">연락처</td>
                        <td class="text-start" style="padding-left: 20px;">010-2027-1810</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">반려견 이름</td>
                        <td class="text-start" style="padding-left: 20px;">토리</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">반려견 생년월일</td>
                        <td class="text-start" style="padding-left: 20px;">2020-02-12</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">반려견 품종</td>
                        <td class="text-start" style="padding-left: 20px;">푸들</td>
                    </tr>

                </table>

                <h4 class="mt-4 fw-bold">보험 정보</h4>

                <table border="1" width="100%" class="mb-5" style="font-family: 'Pretendard-Regular';">
                    <tr>
                        <td class="text-center" style="width:200px;">회사명</td>
                        <td class="text-start" style="padding-left: 20px;">하나펫손해보험</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">보험명</td>
                        <td class="text-start" style="padding-left: 20px;">프로미 반려동물보험 One형 플랜</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">보험료</td>
                        <td class="text-start" style="padding-left: 20px;">403,620원</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">가입날짜</td>
                        <td class="text-start" style="padding-left: 20px;">2023-10-10</td>
                    </tr>
                    <tr>
                        <td class="text-center" style="width:200px;">비고</td>
                        <td class="text-start" style="padding-left: 20px;">입통원비가 따로 보장되는 보험</td>
                    </tr>

                </table>

                <p style="color: red">* 상기 사항은 사실과 틀림없음을 확인합니다.</p>
                <p>※ 전산 발급된 것만 유효하며, 수기작성, 정정, 가필, 복사된 것은 무효입니다.</p>
                <p>※ 기재내용은 기준일(24시) 시점으로 작성되어있습니다.</p>
                <div style="text-align: center">
                    <img alt="" src="/resources/img/insurance-logo.png" style="width:150px; ">
                </div>
            </div>

        </div>
    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/4.1.1/es6-promise.auto.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script>

    function pdfPrint() {

        // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
        html2canvas(document.body, {
            onrendered: function (canvas) {

                // 캔버스를 이미지로 변환
                var imgData = canvas.toDataURL('image/png');

                var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
                var imgHeight = canvas.height * imgWidth / canvas.width;
                var heightLeft = imgHeight;

                var doc = new jsPDF('p', 'mm');
                var position = 0;

                // 첫 페이지 출력
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;

                // 한 페이지 이상일 경우 루프 돌면서 출력
                while (heightLeft >= 20) {
                    position = heightLeft - imgHeight;
                    doc.addPage();
                    doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                    heightLeft -= pageHeight;
                }

                // 파일 저장
                doc.save('HanaPet_signInfo.pdf');

            }

        });

    }

    window.onload = function () {
        pdfPrint();
    }
</script>

</body>
