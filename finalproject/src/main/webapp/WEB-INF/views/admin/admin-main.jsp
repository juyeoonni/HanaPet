<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/img/admin/apple-icon.png">
    <link rel="icon" type="image/png" href="/resources/img/admin/favicon.png">
    <title>
        Argon Dashboard 2 by Creative Tim
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css"/>

    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="/resources/css/nucleo-icons.css" rel="stylesheet">
    <link href="/resources/css/nucleo-svg.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <style media="all" id="fa-v4-font-face">/*!


    </style>
    <link href="/resources/css/nucleo-svg.css" rel="stylesheet">
    <!-- CSS Files -->
    <link id="pagestyle" href="/resources/css/argon-dashboard.css?v=2.0.4" rel="stylesheet">
</head>

<body class="g-sidenav-show   bg-gray-100">
<div class="min-height-300 bg-primary position-absolute w-100"></div>
<aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 ps"
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
                <a class="nav-link active " href="/admin/dashboard">
                    <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center"
                         style="margin-top: -8px">
                        <i class="bi bi-clipboard-data fs-5" style="color: #75A989"></i>
                    </div>
                    <span class="nav-link-text ms-1">대시보드</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/admin/saving-product">
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
<main class="main-content position-relative border-radius-lg ps">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur"
         data-scroll="false">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <li class="breadcrumb-item text-sm text-white"><a class="opacity-5 text-white" href="javascript:;">Pages</a>
                    </li>
                    <li class="breadcrumb-item text-sm text-white active" aria-current="page">Dashboard</li>
                </ol>
                <h4 class="font-weight-bolder text-white mb-0">대시보드</h4>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                    <div class="input-group">
                    </div>
                </div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-white font-weight-bold px-0">
                            <i class="fa fa-user me-sm-1" aria-hidden="true"></i>
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
                            <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown pe-2 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-bell cursor-pointer" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
        <div class="row mb-4" style="display: flex;">

            <div class="col-lg-7 mb-lg-0 mb-4" style="width: 75%">
                <div class="card z-index-2 h-100">
                    <div class="card-header pb-0 pt-3 bg-transparent">
                        <h5 class="text-capitalize">매달 신규 가입자</h5>
                    </div>
                    <div class="card-body p-3">
                        <div class="chart" style="height: 300px">
                            <canvas id="chart-line" class="chart-canvas" height="380" width="577"
                                    style="display: block; box-sizing: border-box; height: 370px; width: 461.8px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div style="width: 25%;">
                <div class="col-xl-3 col-sm-6 mb-xl-0" style="width: 100%">
                    <div class="card">
                        <div class="card-body p-3">
                            <div class="row">
                                <div class="col-3 text-start">
                                    <div class="icon icon-shape shadow-primary text-center rounded-circle"
                                         style="background: #b0c4b1">
                                        <i class="bi bi-check2-circle fs-4"></i>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-uppercase font-weight-bold">총 회원 수</p>
                                        <h5 class="font-weight-bolder">
                                            ${guestCnt}명
                                        </h5>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="numbers">
                                        <p class="text-sm mb-0 text-uppercase font-weight-bold">총 반려견 수</p>
                                        <h5 class="font-weight-bolder">
                                            ${petCnt}마리
                                        </h5>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-sm-6 mt-4" style="width: 100%">
                    <div class="card">
                        <div class="card-body p-3">
                            <div class="row">
                                <h5 style="text-align: center">반려견 성별 분포</h5>
                                <div class="chart">
                                    <canvas id="chart-line4" class="chart-canvas" height="300" width="577"
                                            style="display: block; box-sizing: border-box; height: 300px; width: 300px;"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-xl-7 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-body p-3">
                        <div class="row">
                            <h5 style="text-align: center">반려견 나이별 분포</h5>
                            <div class="chart">
                                <canvas id="chart-line2" class="chart-canvas" height="260" width="577"
                                        style="display: block; box-sizing: border-box; height: 300px; width: 461.8px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-5 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-body p-3">
                        <div class="row">
                            <h5 style="text-align: center">반려견 품종별 분포</h5>
                            <div class="chart">
                                <canvas id="chart-line3" class="chart-canvas" height="375" width="577"
                                        style="display: block; box-sizing: border-box; height: 300px; width: 461.8px;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="row mt-4">
            <div class="col-lg-5">
                <div class="card ">
                    <div class="card">
                        <div class="card-header pb-0 p-3">
                            <h5 class="mb-0">펫 적금 순위</h5>
                        </div>
                        <div class="card-body p-3">
                            <ul class="list-group">
                                <c:forEach var="data" items="${adminSavingList}">
                                    <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                                        <div class="d-flex align-items-center" style="gap: 20px">
                                            <i class="bi bi-award fs-3"></i>
                                            <div class="d-flex flex-column">
                                                <h6 class="mb-1 text-dark text-sm">${data.category}</h6>

                                            </div>
                                            <span class="text-xs">${data.category_accounts}개</span>
                                            <span class="text-xs">${data.account_percentage}%</span>
                                        </div>
                                        <div class="d-flex">
                                            <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto">
                                                <i class="bi bi-chevron-right fs-4"></i></button>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%--            <div class="col-lg-2">--%>
            <%--                <div class="card">--%>
            <%--                    <div class="card-body p-3">--%>
            <%--                        <div class="row">--%>
            <%--                            <div class="chart">--%>
            <%--                                <canvas id="chart-line5" class="chart-canvas" height="375" width="577"--%>
            <%--                                        style="display: block; box-sizing: border-box; height: 300px; width: 461.8px;"></canvas>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <div class="col-lg-7">
                <div class="card">
                    <div class="card-header pb-0 p-3">
                        <h5 class="mb-0">펫 보험 순위</h5>
                    </div>
                    <div class="card-body p-3">
                        <ul class="list-group">
                            <c:forEach var="data" items="${adminInsuranceList}">
                                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                                    <div class="d-flex align-items-center" style="gap: 20px">
                                        <div>
                                            <i class="bi bi-award fs-3"></i>
                                        </div>
                                        <div class="d-flex flex-column">
                                            <h6 class="mb-1 text-dark text-sm">${data.INSURANCE_NAME}</h6>
                                        </div>
                                        <span class="text-xs">${data.insurance_guests}개</span>
                                        <span class="text-xs">${data.percentage}%</span>
                                    </div>
                                    <div class="d-flex">
                                        <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto">
                                            <i class="bi bi-chevron-right fs-4"></i></button>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <%--            <div class="col-lg-3">--%>
            <%--                <div class="card">--%>
            <%--                    <div class="card-body p-3">--%>
            <%--                        <div class="row">--%>
            <%--                            <div class="chart">--%>
            <%--                                <canvas id="chart-line6" class="chart-canvas" height="375" width="577"--%>
            <%--                                        style="display: block; box-sizing: border-box; height: 300px; width: 461.8px;"></canvas>--%>
            <%--                            </div>--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>
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
    <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
        <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
    </div>
    <div class="ps__rail-y" style="top: 0px; right: 0px;">
        <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
    </div>
