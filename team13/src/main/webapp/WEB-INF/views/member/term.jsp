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

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
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
        .breadcrumb a { color:#fff; }

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

        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
    </style>

    <link rel="stylesheet" href="../css/ft.css">
</head>
<body>
    <header class="hd" id="hd">
        <%@ include file="../include/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>회원 유형</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 유형</h2>
                <form action="${path}/member/join.do" method="post" class="frm">
                    <div>
                        <ul class="join_type">
                            <li>
                                <img class="profile" src="/img/boy.png" alt="">
                                <input type="radio" name="job" value="1" id="stu" checked>
                                <label for="stu">학부모</label><br>
                            </li>
                            <li>
                                <img class="profile" src="/img/teacher.png" alt="">
                                <input type="radio" name="job" value="2" id="tea">
                                <label for="tea">교사</label><br>
                            </li>
                        </ul>
                    </div>
                    <br>
                    <p>가입 유형을 선택해 주세요</p>
                    <br>
                    <input class="inbtn" type="submit" value="다음 단계">
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../include/footer.jsp" %>
    </footer>
</body>
</html>