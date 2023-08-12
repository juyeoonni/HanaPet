<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <link rel="stylesheet" href="../../../resources/css/login-register.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
        <!-- SIGN UP -->
        <div class="col align-items-center flex-col sign-up">
            <div class="form-wrapper align-items-center">
                <div class="form sign-up">
                    <div class="input-group">
                        <i class='bx bxs-user'></i>
                        <input type="text" placeholder="Username">
                    </div>
                    <div class="input-group">
                        <i class='bx bx-mail-send'></i>
                        <input type="email" placeholder="Email">
                    </div>
                    <div class="input-group">
                        <i class='bx bxs-lock-alt'></i>
                        <input type="password" placeholder="Password">
                    </div>
                    <div class="input-group">
                        <i class='bx bxs-lock-alt'></i>
                        <input type="password" placeholder="Confirm password">
                    </div>
                    <button>
                        Sign up
                    </button>
                    <p>
              <span>
                Already have an account?
              </span>
                        <b onclick="toggle()" class="pointer">
                            <a href="/login">Sign in here</a>
                        </b>
                    </p>
                </div>
            </div>

        </div>
        <!-- END SIGN UP -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
        <!-- SIGN IN CONTENT -->
        <div class="col align-items-center flex-col">
            <div class="text sign-in">
                <h2>
                    Welcome
                </h2>

            </div>
            <div class="img sign-in">

            </div>
        </div>
        <!-- END SIGN IN CONTENT -->
        <!-- SIGN UP CONTENT -->
        <div class="col align-items-center flex-col">
            <div class="img sign-up">

            </div>
            <div class="text sign-up">
                <h2>
                    Join with us
                </h2>

            </div>
        </div>
        <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
</div>
</body>
<script>
    let container = document.getElementById('container')

    toggle = () => {
        container.classList.toggle('sign-in')
        container.classList.toggle('sign-up')
    }

    setTimeout(() => {
        container.classList.add('sign-up')
    }, 200)
</script>
</html>