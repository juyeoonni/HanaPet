<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calendar</title>
    <style>
        /* Reset some default styles */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        /* Main container for the calendar */
        .calendar {
            display: flex;
            position: relative;
            padding: 60px 200px 100px 200px;
            background-color: #fff;
            border-radius: 6px;
            overflow: hidden;
        }

        /* .calendar-left 스타일링 추가 */
        .calendar-left {
            flex: 1;
            position: relative;
            background-color: white;
            transition: transform 0.5s ease;
            z-index: 2; /* calendar-right 앞에 위치하도록 설정 */
        }

        /* .calendar-right 스타일링 추가 */
        .calendar-right {
            flex: 1;
            visibility: hidden;
            position: absolute;
            top: 100px;
            right: 0;
            transform: translateX(-160%); /* 처음에 calendar-left 아래로 숨겨짐 */
            transition: transform 0.5s ease;
            z-index: 1; /* calendar-left 뒤에 위치하도록 설정 */
        }

        /* Calendar header with Previous, Month Name, and Next buttons */
        .calendar-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        /* Days of the week */
        .calendar-days {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: #999;
            font-size: 14px;
        }

        /* Individual day of the week */
        .day {
            flex-basis: calc(100% / 7);
            text-align: center;
        }

        /* Container for dates */
        .calendar-dates {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 5px;
        }

        /* Style for the event dot */
        .event-dot {
            display: inline-block;
            width: 6px;
            height: 6px;
            background-color: #4CAF50; /* You can change the color to your preference */
            border-radius: 50%;
            margin-left: 2px;
            margin-right: 2px;
        }


        /* Individual date */
        .date {
            background-color: #fff;
            padding: 10px;
            border-radius: 4px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        /* Highlight date on hover */
        .date:hover {
            background-color: #f2f2f2;
        }

        /* Highlight present day */
        .present {
            background-color: #59a6f5;
            color: #fff;
        }

        /* Highlight today's date */
        .date.today {
            background-color: #4CAF50;
            color: #fff;
        }

        /* Highlight selected date with a border */
        .date.selected {
            background-color: #f2f2f2;
        }

        /* Form container */
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        /* Form group */
        .form-group {
            margin-bottom: 15px;
        }

        /* Form label */
        .form-label {
            font-weight: bold;
        }

        /* Form input */
        .form-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Form select */
        .form-select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Form submit button */
        .form-submit {
            background-color: #59a6f5;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: #fff;
            width: 50%;
            max-width: 600px;
            margin: auto;
            padding: 20px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
        }

        #openModalButton {
            margin-top: 20px;
        }


    </style>
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="calendar">
    <div class="calendar-left">
        <div class="calendar-header">
            <button class="btn btn-prev" onclick="prevMonth()">Previous</button>
            <h1 id="currentMonth"></h1>
            <button class="btn btn-next" onclick="nextMonth()">Next</button>
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
        <div>
            <button id="openModalButton">일정 추가</button>

            <!-- 모달 창 -->
            <div class="modal" id="myModal">
                <div class="modal-content">
                    <%@ include file="include/modal.jsp" %>
                    <button id="closeModalButton">Close</button>
                    <button class="form-submit" type="button" id="addEventButton">일정 등록</button>
                </div>
            </div>
        </div>
    </div>
    <div class="calendar-right">
        <div class="form-container">
            <h2>일정</h2>
            <form id="eventForm">
                <div class="form-group">
                    <span class="form-text" id="eventDate"></span>
                </div>
            </form>
            <div id="eventsListContainer">
                <!-- Display events for the selected date here -->
            </div>


        </div>
    </div>
</div>

<%
    String guest_id = (String) session.getAttribute("guest_id");
    // 여기서 필요한 세션값과 변수들을 설정하세요
%>

