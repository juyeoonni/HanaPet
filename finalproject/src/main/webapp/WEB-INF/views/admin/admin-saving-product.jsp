<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/admin/apple-icon.png">
    <link rel="icon" type="image/png" href="/resources/img/admin/favicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>

    <title>
        Argon Dashboard 2 by Creative Tim
    </title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
    <!-- Nucleo Icons -->
    <link href="/resources/css/nucleo-icons.css" rel="stylesheet"/>
    <link href="/resources/css/nucleo-svg.css" rel="stylesheet"/>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- CSS Files -->
    <link id="pagestyle" href="/resources/css/argon-dashboard.css?v=2.0.4" rel="stylesheet"/>
</head>
<style>
    .navbar-vertical.navbar-expand-xs.fixed-start {
        left: 0;
        z-index: 0;
    }

    .avatar {
        border-radius: 0px;
    }

    #btn {
        font-size: 15px !important;
        background-color: #75A989;
        padding: 10px 10px;
        border-radius: 4px;
        width: 100px;
        cursor: pointer;
        color: white !important;
        border: 1px solid #75A989;
    }

    #cancle, #delete {
        font-size: 17px !important;
        font-weight: bold;
        background-color: #75A989;
        padding: 3px;
        border-radius: 4px;
        width: 80px;
        cursor: pointer;
        color: white !important;
        border: 1px solid #75A989;
    }

    .table > :not(caption) > * > * {
        padding: 0.6rem 0.6rem;
    }

</style>
<body class="g-sidenav-show   bg-gray-100">
<div class="min-height-300 bg-primary position-absolute w-100"></div>
<aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 ps"
       id="sidenav-main">
    <div class="sidenav-header">
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
                <a class="nav-link " href="/admin/insu-product">
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
                    <div class="input-group">
                    </div>
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
                    <h4 style="display: inline-block;">적금 상품 목록</h4>
                    <button id="btn" href="javascript:;" onclick="insertProduct()"
                            class="text-secondary font-weight-bold text-xs" data-toggle="tooltip"
                            data-original-title="Edit user"
                            style="font-size: 22px; position: relative; left: 880px;">
                        상품 등록
                    </button>
                </div>
                <div class="card-body px-0 pt-0 pb-2">
                    <div class="table-responsive p-0">
                        <table class="table align-items-center mb-0">
                            <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-m font-weight-bolder opacity-7">
                                    상품명
                                </th>
                                <th class="text-uppercase text-secondary text-m font-weight-bolder opacity-7 ps-2">
                                    기본금리
                                </th>
                                <th class="text-center text-uppercase text-secondary text-m font-weight-bolder opacity-7">
                                    우대금리
                                </th>
                                <th class="text-center text-uppercase text-secondary text-m font-weight-bolder opacity-7">
                                    등록/수정일
                                </th>
                                <th class="text-center text-uppercase text-secondary text-m font-weight-bolder opacity-7">
                                    상태
                                </th>
                                <th class="text-secondary opacity-3"></th>
                                <th class="text-secondary opacity-3"></th>
                                <th class="text-secondary opacity-3"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${products}" varStatus="vs">
                                <tr>
                                    <td>
                                        <div class="d-flex px-2 py-1">
                                            <div>
                                                <img src="/resources/img/${product.image}"
                                                     class="avatar avatar-sm me-3"/>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">${product.category}</h6>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="padding-left: 25px;">
                                        <p class="text-xs font-weight-bold mb-0">${product.rate}%</p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <span class="text-secondary text-xs font-weight-bold">${product.prime_rate}%</span>
                                    </td>
                                    <td class="align-middle text-center">
                                        <span class="text-secondary text-xs font-weight-bold">${product.creation_date.split(" ")[0]}</span>
                                    </td>
                                    <td class="align-middle text-center">
                                        <span class="badge badge-sm bg-gradient-success">진행중</span>
                                    </td>
                                    <td class="align-middle">
                                        <a href="javascript:;"
                                           onclick="EmailProduct('${product.category}')"
                                           class="font-weight-bold">
                                            <i class="bi bi-envelope fs-5" style="color: #75A989"></i>&nbsp메일송부
                                        </a>
                                    </td>
                                    <td class="align-middle">
                                        <a href="javascript:;"
                                           onclick="updateProduct('${product.category}')"
                                           class="font-weight-bold">
                                            <i class="bi bi-pencil-square fs-5" style="color: #75A989"></i>&nbsp수정
                                        </a>
                                    </td>
                                    <td class="align-middle">
                                        <a type="button" class="font-weight-bold" data-toggle="modal"
                                           data-target="#exampleModal${vs.index}" id="openModal${vs.index}"
                                           onclick="openModal('${product.category}', '#exampleModal${vs.index}')">
                                            <i class="bi bi-trash fs-5" style="color: #75A989"></i>&nbsp삭제
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <c:forEach items="${products}" var="productList" varStatus="vs">
            <div class="modal fade" id="exampleModal${vs.index}" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document" style="margin-top: 240px;">
                    <div class="modal-content" style="width: 120%; margin-left: 0%;">
                        <div class="modal-header">
                            <p class="fw-bold font-sans-serif"
                               style="color: #555; font-size: 23px; margin-bottom: 0px; padding-left: 12px;">${productList.category}</p>
                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="modal-body fw-bold font-sans-serif"
                             style="margin-bottom: 15px; padding-top: 20px; font-size: 18px; text-align: center; color: #555; border-bottom: none;">
                            상품을 삭제하시겠습니까?
                        </div>
                        <div class="modal-footer" style="border-top: none">
                            <button id="cancle">취소</button>
                            <form action="/deleteproduct" method="post"
                                  name="deleteproduct">
                                <input type="hidden" id="category" name="category"
                                       value=${productList.category}>
                                <button id="delete" type="submit" data-dismiss="modal" aria-label="Close">삭제</button>
                            </form>
                        </div>
                        <script>
                            $(document).ready(function () {
                                $('#cancle').click(function () {
                                    $('.modal').modal('hide');
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>
        </c:forEach>

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
<script>

    function openModal(savingname, modalid) {

        $(modalid).modal("show");
        console.log(modalid);
        $("#savingname").text(savingname);
        console.log(savingname)

        document.querySelector(".modal").classList.remove("hidden");
    }

    function deleteproduct(savingname) {
        console.log("삭제: " + savingname);
        let del = $("#del");
        del.attr(savingname);
        del.attr("action", "/deleteproduct");
        del.submit();
    }

    function insertProduct() {
        location.href = "/admin/insert-saving-product";
    }

    function updateProduct(category) {
        location.href = "/admin/update-saving-product?category=" + category;
    }

    function EmailProduct(category) {
        location.href = "/admin/email?category=" + category;
    }
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/resources/js/argon-dashboard.min.js?v=2.0.4"></script>

</body>