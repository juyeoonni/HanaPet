<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPet</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
</head>

<%--<div class="body">--%>
<%--    <div class="title">--%>
<%--        마이 펫<br>--%>
<%--        유림님은 2마리의 반려견과 함께 하고 있어요!--%>
<%--    </div>--%>
<%--    <div class="accordion" id="accordionPanelsStayOpenExample">--%>
<%--        <div class="accordion-item">--%>
<%--            <h2 class="accordion-header">--%>
<%--                <button class="accordion-button" type="button" data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"--%>
<%--                        aria-controls="panelsStayOpen-collapseOne">--%>
<%--                    Accordion Item #1--%>
<%--                </button>--%>
<%--            </h2>--%>
<%--            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">--%>
<%--                <div class="accordion-body">--%>
<%--                    <strong>This is the first item's accordion body.</strong> It is shown by default--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="accordion-item">--%>
<%--            <h2 class="accordion-header">--%>
<%--                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"--%>
<%--                        aria-controls="panelsStayOpen-collapseTwo">--%>
<%--                    Accordion Item #2--%>
<%--                </button>--%>
<%--            </h2>--%>
<%--            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse">--%>
<%--                <div class="accordion-body">--%>
<%--                    <strong>This is the second item's accordion body.</strong> It is hidden by default--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="accordion-item">--%>
<%--            <h2 class="accordion-header">--%>
<%--                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false"--%>
<%--                        aria-controls="panelsStayOpen-collapseThree">--%>
<%--                    Accordion Item #3--%>
<%--                </button>--%>
<%--            </h2>--%>
<%--            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse">--%>
<%--                <div class="accordion-body">--%>
<%--                    <strong>This is the third item's accordion body.</strong> It is hidden by default--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<body>
<%@ include file="include/header.jsp" %>
<div class = "body">
    <div class="accordion" id="accordionPanelsStayOpenExample">
        <!-- Placeholder for the accordion items -->
    </div>
</div>

<%
    String guest_id = (String) session.getAttribute("guest_id");
    // 여기서 필요한 세션값과 변수들을 설정하세요
%>

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
                console.log(guest_id);
                console.log(petsData);
                var promises = [];

                petsData.forEach(function (pet) {
                    var accordionItem = $("<div>").addClass("accordion-item");
                    var accordionHeader = $("<h2>").addClass("accordion-header");
                    var accordionButton = $("<button>").addClass("accordion-button")
                        .attr("type", "button")
                        .attr("data-bs-toggle", "collapse")
                        .attr("data-bs-target", "#accordionItem" + pet.pet_id)
                        .attr("aria-expanded", "false")
                        .attr("aria-controls", "accordionItem" + pet.pet_id)
                        .html('<div class="button-content" style="display: flex; justify-content: space-between; align-items: center; width: 90%">'
                            + '<div class="left">'
                            + '<span class="petimg"></span>'
                            + '<span class="petname">' + pet.name + '</span>'
                            + '</div>'
                            + '<div class="right">'
                            + '<div>' + pet.gender + '|' + pet.month_age + '개월 ' + pet.breed + '</div>'
                            + '<div>3개의 적금 보유</div>'
                            + '</div>'
                            + '</div>');
                    var accordionCollapse = $("<div>").addClass("accordion-collapse collapse show") // 처음에 show로 펼쳐주기
                        .attr("id", "accordionItem" + pet.pet_id);
                    var accordionBody = $("<div>").addClass("accordion-body");

                    var savingAccountPromise = $.ajax({
                        url: "/savingaccounts",
                        type: "GET",
                        data: {
                            opener_id: guest_id,
                            pet_id: pet.pet_id
                        },
                        dataType: "json"
                    }).then(function (savingaccounts) {
                        savingaccounts.forEach(function (account) {
                            var accountInfo = $("<p>").text("Account Number: " + account.account_number + ", Balance: " + account.current_balance);
                            accordionBody.append(accountInfo);
                        });
                    }).fail(function () {
                        console.log("Error fetching savingaccounts data.");
                    });

                    promises.push(savingAccountPromise);

                    accordionCollapse.append(accordionBody);
                    accordionHeader.append(accordionButton);
                    accordionItem.append(accordionHeader, accordionCollapse);

                    $("#accordionPanelsStayOpenExample").append(accordionItem);
                });

                $.when.apply($, promises).then(function () {
                    console.log("All Ajax requests completed.");
                });
            },
            error: function () {
                console.log("Error fetching pets data.");
            }
        });
    });

</script>

</body>
</html>
