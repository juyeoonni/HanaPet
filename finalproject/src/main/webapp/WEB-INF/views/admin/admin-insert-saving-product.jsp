<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/admin/apple-icon.png">
    <link rel="icon" type="image/png" href="/resources/img/admin/favicon.png">
    <title>
        product
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>

    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
    <!-- Nucleo Icons -->
    <link href="/resources/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="/resources/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="/resources/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- CSS Files -->

    <link id="pagestyle" href="/resources/css/argon-dashboard.css?v=2.0.4" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/b3a7369db8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/main.css"/>
    <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous">
    </script>
    <style>
        .filebox .upload-name {
            width: 75%;
            padding: 0.5rem 0.75rem;
            font-size: 0.875rem;
            font-weight: 400;
            line-height: 1.4rem;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #d2d6da;
            appearance: none;
            border-radius: 0.5rem;
            transition: box-shadow 0.15s ease, border-color 0.15s ease;
        }


        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }

        .filebox label {
            height: 40px;
            font-size: 14px !important;
            background-color: #75A989;
            padding: 8px 10px;
            border-radius: 4px;
            width: 100px;
            cursor: pointer;
            color: white !important;
            border: 1px solid #75A989;
            text-align: center;

        }

        .openBtn {
            font-size: 18px !important;
            background-color: #75A989;
            padding: 10px 10px;
            border-radius: 4px;
            width: 100px;
            cursor: pointer;
            color: white !important;
            border: 1px solid #75A989;
        }

        .bg-primary {
            background-color: #75A989 !important;
        }

    </style>
</head>

<body class="g-sidenav-show   bg-gray-100">
<div class="min-height-300 bg-primary position-absolute w-100">
</div>
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
                <a class="nav-link active " href="/admin/saving-product">
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
                <a class="nav-link" href="/admin/email?category">
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
                    <li class="breadcrumb-item text-sm text-white active" aria-current="page">saving-products</li>
                </ol>
                <h4 class="font-weight-bolder text-white mb-0" style="font-size: 25px;">적금 상품</h4>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                </div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-white font-weight-bold px-0">
                            <i class="fa fa-user me-sm-1"></i>

                        </a>
                    </li>
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
    <div class="container-fluid py-4">
        <div class="row">
            <div class="card">
                <div class="card-header pb-0" style="margin-bottom: 15px;">
                    <h4 style="display: inline-block;">상품 등록</h4>
                </div>
                <form name="form1" action="/productAdminInsertProc" method="post">
                    <div class="card-body" style="padding: 40px 50px 100px 50px;">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <%--@declare id="example-text-input"--%><label for="example-text-input"
                                                                                   class="form-control-label"
                                                                                   style="font-size: 18px;">상품
                                    이름</label>
                                    <input id="form" class="form-control" type="text" name="category"
                                           value="">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="example-text-input" class="form-control-label"
                                           style="font-size: 18px;">상품 이미지</label>
                                    <div class="filebox">
                                        <input class="upload-name" value="" disabled>
                                        <input type="hidden" name="image">
                                        <label for="file">파일찾기</label>
                                        <input type="file" id="file">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="example-text-input" class="form-control-label"
                                               style="font-size: 18px;">상품 상세</label>
                                        <input id="form" class="form-control" type="text" name="description"
                                               value="">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="example-text-input" class="form-control-label"
                                               style="font-size: 18px;">기본 금리</label>
                                        <div style="display: flex; align-items: center;">
                                            <input id="form" class="form-control" type="text" name="rate" value="">%
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="example-text-input" class="form-control-label"
                                               style="font-size: 18px;">우대 금리</label>
                                        <div style="display: flex; align-items: center;">
                                            <input id="form" class="form-control" type="text" name="prime_rate"
                                                   value="">%
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="example-text-input" class="form-control-label"
                                               style="font-size: 18px;">최소 가입 금액</label>
                                        <div style="display: flex; align-items: center;">
                                            <input id="form" class="form-control amount" type="text" name="min_balance"
                                                   value="">원
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="example-text-input" class="form-control-label"
                                               style="font-size: 18px;">최대 가입 금액</label>
                                        <div style="display: flex; align-items: center;">
                                            <input id="form" class="form-control amount" type="text" name="max_balance"
                                                   value="">원
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="example-text-input" class="form-control-label"
                                               style="font-size: 18px;">최소 가입 기간</label>
                                        <div style="display: flex; align-items: center;">
                                            <input id="form" class="form-control" type="text" name="min_period"
                                                   value="">주
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="example-text-input" class="form-control-label"
                                               style="font-size: 18px;">최대 가입 기간</label>
                                        <div style="display: flex; align-items: center;">
                                            <input id="form" class="form-control" type="text" name="max_period"
                                                   value="">주
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="position: relative; top: 35px;" align="center">
                            <input class="openBtn" type="submit" value="등록" style="font-size: 18px;">
                        </div>
                    </div>
                </form>

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
<!--   Core JS Files   -->
<script src="/resources/js/core/popper.min.js"></script>
<script src="/resources/js/core/bootstrap.min.js"></script>
<script src="/resources/js/plugins/perfect-scrollbar.min.js"></script>
<script src="/resources/js/plugins/smooth-scrollbar.min.js"></script>
<script src="/resources/js/plugins/chartjs.min.js"></script>
<script type="text/javascript">
    $("#file").on('change', function () {
        var fileName = $("#file").val();
        fileName = fileName.split("\\")[2];
        $(".upload-name").val(fileName);
        $('input[name="image"]').val(fileName);
    });
    $(document).ready(function () {
        const $inputField = $(".amount");

        // 기존 값을 콤마로 구분된 값으로 변환
        updateValueWithComma($inputField);

        // 사용자가 값을 변경할 때 콤마를 다시 추가/제거
        $inputField.on("input", function () {
            updateValueWithComma($(this));
        });
    });

    function updateValueWithComma($element) {
        const valueWithoutCommas = $element.val().replace(/,/g, '');  // 콤마 제거
        const formattedValue = Number(valueWithoutCommas).toLocaleString();
        $element.val(formattedValue === "0" ? "" : formattedValue);
    }

</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
</body>