</main>
<!--   Core JS Files   -->
<script src="/resources/js/core/popper.min.js"></script>
<script src="/resources/js/core/bootstrap.min.js"></script>
<script src="/resources/js/plugins/perfect-scrollbar.min.js"></script>
<script src="/resources/js/plugins/smooth-scrollbar.min.js"></script>
<script src="/resources/js/plugins/chartjs.min.js"></script>

<%--<script>--%>
<%--    var insurance_names = [];--%>
<%--    var insurance_percentages = [];--%>

<%--    <c:forEach var="data" items="${adminInsuranceList}">--%>
<%--    insurance_names.push("${data.INSURANCE_NAME}");--%>
<%--    insurance_percentages.push(${data.percentage});--%>
<%--    </c:forEach>--%>

<%--    var ctx6 = document.getElementById("chart-line6").getContext("2d");--%>
<%--    new Chart(ctx6, {--%>
<%--        type: "pie",--%>
<%--        data: {--%>
<%--            labels: insurance_names,--%>
<%--            datasets: [{--%>
<%--                data: insurance_percentages,--%>
<%--            }]--%>
<%--        },--%>
<%--        options: {--%>
<%--            legend: {--%>
<%--                display: true,--%>
<%--            }--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    var categories = [];--%>
<%--    var account_percentages = [];--%>

<%--    <c:forEach var="data" items="${adminSavingList}">--%>
<%--    categories.push("${data.category}");--%>
<%--    account_percentages.push(${data.account_percentage});--%>
<%--    </c:forEach>--%>

<%--    var ctx5 = document.getElementById("chart-line5").getContext("2d");--%>
<%--    new Chart(ctx5, {--%>
<%--        type: "pie",--%>
<%--        data: {--%>
<%--            labels: categories,--%>
<%--            datasets: [{--%>
<%--                tension: 0.4,--%>
<%--                borderColor: "#5e72e4",--%>
<%--                borderWidth: 2,--%>
<%--                fill: true,--%>
<%--                data: account_percentages,--%>
<%--            }]--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<script>
    var genders = [];
    var gender_counts = [];
    var gender_percentages = [];

    <c:forEach var="data" items="${adminPetGenderList}">
    genders.push("${data.gender}" == 'F' ? "암컷" : "수컷");
    gender_counts.push(${data.gender_count});
    gender_percentages.push(${data.gender_percentage});
    </c:forEach>

    var ctx4 = document.getElementById("chart-line4").getContext("2d");
    new Chart(ctx4, {
        type: "pie",
        data: {
            labels: genders,
            datasets: [{
                data: gender_counts,
                backgroundColor: [
                    '#edafb8',
                    '#f7e1d7',
                    '#dedbd2',
                    '#b0c4b1',
                    '#4a5759'
                ]
            }]
        },
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            var index = context.dataIndex;
                            var count = gender_counts[index];
                            var percentage = gender_percentages[index];
                            return count + '마리, ' + percentage + '%';
                        }
                    }
                }, legend: {
                    labels: {
                        // 글자 크기 조정
                        font: {
                            size: 17, // 원하는 글자 크기를 설정합니다.
                            weight: 'bold'
                        },
                        padding: 20
                    }
                }
            },
            scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        padding: 10,
                        color: '#fbfbfb',
                        font: {
                            size: 11,
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },

            },
        }
    });
