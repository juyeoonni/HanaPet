<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .downloadbtn {
        font-size: 25px;
        font-width: bold;
    }

    .insu-container {
        padding: 20px 40px;
        border-bottom: 2px solid #E1E6DE !important;
    }

    .accordion-collapse .insu-container:last-child {
        border-bottom: none !important;
    }

</style>
<div style="display:flex;">
    <div id="top-box">
        <div class="guest">
            <img src="/resources/img/logo-one.png" width="40px"/> <%=guest_name%>님
        </div>
        <div class="info-text2 mt-3">
        </div>

    </div>
    <div id="top-box2">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title" style="padding-bottom: 5px"><b>자산 한눈에 보기</b></h5>
                    <div class="table-responsive">
                        <table class="table table-striped" style="margin-bottom: 0px">
                            <tbody>
                            <tr>
                                <td>
                                    반려견 적금
                                </td>
                                <td id="jk2">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    반려견 보험
                                </td>
                                <td>
                                    -
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    내 계좌
                                </td>
                                <td id="ma2">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="accordion" id="accordion">
</div>

<script>
    $(document).ready(function () {
        var guest_id = '<%= guest_id %>'; // Java 값을 JavaScript 변수로 전달
        $.ajax({
            url: "/pets",
            type: "GET",
            data: {
                guest_id: guest_id
            },
            dataType: "json",
            success: function (petsData) {
                var promises2 = [];
                var iszero = false; // 보험이 하나도 없는 경우를 위한 flag
                var infoText = "총 " + petsData.length + "마리의 반려견과 함께 총 ";
                var cnt = 0; // 보험이 없는 개수

                petsData.forEach(function (pet) {
                    var gender = pet.gender == 'M' ? '남' : '여';
                    var pet_id = pet.pet_id;
                    var accordionItem = $("<div>").addClass("accordion-item");
                    var accordionHeader = $("<h2>").addClass("accordion-header");
                    var imageElement = $('<img style="width: 60px; height:60px; border-radius: 50%">').attr('src', 'resources/img/dog' + pet.pet_id + '.jpg').addClass('petimg');
                    var accordionButton = $('<button class="accordion-button" style="padding:15px 40px;" type="button" data-bs-toggle="collapse" data-bs-target="#accordionItem' + pet.pet_id + '" aria-expanded="false" aria-controls="accordionItem' + pet.pet_id + '">')
                        .html('<div class="button-content" style="display: flex; justify-content: space-between; align-items: center; width: 90%">'
                            + '<div class="left">'
                            + '<span class="petimg">' + imageElement.prop('outerHTML') + '</span>'
                            + '<span class="petname" style="font-size: 24px; font-weight: bold; margin-left: 20px;">' + pet.name + '</span>'
                            + '</div>'
                            + '<div style="display: flex; align-items: center;"><div style="text-align: end">'
                            + '<div class="smallsize" style=" margin-right: 40px;" id="total-' + pet.pet_id + '">'
                            + '</div> </div>'
                            + '<div class="right" style="margin-right: -40px">'
                            + '<div style="font-size: 20px; font-weight: bold; padding-bottom: 10px; ">' + gender + '|' + pet.age + '살 ' + pet.breed + '</div>'
                            + '<div id="petInsuranceCnt' + pet_id + '"></div>'
                            + '</div>'
                            + '</div>');

                    var accordionCollapse = $("<div>").addClass("accordion-collapse collapse show")
                        .attr("id", "accordionItem" + pet.pet_id);
                    var accordionBody = $("<div>").addClass("accordion-body");

                    var insurancePromise = $.ajax({
                        url: "/myinsurances",
                        type: "GET",
                        data: {
                            guest_id: guest_id,
                            pet_id: pet.pet_id
                        },
                        dataType: "json"
                    }).then(function (insuranceData) {
                        if (insuranceData.length === 0) {
                            var noInsuranceInfo = $("<div style='padding: 15px 40px !important;'>").text("보험이 없습니다.");
                            accordionBody.append(noInsuranceInfo);
                            $("#petInsuranceCnt" + pet_id).text("보험 없음");
                        } else {
                            iszero = true;
                            insuranceData.forEach(function (insurance) {
                                cnt++;
                                var container = $('<div style="display: flex; justify-content: space-between;" >').addClass('insu-container');

                                var left = $('<div>').addClass('left');
                                var realRight = $('<div style="display:flex; align-self: end; padding-top: 55px">');
                                var right = $('<div style="display:flex; align-self: end;">').addClass('right');

                                var in_img = $("<img src='/resources/img/insurance-logo.png' width='150px' height='40px' style='margin-bottom: 10px; margin-left: -5px'>");
                                var in_name = $("<div style='font-size: 21px; font-weight: bold; margin-bottom: 10px' >").text(insurance.insuranceName);
                                var in_count = $("<div style='margin-bottom: 7px'>").text("1년 일시납");
                                var in_amount = $("<div style='font-size: 19px; font-weight: bold;' >").text("납입액: " + Number(insurance.insuranceAmount).toLocaleString() + "원");

                                var middle = $("<div style='padding-right: 40px'>");
                                middle.append(in_count, in_amount);

                                left.append(in_img, in_name);

                                var downloadButtonContainer = $("<div>").addClass("downloadbtn");
                                var downloadButton = $("<button style='font-size: 16px'>")
                                    .addClass("downbtn")
                                    .css({
                                        fontSize: "17px",
                                        padding: "5px 10px",
                                        background: "rgb(117, 169, 137)",
                                        color: "white",
                                        border: "3px solid rgb(117, 169, 137)",
                                        borderRadius:
                                            "10px",
                                        padding:
                                            "5px 15px",
                                        width:
                                            "148px",
                                        height: "45px",
                                        cursor:
                                            "pointer",
                                        marginRight: "10px"
                                    })
                                    .text("가입 증명서 다운")
                                    .on("click", function () {
                                        window.open('/signInfoPDF', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes');
                                    });

                                var detailBtn = $("<button style='font-size: 17px; background: rgb(117, 169, 137); color: white; border: 3px solid rgb(117, 169, 137); border-radius: 10px; padding: 5px 15px; width: 130px; height: 45px; cursor: pointer;'>").text("자세히 보기");


                                downloadButtonContainer.append(downloadButton);

                                right.append(downloadButtonContainer);
                                right.append(detailBtn);
                                realRight.append(middle,right);


                                container.append(left);
                                container.append(realRight);
                                accordionBody.append(container);
                            });

                            $("#petInsuranceCnt" + pet_id).text(insuranceData.length + "개의 보험 보유");

                        }
                    }).fail(function () {
                        console.log("Error fetching my insurance data.");
                    });
                    promises2.push(insurancePromise);
                    console.log(iszero)

                    accordionCollapse.append(accordionBody);
                    accordionHeader.append(accordionButton);
                    accordionItem.append(accordionHeader, accordionCollapse);
                    $("#accordion").append(accordionItem);
                });

                $.when.apply($, promises2, iszero, cnt).then(function () {
                    if (!iszero) {
                        infoText = "가입된 보험이 없습니다.\n 추천 보험 보러가기";
                    } else {
                        infoText += cnt + "개의 보험에 가입되어 있습니다.";
                    }
                    var infoTextElement = document.querySelector(".info-text2");
                    infoTextElement.textContent = infoText;
                });
            }
        });
    });
</script>
