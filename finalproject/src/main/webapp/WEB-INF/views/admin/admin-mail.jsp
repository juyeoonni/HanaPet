<%@ page import="com.kopo.finalproject.EmailSender" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>메일송부</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>

    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
    <!-- Nucleo Icons -->
    <link href="/resources/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="/resources/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/fd3ad8981e.js" ; crossorigin="anonymous"></script>
    <link href="/resources/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- CSS Files -->
    <link id="pagestyle" href="/resources/css/argon-dashboard.css?v=2.0.4" rel="stylesheet"/>

    <style>

        .btn-getstarted, .btn-getstarted:hover {
            font-size: 16px;
            color: #fff;
            background: #75A989;
            padding: 8px 23px;
            border-radius: 4px;
            transition: 0.3s;
        }

        #list {
            padding: 20px !important;
            border: 2px solid #75A989;
        }

        thead {
            border-bottom: 2px solid #75A989;
        }

        tr {
            padding: 10px !important;
        }
    </style>
</head>
<body class="g-sidenav-show bg-gray-100">
<div class="min-height-300 position-absolute w-100" style="background: #75A989"></div>
<aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
       id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
           aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html "
           target="_blank">
            <img src="/resources/img/main_logo.png" class="navbar-brand-img h-100" alt="main_logo">
        </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse w-auto ps ps--active-y" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/admin/dashboard">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
                         style="margin-top: -8px">
                        <i class="bi bi-clipboard-data fs-5" style="color: #75A989"></i>
                    </div>
                    <span class="nav-link-text ms-1">대시보드</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="/admin/saving-product">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
                         style="margin-top: -8px">
                        <i class="bi bi-piggy-bank fs-5" style="color: #75A989"></i>
                    </div>
                    <span class="nav-link-text ms-1">적금상품</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="/">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
                         style="margin-top: -8px">
                        <i class="bi bi-file-medical fs-5" style="color: #75A989"></i>
                    </div>
                    <span class="nav-link-text ms-1">보험상품</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="/">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
                         style="margin-top: -8px">
                        <i class="bi bi-envelope fs-5" style="color: #75A989"></i>
                    </div>
                    <span class="nav-link-text ms-1">메일</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="/">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
                         style="margin-top: -8px">
                        <i class="bi bi-person fs-4" style="color: #75A989"></i>
                    </div>
                    <span class="nav-link-text ms-1">손님관리</span>
                </a>
            </li>

        </ul>
        <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
        </div>
        <div class="ps__rail-y" style="top: 0px; height: 380px; right: 0px;">
            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 298px;"></div>
        </div>
    </div>
    <div class="sidenav-footer mx-3 " style="margin-top: 100px">
        <div class="card card-plain shadow-none" id="sidenavCard">
            <img class="w-50 mx-auto" src="/resources/img/admin/illustrations/icon-documentation.svg"
                 alt="sidebar_illustration">
        </div>
    </div>