<script>
    // Initialize the current date
    var currentDate = new Date();

    // Function to get the days in a month
    function getDaysInMonth(month, year) {
        var daysInMonth = new Date(year, month + 1, 0).getDate();
        var daysArray = [];
        var today = new Date(); // 현재 날짜를 가져옴

        for (var i = 1; i <= daysInMonth; i++) {
            var date = {date: i, events: []};

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
    function renderCalendar(monthOffset) {
        currentDate.setMonth(currentDate.getMonth() + monthOffset);
        var calendarDatesContainer = document.getElementById("calendarDatesContainer");
        calendarDatesContainer.innerHTML = "";

        var currentMonth = currentDate.toLocaleString('default', {month: 'long', year: 'numeric'});
        document.getElementById("currentMonth").innerText = currentMonth;

        var daysInMonth = getDaysInMonth(currentDate.getMonth(), currentDate.getFullYear());

        for (var i = 0; i < daysInMonth.length; i++) {
            var date = daysInMonth[i];
            var dateElement = document.createElement("div");
            dateElement.className = "date";

            if (date.today) {
                dateElement.classList.add("today"); // 오늘 날짜라면 .today 클래스 추가
            }

            dateElement.dataset.date = date.date; // Add a custom attribute to store the date

            var dateText = document.createElement("span");
            dateText.innerText = date.date;
            dateElement.appendChild(dateText);

            var eventsList = document.createElement("ul");
            eventsList.className = "events";
            date.events.forEach(function (event) {
                var eventItem = document.createElement("li");
                eventItem.innerText = event;
                eventsList.appendChild(eventItem);
            });
            dateElement.appendChild(eventsList);

            calendarDatesContainer.appendChild(dateElement);
        }
    }

    // Function to go to the previous month
    function prevMonth() {
        renderCalendar(-1);
    }

    // Function to go to the next month
    function nextMonth() {
        renderCalendar(1);
    }

    // 일정을 표시하고 오른쪽 패널을 보여주는 함수
    function showEventPanel() {
        const calendarRight = document.querySelector(".calendar-right");
        const calendarLeft = document.querySelector(".calendar-left");

        calendarRight.style.transform = "translateX(-130%)";
        calendarLeft.style.flex = "0.7";
        calendarRight.style.flex = "0.3";
        calendarRight.style.visibility = "visible"
    }

    // 오른쪽 패널을 다시 숨기는 함수
    function hideEventPanel() {
        const calendarRight = document.querySelector(".calendar-right");
        const calendarLeft = document.querySelector(".calendar-left");

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
        var target = event.target;
        if (target.classList.contains("date")) {
            var selectedDate = document.querySelector(".date.selected");
            if (selectedDate) {
                selectedDate.classList.remove("selected");
            }

            target.classList.add("selected");

            var date = target.dataset.date;

            // Get the year and month from the clicked date
            var clickedYear = currentDate.getFullYear() % 100; // 연도 뒤 2글자만 가져옴
            var clickedMonth = currentDate.getMonth() + 1; // 월 (0부터 시작하므로 +1)
            // Format the clicked date in "yy/MM/dd" format
            var formattedClickedDate = clickedYear + "/" + (clickedMonth < 10 ? "0" + clickedMonth : clickedMonth) + "/" + (date < 10 ? "0" + date : date);

            var eventForm = document.getElementById("eventForm");
            eventForm.dataset.date = date;

            var eventDateInput = document.getElementById("eventDate");
            eventDateInput.textContent = currentDate.toLocaleString('default', {
                month: 'long',
                year: 'numeric'
            }) + " " + date + "일";

            const petIds = Array.from(document.getElementById("petSelection").options).map(option => option.value);

            // Fetch events for all pets and display in the right panel
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

    $(document).ready(function () {
        var guest_id = '<%= guest_id %>';

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

                    var month = currentDate.getMonth() + 1;
                    fetchMonthEvents(currentDate.getFullYear() % 100, month < 10 ? "0" + month : "" + month, option.value);
                });
            },
            error: function () {
                console.log("Error fetching pets data.");
            }
        });
    });

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

    // Function to mark dates with events
    function markDatesWithEvents(data) {
        const calendarDatesContainer = document.getElementById("calendarDatesContainer");
        const dateElements = calendarDatesContainer.querySelectorAll(".date");

        data.forEach((item, index) => {
            const eventDate = new Date(item.event_date);
            const day = eventDate.getDate();
            const petId = item.pet_id;

            const colorsByPet = {
                1: "red",   // Example color for pet_id 1
                2: "green"  // Example color for pet_id 2
                // Add more pet_id to color mappings as needed
            };

            const color = colorsByPet[petId] || "blue"; // Default color if pet_id not found

            dateElements.forEach(dateElement => {
                const date = dateElement.dataset.date;
                if (date == day) {
                    const dot = createDot(color); // Pass the color to createDot function
                    dateElement.appendChild(dot);
                }
            });
        });
    }

    // Function to create a dot element with a specified color
    function createDot(color) {
        const dot = document.createElement("span");
        dot.className = "event-dot";
        dot.style.backgroundColor = color; // Set the background color of the dot
        return dot;
    }

    // Handle event form submission
    document.getElementById("addEventButton").addEventListener("click", function () {
        const startDateInput = document.getElementById("calendar_start_date").value;
        const endDateInput = document.getElementById("calendar_end_date").value;
        const startDate = new Date(startDateInput);
        const endDate = new Date(endDateInput);
        var petId = parseInt(document.getElementById("petSelection").value, 6);
        var eventDescription = document.getElementById("eventDescription").value;

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
                        var leftCalendarDate = document.querySelector(".date.selected");
                        if (leftCalendarDate && leftCalendarDate.dataset.date === date) {
                            leftCalendarDate.events.push(eventDescription);
                            var eventsList = leftCalendarDate.querySelector(".events");
                            var eventItem = document.createElement("li");
                            eventItem.innerText = eventDescription;
                            eventsList.appendChild(eventItem);
                        }
                        // Clear the form and re-render the calendar
                        document.getElementById("eventDescription").value = "";
                        console.error("insert 성공");
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
        var year = date.getFullYear() % 100; // 뒤 두 자리 연도 값
        var month = date.getMonth() + 1; // getMonth()는 0부터 시작하므로 +1
        var day = date.getDate();

        if (year < 10) year = "0" + year;
        if (month < 10) month = "0" + month;
        if (day < 10) day = "0" + day;

        return year + "/" + month + "/" + day;
    }

    // Function to display events for all pets in the right panel
    function displayAllPetEvents(allPetEvents) {
        const eventsListContainer = document.getElementById("eventsListContainer");
        eventsListContainer.innerHTML = "";
        var check = true;
        for (const petId in allPetEvents) {
            const petEvents = allPetEvents[petId];
            if (petEvents.length > 0) {
                check = false;
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

    // 열기 버튼 클릭 시 모달 창 표시
    document.getElementById("openModalButton").addEventListener("click", function () {
        const modal = document.getElementById("myModal");
        modal.style.display = "block";
    });

    // 닫기 버튼 클릭 시 모달 창 숨김
    document.getElementById("closeModalButton").addEventListener("click", function () {
        const modal = document.getElementById("myModal");
        modal.style.display = "none";
    });

    renderCalendar(0);
</script>
</body>
</html>
