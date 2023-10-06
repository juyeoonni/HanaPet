<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calendar</title>
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/calendar.css">
    <script src="/resources/javascript/apiKey.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
            integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH"
            crossorigin="anonymous"></script>
    <script>
        Kakao.init(config.KAKAO_JAVASCRIPT_KEY); // 사용하려는 앱의 JavaScript 키 입력
    </script>
    <style>
        .blur-background {

            pointer-events: none; /* 배경에 마우스 이벤트를 비활성화하여 모달 위의 요소에만 이벤트가 전달되도록 합니다. */
        }

        .header-container {
            padding: 12.5px 12px 0px 12px !important;
        }

        /* 모달 열릴 때 body를 흐리게 함 */
        body.modal-open {
            overflow: hidden; /* 스크롤을 숨김 */
        }

        #closeModalButton {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 20px;
            color: #555;
        }

        #modalTitle {
            font-size: 23px;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 16px;
            margin-bottom: 8px;
            display: block;
        }

        .form-select,
        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .form-submit {
            background-color: #F2D8DD;
            color: #fff;
            font-size: 18px;
            padding: 10px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-submit:hover {
            box-shadow: 2px 2px 10px #a5a5a5;
            transform: scale(1.03);
        }

        .date-inputs {
            display: flex;
            justify-content: space-between;
        }

        .date-inputs input {
            width: 235px;
        }
    </style>
</head>
<body>
<jsp:include page="include/header.jsp"/>

<div class="title" style="font-weight: bold">펫 캘린더</div>

<div style="text-align: end;padding-right: 200px;">

    <span style="font-size: 14px; margin-right: 225px;">* 반려견을 같이 키우는 가족들의 펫 캘린더에 자동으로 공유됩니다.</span>
    <span>
        <button id="openModalButton" style="margin-top: 20px; margin-bottom: 20px">+ 일정 추가</button>
    </span>
</div>
<div class="calendar">
    <div class="calendar-left">
        <div class="calendar-header">
            <button class="btn btn-prev" onclick="prevMonth()"><</button>
            <div id="currentMonth"></div>
            <button class="btn btn-next" onclick="nextMonth()"> ></button>
        </div>
        <div class="calendar-days">
            <div class="day">Sun</div>
            <div class="day">Mon</div>
            <div class="day">Tue</div>
            <div class="day">Wed</div>
            <div class="day">Thu</div>
            <div class="day">Fri</div>
            <div class="day">Sat</div>
        </div>
        <div class="calendar-dates" id="calendarDatesContainer">
        </div>
    </div>
    <div class="calendar-right">
        <div class="form-container">
            <div id="calendar-title">일정🗓️️</div>
            <hr>
            <form id="eventForm">
                <div class="form-group">
                    <span class="events" id="eventDate"></span>
                </div>
            </form>
            <div id="eventsListContainer">
                <!-- Display events for the selected date here -->
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="include/footer.jsp" %>
<!-- 모달 창 -->
<div class="modal">
    <div class="modal_body">
        <div style="text-align: end">
            <button id="closeModalButton">×</button>
        </div>
        <div id="modalTitle">일정을 입력하세요</div>
        <div>
            <label class="form-label" for="petSelection">반려견</label>
            <select class="form-select" id="petSelection">
            </select>
        </div>
        <div class="date-inputs">
            <div>
                <label class="form-label">시작 날짜</label>
                <input autocomplete="off" type="date" class="form-control" id="calendar_start_date"
                       name="calendar_start_date">
            </div>
            <div>
                <label class="form-label">마감 날짜</label>
                <input autocomplete="off" type="date" class="form-control" id="calendar_end_date"
                       name="calendar_end_date">
            </div>
        </div>
        <div>
            <label class="form-label">일정 내용</label>
            <input style="width: 510px; height: 50px" autocomplete="off" type="text" class="form-control"
                   id="eventDescription"
                   name="eventDescription">
        </div>

        <div style="text-align: center">
            <button class="form-submit" type="button" id="addEventButton">일정 등록</button>
        </div>
    </div>
</div>

<script>
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
        modal.style.display = 'block';
    });