</aside>
<main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur"
         data-scroll="false">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="javascript:;">Pages</a>
                    </li>
                    <li class="breadcrumb-item text-sm text-white active" aria-current="page">mail</li>
                </ol>
                <h4 class="font-weight-bolder text-white mb-0">메일송부</h4>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                    <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                        <div class="input-group">
                        </div>
                    </div>
                </div>
                <ul class="navbar-nav justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <a href="/"
                           class="nav-link text-white font-weight-bold px-0">
                            <i class="fa fa-user me-sm-1"></i>
                            <span class="d-sm-inline d-none"></span>
                        </a>

                    <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line bg-white"></i>
                                <i class="sidenav-toggler-line bg-white"></i>
                                <i class="sidenav-toggler-line bg-white"></i>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item px-3 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-white p-0">
                            <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown pe-2 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-bell cursor-pointer"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->

    <div class="container-fluid py-3">
        <div class="container-fluid py-2">
            <div class="row">
                <div class="col-md-4" style="width: 100%;">
                    <div class="card card-profile">

                        <div class="card-header pb-0">
                            <div class="d-flex align-items-center">
                                <h5 class="mb-3">상품 관련 정보</h5>
                            </div>
                        </div>
                        <div class="card-body" style="">
                            <div class="mt-2">
                                <p class="mb-2" style="display: inline-block;">적금명</p>
                                <p style="margin-left: 120px; display: inline-block;">${product.category}
                                </p>
                                <br>
                                <p class="mb-2" style="display: inline-block;">상세 설명</p>
                                <p style="margin-left: 100px; display: inline-block;">${product.description}
                                </p>
                                <br>
                                <p class="mb-0" style="display: inline-block;">기본금리</p>
                                <p style="margin-left: 106px; display: inline-block;">${product.rate}%</p>
                                <br>
                                <p class="mb-0" style="display: inline-block;">우대금리</p>
                                <p style="margin-left: 106px; display: inline-block;">${product.prime_rate}%</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid py-2">
            <div class="col-md-12">
                <div class="card card-profile">
                    <div class="card-header pb-0">
                        <div class="d-flex align-items-center">
                            <h5 class="mb-0">메일 송부 고객 선택</h5>
                            <button id="checkVal" type="button" class="btn btn-getstarted btn-sm ms-auto"
                                    style="margin: 0;">확인
                            </button>
                        </div>
                    </div>

                    <!-- 내용 -->
                    <div class="tab-content container m-0 p-0" id="myTabContent">
                        <div class="tab-pane fade show active" id="userinfo" role="tabpanel"
                             aria-labelledby="userinfo-tab">

                            <div class="card-body pt-0">

                                <div class="text-center mt-4">
                                    <table border="1" id="list">

                                        <thead>
                                        <tr>
                                            <th style="width: 30px;">
                                                <input type="checkbox" id="chk_all" name="chk_all"/>
                                            </th>
                                            <th style="width: 230px;">
                                                아이디
                                            </th>
                                            <th style="width: 230px;">
                                                이름
                                            </th>
                                            <th style="width: 230px;">
                                                이메일
                                            </th>
                                            <th style="width: 230px;">
                                                가입일
                                            </th>
                                            <th style="width: 230px;">
                                                반려견 수
                                            </th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${emailGuestList}" begin="0" end="10" step="1"
                                                   var="emailGuest"
                                                   varStatus="loop">
                                            <tbody>
                                            <tr>
                                                <td style="width: 30px;">
                                                    <input type="checkbox" id="chk_list" name="chk_list"
                                                           value="list1"/>
                                                </td>
                                                <td style="width: 230px;">
                                                        ${emailGuest.guest_id}
                                                </td>
                                                <td style="width: 230px;">
                                                        ${emailGuest.name}
                                                </td>
                                                <td style="width: 230px;">
                                                        ${emailGuest.email}
                                                </td>
                                                <td style="width: 230px;">
                                                        ${emailGuest.reg_date.split(" ")[0]}
                                                </td>
                                                <td style="width: 230px;">
                                                        ${emailGuest.pet_cnt}마리
                                                </td>
                                            </tr>

                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- mail 폼 -->
        <div class="container-fluid py-2">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header pb-0">
                            <div class="d-flex align-items-center">
                                <h5 class="mb-0">메일 송부하기</h5>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <form th:action="@{/mailService}" method="post">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <%--@declare id="example-text-input"--%><label for="example-text-input"
                                                                                           class="form-control-label"
                                                                                           style="font-size: 16px;">받는
                                            분</label>
                                            <input class="form-control" type="text" name="name" id="name">
                                            <input type="hidden" name="address" placeholder="이메일 주소를 입력하세요" id="email">

                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="example-text-input" class="form-control-label"
                                                   style="font-size: 16px;">제목</label>
                                            <input class="form-control" type="text" name="title">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="example-text-input" class="form-control-label"
                                                   style="font-size: 16px;">내용</label>
                                            <textarea class="form-control" type="text" name="content"
                                                      placeholder="보낼 내용을 입력하세요">

                                            </textarea>
                                        </div>
                                    </div>
                                    <%--                                    <div class="col-md-12">--%>
                                    <%--                                        <div class="form-group">--%>
                                    <%--                                            &lt;%&ndash;@declare id="example-text-input"&ndash;%&gt;<label for="example-text-input"--%>
                                    <%--                                                                                           class="form-control-label"--%>
                                    <%--                                                                                           style="font-size: 16px;">첨부파일</label><br>--%>
                                    <%--                                            <input type="file" name="attachFileList" class="file-input"/>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </div>--%>
                                    <div class="text-end">
                                        <button class="btn btn-getstarted btn-sm ms-auto" id="sendEmail"
                                                style="background: #75A989; color: #fff;">
                                            발송
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer pt-5">
            <div class="container-fluid">
                <div class="row align-items-center justify-content-lg-between">

                    <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/presentation" class="nav-link text-muted"
                               target="_blank">About HanaPet</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted"
                               target="_blank">License</a>
                        </li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>
</main>

<!-- Core JS Files -->
<script src="<c:url value="/resources/js/core/popper.min.js"/>"></script>
<script src="<c:url value="/resources/js/core/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/perfect-scrollbar.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/smooth-scrollbar.min.js"/>"></script>
<script src="<c:url value="/resources/js/plugins/chartjs.min.js"/>"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
    $(window).load(function () {
        $("#sendEmail").click(function () {
            <%--            <%EmailSender.naverMailSend("yulim13sky@naver.com","적금 상품 새로 나옴","내용 test");%>--%>
        });
    });
</script>
<script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
        var options = {
            damping: '0.5'
        }
        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
</script>

<script type="text/javascript">
    $(window).load(function () {
        $("input[name='chk_all']").click(function () {
            var chk_listArr = $("input[name='chk_list']");
            for (var i = 0; i < chk_listArr.length; i++) {
                chk_listArr[i].checked = this.checked;
            }
        });

        $("input[name='chk_list']").click(function () { //리스트 항목이 모두 선택되면 전체 선택 체크
            if ($("input[name='chk_list']:checked").length == 5) {
                $("input[name='chk_all']")[0].checked = true;
            } else { //리스트 항목 선택 시 전체 선택 체크를 해제함
                $("input[name='chk_all']")[0].checked = false;
            }
        });

    });

    $(document).ready(function () {
        $('#checkVal').on('click', function () {
            var names = '';
            var emails = '';
            $('input[id=chk_list]:checked').each(function () {

                var checkbox = $(this);
                var tr = checkbox.closest('tr');  // 사용 `closest` 대신 `parent().parent()`
                var td = tr.children();

                var name = td.eq(2).text().trim();
                var email = td.eq(3).text().trim();

                names += name + ' ';  // 이름 추가
                emails += email + ' ';  // 이메일 추가
            });

            $('#name').val(names.trim());
            $('#email').val(emails.trim());
        });

    });


</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/resources/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>
