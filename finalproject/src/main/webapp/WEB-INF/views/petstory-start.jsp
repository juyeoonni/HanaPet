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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>

<body>
<%@ include file="include/header.jsp" %>
<div class="body">
    <div class="container">
        <div class="row" id="pets-container">
            <!-- 여기에 pet 정보를 동적으로 추가할 예정 -->
        </div>
    </div>
</div>

<%
    String guest_id = (String) session.getAttribute("guest_id");
    // 여기서 필요한 세션값과 변수들을 설정하세요
%>

<script>
    $(document).ready(function () {
        var guest_id = '<%= guest_id %>';

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

                var petsContainer = $("#pets-container");

                var numRows = Math.ceil(petsData.length / 2);

                for (var i = 0; i < numRows; i++) {
                    var rowDiv = $("<div class='row'></div>");

                    for (var j = i * 2; j < Math.min((i + 1) * 2, petsData.length); j++) {
                        var pet = petsData[j];
                        var petCard = $("<div class='col-md-6 mb-4 animate__animated animate__fadeInUp slow 3s' style='text-align: center;'></div>");

                        var petImage = $("<img class='img-fluid rounded-circle' alt='" + pet.name + "' src='../../../resources/img/" + pet.image + "'>");
                        petImage.css("width", "500px");
                        petImage.css("height", "500px");
                        petImage.css("object-fit", "cover");
                        petImage.css("border-radius", "50%");

                        var petName = $("<h3 style='text-align: center;'>" + pet.name + "</h3>");

                        // 클릭 이벤트 핸들러 추가
                        petCard.click(function(petInfo) {
                            return function() {
                                window.location.href = "/petstory.jsp?id=" + encodeURIComponent(petInfo.pet_id);
                            };
                        }(pet));

                        petCard.append(petImage);
                        petCard.append(petName);

                        rowDiv.append(petCard);
                    }

                    if (i === numRows - 1 && petsData.length % 2 !== 0) {
                        var centerRow = $("<div class='row justify-content-center'></div>");

                        var lastPet = petsData[petsData.length - 1];
                        var lastPetCard = $("<div class='col-md-6 mb-4 animate__animated animate__fadeInUp slow 3s' style='text-align: center;'></div>");


                        var lastPetImage = $("<img class='img-fluid rounded-circle' alt='" + lastPet.name + "' src='../../../resources/img/" + lastPet.image + "'>");
                        lastPetImage.css("width", "500px");
                        lastPetImage.css("height", "500px");
                        lastPetImage.css("object-fit", "cover");
                        lastPetImage.css("border-radius", "50%");

                        var lastPetName = $("<h3 style='text-align: center;'>" + pet.name + "</h3>");

                        // 클릭 이벤트 핸들러 추가
                        lastPetCard.click(function(petInfo) {
                            return function() {
                                window.location.href = "/petstory.jsp?id=" + encodeURIComponent(petInfo.pet_id);
                            };
                        }(lastPet));

                        lastPetCard.append(lastPetImage);
                        lastPetCard.append(lastPetName);

                        centerRow.append(lastPetCard);
                        petsContainer.append(centerRow);
                    } else {
                        petsContainer.append(rowDiv);
                    }
                }

                console.log("All Ajax requests completed.");
            },
            error: function () {
                console.log("Error fetching pets data.");
            }
        });
    });

</script>


</body>
</html>
