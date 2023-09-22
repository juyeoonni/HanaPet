<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="top-box" class="container mt-3">
    <div>
        <%=guest_name%>님
    </div>
    <div class="info-text2 mt-3">
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
                var iszero = false;
                var infoText = "총 " + petsData.length + "마리의 반려견과 함께 총 ";

                petsData.forEach(function (pet) {
                    var pet_id = pet.pet_id;
                    var accordionItem = $("<div>").addClass("accordion-item");
                    var accordionHeader = $("<h2>").addClass("accordion-header");
                    var imageElement = $('<img style="width: 60px; height:60px; border-radius: 50%">').attr('src', 'resources/img/dog' + pet.pet_id + '.jpg').addClass('petimg');
                    var accordionButton = $('<button class="accordion-button" style="padding:15px;" type="button" data-bs-toggle="collapse" data-bs-target="#accordionItem' + pet.pet_id + '" aria-expanded="false" aria-controls="accordionItem' + pet.pet_id + '">')
                        .html('<div class="button-content" style="display: flex; justify-content: space-between; align-items: center; width: 90%">'
                            + '<div class="left">'
                            + '<span class="petimg">' + imageElement.prop('outerHTML') + '</span>'
                            + '<span class="petname">' + pet.name + '</span>'
                            + '</div>'
                            + '<div class="smallsize" id="total-' + pet.pet_id + '">'
                            + '</div>'
                            + '<div class="right">'
                            + '<div>' + pet.gender + '|' + pet.age + '살 ' + pet.breed + '</div>'
                            + '<div id="petAccountCnt' + pet_id + '"></div>'
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
                            // Handle the case when there are no insurance records for this pet
                            var noInsuranceInfo = $("<div>").text("보험이 없습니다.");
                            iszero = true;
                            accordionBody.append(noInsuranceInfo);
                            $("#petAccountCnt" + pet_id).text("보험이 없음");
                        } else {
                            insuranceData.forEach(function (insurance) {
                                var in_name = $("<div>").text("보험명: " + insurance.insuranceName);
                                var in_count = $("<div>").text("납입 횟수: " + insurance.paymentCount);
                                var in_amount = $("<div>").text("납입액: " + insurance.insuranceAmount);
                                accordionBody.append(in_name);
                                accordionBody.append(in_count);
                                accordionBody.append(in_amount);
                            });
                            $("#petAccountCnt" + pet_id).text(insuranceData.length + "개의 보험 보유");
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

// Update the info text once all AJAX requests are complete
                $.when.apply($, promises2, iszero).then(function () {
                    if (iszero) {
                        infoText = "가입된 보험이 없습니다.\n 추천 보험 보러가기";
                    } else {
                        infoText += promises2.length + "개의 보험에 가입되어 있습니다.";
                    }
                    var infoTextElement = document.querySelector(".info-text2");
                    infoTextElement.textContent = infoText;
                });

            }
        });
    });
</script>