</script>
<script>
    var ages = [];
    var age_counts = [];
    var percentages = [];

    <c:forEach var="data" items="${adminPetAgeList}">
    ages.push("${data.age}살");
    age_counts.push(${data.age_count});
    percentages.push(${data.age_percentage});
    </c:forEach>

    var ctx2 = document.getElementById("chart-line2").getContext("2d");
    new Chart(ctx2, {
        type: "bar",
        data: {
            labels: ages,
            datasets: [{
                data: age_counts, backgroundColor: [
                    '#edafb8',
                    '#f7e1d7',
                    '#dedbd2',
                    '#b0c4b1'
                ]
            }]
        },
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            var index = context.dataIndex;
                            var count = age_counts[index];
                            var percentage = percentages[index];
                            return count + '마리, ' + percentage + '%';
                        }
                    }
                }, legend: {
                    display: false,
                }
            }, scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        drawOnChartArea: false,
                        drawTicks: true,
                    },
                    precision: 0,
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            if (Number.isInteger(value) && value > 0) {
                                return value + '마리'
                            } else {
                                return "";
                            }

                        }
                    }
                }
            }

        }
    });
</script>
<script>
    var breeds = [];
    var bree_counts = [];
    var breed_percentages = [];

    <c:forEach var="data" items="${adminPetBreedList}">
    breeds.push("${data.breed}");
    bree_counts.push(${data.breed_count});
    breed_percentages.push(${data.breed_percentage});
    </c:forEach>

    var ctx3 = document.getElementById("chart-line3").getContext("2d");
    new Chart(ctx3, {
        type: "bar",
        data: {
            labels: breeds,
            datasets: [{
                data: bree_counts,
                backgroundColor: [
                    '#edafb8',
                    '#f7e1d7',
                    '#dedbd2',
                    '#b0c4b1'
                ]
            }]
        },
        options: {
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            var index = context.dataIndex;
                            var count = bree_counts[index];
                            var percentage = breed_percentages[index];
                            return count + '마리, ' + percentage + '%';
                        }
                    }
                }, legend: {
                    display: false,
                }
            }, scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        drawOnChartArea: false,
                        drawTicks: true,
                    },
                    precision: 0,
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            if (Number.isInteger(value) && value > 0) {
                                return value + '마리';
                            } else {
                                return "";
                            }
                        }
                    }
                }
            }

        }
    });
</script>
<script>
    var months = [];
    var counts = [];

    <c:forEach var="data" items="${adminGuestMonthlyList}">
    months.push("${data.month}");
    counts.push(${data.monthly_guest_count});
    </c:forEach>

    var ctx1 = document.getElementById("chart-line").getContext("2d");
    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);
    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');

    new Chart(ctx1, {
        type: "line",
        data: {
            labels: months,
            datasets: [{
                label: "매달 신규 가입자",
                data: counts,
                backgroundColor: [
                    '#f7e1d7'
                ]
            }],
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false,
                }
            },
            interaction: {
                intersect: false,
                mode: 'index',
            },
            scales: {
                y: {
                    grid: {
                        drawBorder: false,
                        display: true,
                        drawOnChartArea: true,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        padding: 10,
                        color: '#fbfbfb',
                        font: {
                            size: 11,
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
                x: {
                    grid: {
                        drawBorder: false,
                        display: false,
                        drawOnChartArea: false,
                        drawTicks: false,
                        borderDash: [5, 5]
                    },
                    ticks: {
                        display: true,
                        color: '#ccc',
                        padding: 20,
                        font: {
                            size: 11,
                            style: 'normal',
                            lineHeight: 2
                        },
                    }
                },
            },
        },
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
<!-- Github buttons -->
<script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/resources/js/argon-dashboard.min.js?v=2.0.4"></script>


</body>