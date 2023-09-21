<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Neumorphic Login - Free Bulma template</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.4/css/bulma.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/neumorphic-login.css">
    <jsp:include page="../include/head.jsp"></jsp:include>
    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- theme meta -->
    <meta name="theme-name" content="kross-bulma" />

    <!-- ** Plugins Needed for the Project ** -->
    <!-- bulma -->
    <link rel="stylesheet" href="${path}/resources/theme/plugins/bulma/bulma.min.css">
    <!-- slick slider -->
    <link rel="stylesheet" href="${path}/resources/theme/plugins/slick/slick.css">
    <!-- themefy-icon -->
    <link rel="stylesheet" href="${path}/resources/theme/plugins/themify-icons/themify-icons.css">

    <!-- Main Stylesheet -->
    <link href="${path}/resources/theme/css/style.css" rel="stylesheet">

    <!--Favicon-->
    <link rel="shortcut icon" href="${path}/resources/theme/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${path}/resources/theme/images/favicon.ico" type="image/x-icon">
    <style>
        .login{
            margin: 0 auto;
            width: 440px;
        }

        #logo-6{
            margin-top: 40px;
        }

        .hero-body form{
            padding-left: 50px;
            padding-right: 50px;
        }

        .container table {
            box-shadow: #dddddd;}

        .level-item div{
            margin-left: 27px;
        }

        .level-item .term {
            margin-right: 20px;
        }

        .level-item .find{
            margin-left: 20px;
        }



    </style>
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-fullheight">
    <div class="hero-body has-text-centered">
        <div class="login box is-rounded">
            <img src="${path}/resources/img/logo_noBackground_blue.png" alt="logo" width="220">
            <form action="${path }/member/signin.do" method="post" name="loginForm">
                <div class="field">
                    <div class="control">
                        <input class="input is-medium is-rounded" name="id" id="id" type="text" placeholder="id"  />
                    </div>
                </div>
                <div class="field">
                    <div class="control">
                        <input class="input is-medium is-rounded" name="pw" id="pw" type="password" placeholder="**********" />
                    </div>
                </div>
                <br />
                <button class="button is-block is-fullwidth is-link is-medium is-rounded" type="submit">
                    Login
                </button>
            </form>
            <br>
            <nav class="level">
                <div class="level-item has-text-centered">
                    <div>
                        <a href="../member/term.do" class="term">회원가입</a>
                        <a>|</a>
                        <a href="${path}/member/pw_find.do" class="find">비밀번호 찾기</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</section>
</body>

</html>