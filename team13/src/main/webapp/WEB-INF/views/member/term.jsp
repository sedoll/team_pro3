<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원유형</title>
    <%@ include file="../include/head.jsp" %>

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
        /* 본문 영역 스타일 */
        /*.contents { clear:both; min-height:100vh;
            background-image: url("../img/login.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px;}
        .breadcrumb a { color:#fff; } */


        <%-- 학생, 선생님 선택 폼 css--%>
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            font-size: 20px;}

        .profile {
            margin: 0 50px; /* 이미지 사이 간격 */
            width: 300px;
            height: 300px;
        }

        .join_type {
            display: flex;
            list-style: none;
            padding: 0;
        }

        ul.join_type  {
            padding: 0;
            margin: 20px 0;
        }

        .join_type li {
            margin: 10px;
        }

        .join_type label {
            font-weight: bold;
        }

        .join_type input[type="radio"] {
            display: block;
            margin: 5px auto; /* 라디오 버튼 중앙 정렬 */
        }

        .join_type input[type="submit"] {
            margin-top: 20px; /* 버튼과 이미지 사이 간격 */
        }

       /* #contents{
            height: 928px;
        }

        .hero-body{
            padding-top: 100px;
            padding-bottom: 100px;
        } */

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }


        .image {
            border: 2px solid #dddddd;
            border-radius: 50%;
        }

        .frontfile{
            margin-right: 20px;
        }

        .beforefile{
            margin-left: 20px;
        }

        .add-border{
            border: 2px solid #0a0a0a;
        }
    </style>

    <link rel="stylesheet" href="../css/ft.css">
</head>
<body>
<!--header -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- header -->

<!-- content -->
<div class="contents" id="contents">
    <div class="container">
        <section class="hero is-medium is-white ">
            <div class="hero-body has-text-centered">
                <p class="title is-size-3">회원 유형 선택</p>
            </div>
            <nav class="breadcrumb is-small has-bullet-separator is-right" aria-label="breadcrumbs">
                <ul>
                    <li><a href="#">Bulma</a></li>
                    <li><a href="#">Documentation</a></li>
                    <li><a href="#">Components</a></li>
                    <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
                </ul>
            </nav>
        </section>
    <section class="page" id="page1">
        <div class="page_wrap">
            <form action="${path}/member/join.do" method="post" class="frm">
                <div>
                    <ul class="join_type">
                        <li class="frontfile">
                            <figure class="image front" style="width: 300px; height: 300px">
                            <img class="is-rounded" src="${path}/resources/img/mother2.png" alt="학부모">
                            </figure>
                            <input type="radio" name="job" value="1" id="stu" checked class="term-radio1">
                            <label for="stu">학부모</label><br>
                        </li>
                        <li class="beforefile">
                            <figure class="image before" style="width: 300px; height: 300px">
                            <img class="is-rounded" src="${path}/resources/img/teacher_icon2.png" alt="교사">
                            </figure>
                                <input type="radio" name="job" value="2" id="tea" class="term-radio2">
                            <label for="tea">교사</label><br>
                        </li>
                    </ul>
                </div>
                <br>
                <p>가입 유형을 선택해 주세요</p>
                <br>
                <input class="button is-outlined is-black is-rounded" type="submit" value="다음 단계">
            </form>
        </div>
    </section>
    </div>
    </div>
<footer class="ft" id="ft">
    <%@ include file="../include/footer.jsp" %>
</footer>
</body>
<script>
$('#stu').hover(
    function(){$('.front').css({'border' : '2px solid #0a0a0a'}); },
    function (){$('.front').css({'border' : '2px solid #dddddd'});}
);

$('#tea').hover(
    function(){$('.before').css({'border' : '2px solid #0a0a0a'}); },
    function (){$('.before').css({'border' : '2px solid #dddddd'});}
);
</script>
</html>