</script>
<script>
    const startDateInput = document.getElementById("calendar_start_date");
    const endDateInput = document.getElementById("calendar_end_date");

    startDateInput.addEventListener("input", function () {
        if (!endDateInput.value) {
            endDateInput.value = this.value;
        }

        endDateInput.min = this.value;
    });

    endDateInput.addEventListener("input", function () {
        startDateInput.max = this.value;
    });

    const closeModalButton = document.getElementById("closeModalButton");
    const modalContainer = document.getElementById("modalContainer");

</script>
<%
    String guest_id = (String) session.getAttribute("guest_id");
    String access_token = (String) session.getAttribute("accessToken");
    // 여기서 필요한 세션값과 변수들을 설정하세요
%>
<script>
    // Initialize the current date
    const currentDate = new Date();
    const petImg = {};

    // Function to get the days in a month
    function getDaysInMonth(month, year) {
        const daysInMonth = new Date(year, month + 1, 0).getDate();
        const daysArray = [];
        const today = new Date(); // 현재 날짜를 가져옴

        for (let i = 1; i <= daysInMonth; i++) {
            const date = {date: i, events: []};

            // Check if the date is today
            if (
                year === today.getFullYear() &&
                month === today.getMonth() &&
                i === today.getDate()
            ) {
                date.today = true; // 오늘 날짜인 경우 표시하기 위해 플래그 설정
            }

            daysArray.push(date);
        }

        return daysArray;
    }

    // Function to render the calendar
    function renderCalendar(month) {
        currentDate.setMonth(month);
        const months = currentDate.getMonth() + 1;
        const petOptions = Array.from(document.getElementById("petSelection").options);
        const petIds = petOptions.map(option => option.value);
        for (const petId of petIds) {
            fetchMonthEvents(currentDate.getFullYear() % 100, months < 10 ? "0" + months : "" + months, petId);
        }

        const calendarDatesContainer = document.getElementById("calendarDatesContainer");
        calendarDatesContainer.innerHTML = "";

        document.getElementById("currentMonth").innerText = currentDate.toLocaleString('default', {
            month: 'long',
            year: 'numeric'
        });

        const daysInMonth = getDaysInMonth(currentDate.getMonth(), currentDate.getFullYear());

        for (let i = 0; i < daysInMonth.length; i++) {
            const date = daysInMonth[i];
            const dateElement = document.createElement("div");
            dateElement.className = "date";

            if (date.today) {
                dateElement.classList.add("today"); // 오늘 날짜라면 .today 클래스 추가
            }

            dateElement.dataset.date = date.date; // Add a custom attribute to store the date

            const dateText = document.createElement("span");
            dateText.innerText = date.date;
            dateElement.appendChild(dateText);

            const eventsList = document.createElement("ul");
            eventsList.className = "events";
            date.events.forEach(function (event) {
                const eventItem = document.createElement("li");
                eventItem.innerText = event;
                eventsList.appendChild(eventItem);
            });
            dateElement.appendChild(eventsList);
            calendarDatesContainer.appendChild(dateElement);
        }
    }

    // Function to go to the previous month
    function prevMonth() {
        renderCalendar(currentDate.getMonth() - 1);
    }

    // Function to go to the next month
    function nextMonth() {
        renderCalendar(currentDate.getMonth() + 1);
    }

    const calendarRight = document.querySelector(".calendar-right");
    const calendarLeft = document.querySelector(".calendar-left");

    // 일정을 표시하고 오른쪽 패널을 보여주는 함수
    function showEventPanel() {
        calendarRight.style.transform = "translateX(-70%)";
        calendarLeft.style.flex = "0.7";
        calendarRight.style.flex = "0.3";
        calendarRight.style.visibility = "visible"
    }

    // 오른쪽 패널을 다시 숨기는 함수
    function hideEventPanel() {
        calendarRight.style.transform = "translateX(-160%)"; // 처음 숨겨진 위치로 이동
        // flex 속성을 부드럽게 변경하여 커지는 효과 생성
        calendarLeft.style.transition = "flex 0.5s ease"; // 0.3초 동안 ease 가속도로 flex 변화
        calendarLeft.style.flex = "1";
        setTimeout(function () {
            calendarRight.style.transition = ""; // transition 속성 제거
            calendarRight.style.visibility = "hidden";
        }, 500); // 애니메이션 시간과 동일한 시간으로 설정 (0.5초)
    }

    // Attach event listeners to date elements for adding events
    document.getElementById("calendarDatesContainer").addEventListener("click", function (event) {
        const target = event.target;
        if (target.classList.contains("date")) {
            const selectedDate = document.querySelector(".date.selected");
            if (selectedDate) {
                selectedDate.classList.remove("selected");
            }

            target.classList.add("selected");

            const date = target.dataset.date;

            // Get the year and month from the clicked date
            const clickedYear = currentDate.getFullYear() % 100; // 연도 뒤 2글자만 가져옴
            const clickedMonth = currentDate.getMonth() + 1; // 월 (0부터 시작하므로 +1)
            // Format the clicked date in "yy/MM/dd" format
            const formattedClickedDate = clickedYear + "/" + (clickedMonth < 10 ? "0" + clickedMonth : clickedMonth) + "/" + (date < 10 ? "0" + date : date);

            const eventForm = document.getElementById("eventForm");
            eventForm.dataset.date = date;

            const eventDateInput = document.getElementById("eventDate");
            eventDateInput.textContent = currentDate.toLocaleString('default', {
                month: 'long',
                year: 'numeric'
            }) + " " + date + "일";

            fetchAllPetDayEvents(formattedClickedDate, petIds);
        }
    });

    // Function to fetch events for all pets and display in the right panel
    function fetchAllPetDayEvents(eventDate, petIds) {
        const allPetEvents = {};

        petIds.forEach(petId => {
            fetchDayEvents(eventDate, petId, function (events) {
                allPetEvents[petId] = events;
                if (Object.keys(allPetEvents).length === petIds.length) {
                    displayAllPetEvents(allPetEvents);
                }
            });
        });
    }

    // Function to fetch month events from the server
    function fetchMonthEvents(year, month, pet_id) {
        // Make an API request to fetch month events for the selected pet
        $.ajax({
            url: "/monthcalendars",
            type: "GET",
            data: {
                month: year + "/" + month,
                pet_id: parseInt(pet_id)
            },
            dataType: "json",
            success: function (data) {
                markDatesWithEvents(data);
            },
            error: function () {
                console.log("Error fetching month events.");
            }
        });
    }

    function fetchTransferEvents(year, month, pet_id) {
        // Make an API request to fetch month events for the selected pet
        $.ajax({
            url: "/monthcalendars",
            type: "GET",
            data: {
                month: year + "/" + month,
                pet_id: parseInt(pet_id)
            },
            dataType: "json",
            success: function (data) {
                markDatesWithEvents(data);
            },
            error: function () {
                console.log("Error fetching month events.");
            }
        });
    }

    // Function to mark dates with events
    function markDatesWithEvents(data) {
        const calendarDatesContainer = document.getElementById("calendarDatesContainer");
        const dateElements = calendarDatesContainer.querySelectorAll(".date");

        data.forEach((item, index) => {
            const eventDate = new Date(item.event_date);
            const day = eventDate.getDate();
            const petImage = petImg[item.pet_id][0];

            dateElements.forEach(dateElement => {
                const date = dateElement.dataset.date;
                if (date == day) {
                    const img = createImage(petImage, 40);
                    dateElement.appendChild(img);
                }
            });
        });
    }

    function createImage(imgUrl, radius) {
        const img = document.createElement("img");
        img.src = "/resources/img/" + imgUrl;
        img.width = radius;
        img.height = radius;

        img.style.filter = "drop-shadow(0px 2px 10px rgba(0, 0, 0, 0.25))";
        img.style.borderRadius = "50%";
        img.style.clipPath = "circle(50% at 50% 50%)";

        return img;
    }

    // Handle event form submission
    document.getElementById("addEventButton").addEventListener("click", function () {
        const startDateInput = document.getElementById("calendar_start_date").value;
        const endDateInput = document.getElementById("calendar_end_date").value;
        const startDate = new Date(startDateInput);
        const endDate = new Date(endDateInput);
        const petId = parseInt(document.getElementById("petSelection").value, 6);
        const eventDescription = document.getElementById("eventDescription").value;

        // Loop through each date between startDate and endDate
        let currentDate = new Date(startDate);
        while (currentDate <= endDate) {
            const formattedDate = formatDateForDatabase(currentDate);
            sendEventToServer(formattedDate, petId, eventDescription);
            // Move to the next day
            currentDate.setDate(currentDate.getDate() + 1);
        }

        function sendEventToServer(eventDate, petId, eventDescription) {
            $.ajax({
                url: "/insertcalendar",
                type: "POST",
                data: JSON.stringify({
                    event_date: eventDate,
                    pet_id: petId,
                    content: eventDescription
                }),
                contentType: 'application/json',
                success: function (response) {
                    if (response === "insert 성공") {
                        document.getElementById("petSelection").selectedIndex = 0;
                        document.getElementById("calendar_start_date").value = "";
                        document.getElementById("calendar_end_date").value = "";
                        document.getElementById("eventDescription").value = "";
                        sendKakaoTalkMessage();
                        console.log("insert 성공");
                        modal.style.display = "none";
                        renderCalendar(currentDate.getMonth());
                    } else {
                        // 로그인 실패 시 처리
                        console.error("insert 실패");
                    }
                },
                error: function () {
                    console.log("Error adding event.");
                }
            });
        }
    });

    // Function to format date for database storage
    function formatDateForDatabase(date) {
        let year = date.getFullYear() % 100; // 뒤 두 자리 연도 값
        let month = date.getMonth() + 1; // getMonth()는 0부터 시작하므로 +1
        let day = date.getDate();

        if (year < 10) year = "0" + year;
        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;

        return year + "/" + month + "/" + day;
    }

    // Function to display events for all pets in the right panel
    function displayAllPetEvents(allPetEvents) {
        const eventsListContainer = document.getElementById("eventsListContainer");
        eventsListContainer.innerHTML = "";
        let check = true;
        for (const petId in allPetEvents) {
            const petEvents = allPetEvents[petId];
            if (petEvents.length > 0) {
                check = false;

                const petInfoDiv = document.createElement("div");
                petInfoDiv.style.display = "flex"; // flex 레이아웃 사용
                petInfoDiv.style.alignItems = "center"; // 수직 가운데 정렬
                petInfoDiv.style.gap = "10px"; // 아이템 사이의 간격 설정

                const petIdItem = document.createElement("p");
                petIdItem.innerText = petImg[petId][1]; // 이름
                petIdItem.style.fontSize = "26px";
                petInfoDiv.appendChild(petIdItem);

                const petImgItem = createImage(petImg[petId][0], 50)
                petInfoDiv.appendChild(petImgItem);
                eventsListContainer.appendChild(petInfoDiv);

                // <ul> 엘리먼트를 생성하여 이벤트 목록 추가
                const eventsList = document.createElement("ul");
                petEvents.forEach(event => {
                    const eventItem = document.createElement("li");
                    eventItem.innerText = event.content;
                    eventsList.appendChild(eventItem);
                });
                eventsListContainer.appendChild(eventsList);

            }
            showEventPanel();
        }
        if (check) {
            hideEventPanel();
        }
    }

    // Function to fetch day events from the server and populate eventsListContainer
    function fetchDayEvents(eventDate, petId, callback) {
        // Make an AJAX request to fetch day events for the selected date and pet
        $.ajax({
            url: "/daycalendars",
            type: "GET",
            data: {
                event_date: eventDate,
                pet_id: petId
            },
            dataType: "json",
            success: function (data) {
                callback(data);
            },
            error: function () {
                console.log("Error fetching day events.");
            }
        });
    }

    // 모달 열기 버튼 클릭 시
    document.getElementById("openModalButton").addEventListener("click", function () {
        modal.style.display = 'block';
    });

    // 모달 닫기 버튼 클릭 시 또는 모달 외부 클릭 시
    document.getElementById("closeModalButton").addEventListener("click", function () {
        modal.style.display = "none";
    });

    $(document).ready(function () {
        const guest_id = '<%= guest_id %>';

        $.ajax({
            url: "/pets",
            type: "GET",
            data: {
                guest_id: guest_id
            },
            dataType: "json",
            success: function (data) {
                const petSelection = document.getElementById('petSelection');
                data.forEach(function (pet) {
                    const option = document.createElement('option');
                    option.value = pet.pet_id; // 이 부분을 pet의 pet_id로 설정
                    option.textContent = pet.name;
                    petSelection.appendChild(option);

                    const petOptions = Array.from(document.getElementById("petSelection").options);
                    petIds = petOptions.map(option => option.value);

                    petImg[pet.pet_id] = [pet.image, pet.name];

                    const month = currentDate.getMonth() + 1;
                    fetchMonthEvents(currentDate.getFullYear() % 100, month < 10 ? "0" + month : "" + month, option.value);
                });
            },
            error: function () {
                console.log("Error fetching pets data.");
            }
        });
        renderCalendar(currentDate.getMonth());
    });

    // KakaoTalk 메시지 보내기 함수
    function sendKakaoTalkMessage() {
        //
        // Kakao.API.request({
        //     url: '/v1/api/talk/friends',
        // })
        //     .then(function (response) {
        //         console.log(response);
        //     })
        //     .catch(function (error) {
        //         console.log(error);
        //     });
        //

        // 메시지 받을 친구의 UUID
        const receiverUuid = "VmNRZF1uWmNQfE1_Tn5GcUB4TGBRYVJrXj4";
        const access_token = 'Bearer ' + '<%= access_token %>';

        console.log("토큰" + access_token)

        // 캘린더 메시지 템플릿 데이터 설정
        const messageTemplate = {
            object_type: "calendar",
            content: {
                title: "일정 제목",
                description: "일정 설명",
                image_url: "https://이미지URL.com/calendar.png",
                link: {
                    web_url: "http://localhost:8080/", // 웹 URL
                    mobile_web_url: "http://localhost:8080/", // 모바일 웹 URL
                },
            },
            buttons: [
                {
                    title: "일정 정보 보기",
                    link: {
                        web_url: "http://localhost:8080/", // 일정 정보 웹 페이지 URL
                        mobile_web_url: "http://localhost:8080/", // 모바일 일정 정보 웹 페이지 URL
                    },
                },
            ],
            id_type: "event",
            id: "일정 고유 ID",
        };

        // KakaoTalk 메시지 전송 요청
        Kakao.API.request({
            url: "/v1/api/talk/friends/message/default/send",
            data: {
                receiver_uuids: [receiverUuid],
                template_object: messageTemplate
            }
        })
            .then(function (response) {
                console.log("카카오톡 메시지 전송 성공:", response);
                // 여기에 성공 시 실행할 코드를 추가하세요.
            })
            .catch(function (error) {
                console.error("카카오톡 메시지 전송 오류:", error);
                // 여기에 오류 시 실행할 코드를 추가하세요.
            });
    }
</script>

</html>
