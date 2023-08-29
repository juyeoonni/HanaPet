<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .category{
            background: #75A989;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            width: auto;
            height: 30px;
        }

        .contents{
            background: #E1E6DE;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            width: auto;
            height: 400px;
        }

        button{
            /* main */
            background: #75A989;
            box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 10px;
            display: inline-block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div>
    <div class="category">
        <img src=""/>
        <span style="color: white">의료/건강</span>
    </div>

    <div class="contents">
        <div class="first-content">
            <img src=""/>
            <span>토리를 위한 </span>
            <span id="account-name">백내장 수술 적금</span>
            <span>에 가입되었습니다.</span>
        </div>
        <div class="second-content">
            <img src=""/>
        </div>
        <div class="third-content">
            <a href="/"><button>HOME으로</button></a>
            <a href="/mypet"><button>마이페이지로</button></a>
        </div>
    </div>
</div>
</body>
</html>
