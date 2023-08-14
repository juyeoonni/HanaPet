<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class>
    <%@ include file="include/banner.jsp" %>

    <div style=" display: grid; justify-content: center; margin-top: 100px">
        <%
            if ((String) session.getAttribute("name") != null) {
        %>
        <div>
            <img src="../../../resources/img/life-event.png" style="width:1000px;">
        </div>
        <div>
            토리는 현재 성년기에요!
        </div>
        <%} else {%>
        <img src="../../../resources/img/life-event.png" style="width:1000px;">
        <%}%>
    </div>
</div>
</body>
</html>