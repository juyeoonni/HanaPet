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
            background-color: #fff;
            border-radius: 6px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Left side of the calendar - Days and Dates */
        .calendar-left {
            flex: 1;
            padding: 20px;
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

        /* Right side of the calendar - Event Form */
        .calendar-right {
            flex: 1;
            padding: 20px;
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
    </div>
    <div class="calendar-right">
        <div class="form-container">
            <h2>Add Event</h2>
            <form id="eventForm">
                <div class="form-group">
                    <label class="form-label" for="eventDate">Date:</label>
                    <input class="form-input" type="text" id="eventDate" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label" for="petSelection">Pet:</label>
                    <select class="form-select" id="petSelection">
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label" for="eventDescription">Description:</label>
                    <input class="form-input" type="text" id="eventDescription">
                </div>
            </form>
            <div id="eventsListContainer">
                <!-- Display events for the selected date here -->
            </div>

            <button class="form-submit" type="button" id="addEventButton">Add Event</button>
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
        for (var i = 1; i <= daysInMonth; i++) {
            daysArray.push({date: i, events: []});
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

    // Attach event listeners to date elements for adding events
    document.getElementById("calendarDatesContainer").addEventListener("click", function (event) {
        var target = event.target;
        if (target.classList.contains("date")) {
            var date = target.dataset.date;
            var eventForm = document.getElementById("eventForm");
            eventForm.dataset.date = date;

            // Set the eventDate input value to the selected date
            var eventDateInput = document.getElementById("eventDate");
            eventDateInput.value = currentDate.toLocaleString('default', {
                month: 'long',
                year: 'numeric'
            }) + " " + date + "일";

            // Display events for the selected date in the right container
            var selectedDateEvents = target.events;
            var eventsListContainer = document.getElementById("eventsListContainer");
            eventsListContainer.innerHTML = "";
            if (selectedDateEvents.length > 0) {
                var eventsList = document.createElement("ul");
                selectedDateEvents.forEach(function (event) {
                    var eventItem = document.createElement("li");
                    eventItem.innerText = event;
                    eventsList.appendChild(eventItem);
                });
                eventsListContainer.appendChild(eventsList);
            }
        }
    });

    // Handle event form submission
    document.getElementById("addEventButton").addEventListener("click", function () {
        var eventForm = document.getElementById("eventForm");
        var date = eventForm.dataset.date;
        var eventDescription = document.getElementById("eventDescription").value;

        // Add the event to the corresponding date
        var dateElement = document.querySelector(".date[data-date='" + date + "']");
        //dateElement.events.push(eventDescription);

        // Clear the form and re-render the calendar
        document.getElementById("eventDescription").value = "";

        // Update the events list in the left calendar for the selected date
        var leftCalendarDate = document.querySelector(".date.selected");
        if (leftCalendarDate && leftCalendarDate.dataset.date === date) {
            leftCalendarDate.events.push(eventDescription);
            var eventsList = leftCalendarDate.querySelector(".events");
            var eventItem = document.createElement("li");
            eventItem.innerText = eventDescription;
            eventsList.appendChild(eventItem);
        }
    });

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
                    option.value = pet.name;
                    option.textContent = pet.name;
                    petSelection.appendChild(option);
                });
            },
            error: function () {
                console.log("Error fetching pets data.");
            }
        });
    });

    // Initial rendering of the calendar
    renderCalendar(0);

</script>
</body>
</html>
