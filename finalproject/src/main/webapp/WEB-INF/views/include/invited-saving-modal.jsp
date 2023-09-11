<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<head>
    <link rel="stylesheet" href="/resources/css/modal.css">
    <style>
        .second-content img {
            border-radius: 50%;
            overflow: hidden;
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<%@ include file="header.jsp" %>
<div class="body">
    <div class="category small">
        <img src="/resources/img/invitation.svg" width="40px"
             style="padding-left: 5px; padding-top: 3px; margin-right: 15px;">
        <span>공유 적금 초대 </span>
    </div>
    <div class="contents small">
        <div class="first-content">
            <img src=""/>
            <span>${inviteInfo[0].openerName}님이 </span>
            <span id="account-name">${inviteInfo[0].petName}의 ${inviteInfo[0].savingName}</span>
            <span>에 초대하셨습니다.</span>
        </div>
        <div class="second-content">
            <img src="/resources/img/${inviteInfo[0].petImg}"/>
        </div>
        <div class="third-content">
            <a href="/one-product">
                <button>적금 가입하기</button>
            </a>
        </div>
    </div>
</div>