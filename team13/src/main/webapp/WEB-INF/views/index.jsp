<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<!--
// WEBSITE: https://themefisher.com
// TWITTER: https://twitter.com/themefisher
// FACEBOOK: https://www.facebook.com/themefisher
// GITHUB: https://github.com/themefisher/
-->
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <title>티스푼 메인 페이지</title>
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
        * {
            font-family: 'NanumSquare' !important;
        }
    </style>
</head>
<body>
<header id="header">
    <nav class="navbar is-dark is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="${path}/">
                <img src="${path}/resources/img/logo_noBackground_blue.png" width="112" height="28">
            </a>
            <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>
        <!-- header menu -->
        <div class="navbar-start">
            <div class="navbar-item has-dropdown is-hoverable">
                <a href="${path}" class="navbar-link is-arrowless">
                    <strong>정보</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined">
                    <a href="${path}/infoStu/list.do" class="navbar-item">
                        교육 정보
                    </a>
                    <a href="${path}/infoUni/list.do" class="navbar-item">
                        대입 정보
                    </a>
                    <a href="${path}/infoAct/list.do" class="navbar-item">
                        대외 활동
                    </a>
                    <a href="${path}/file/filelist1.do" class="navbar-item">
                        자료실
                    </a>
                </div>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless">
                    <strong>커뮤니티</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined">
                    <a href="${path}/board/list.do" class="navbar-item">
                        자유 게시판
                    </a>
                    <a href="${path}/boardTea/list.do" class="navbar-item">
                        선생님 게시판
                    </a>
                    <a href="${path}/boardPar/list.do" class="navbar-item">
                        학부모 게시판
                    </a>
                </div>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless">
                    <strong>내 자녀</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined">
                    <a href="${path}/menu/list.do" class="navbar-item">
                        급식표
                    </a>
                    <a href="${path}/grade/list.do" class="navbar-item">
                        성적표
                    </a>
                </div>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
                <a class="navbar-link is-arrowless">
                    <strong>고객센터</strong>
                </a>
                <div class="navbar-dropdown is-transparent is-size-6 is-dark is-outlined">
                    <a href="${path}/notice/list.do" class="navbar-item">
                        공지 사항
                    </a>
                    <a href="${path}/faq/list.do" class="navbar-item">
                        자주 묻는 질문
                    </a>
                    <a href="${path}/qna/list.do" class="navbar-item">
                        QnA
                    </a>
                </div>
            </div>
        </div>
        <!-- header menu end -->
        <div class="navbar-end">
            <div class="navbar-item">
                <div>
                    <c:if test="${not empty sid}">
                        ${sid} 회원님 환영합니다.
                    </c:if>
                </div>
                <div class="buttons">
                    <c:if test="${not empty sid && sid != 'admin'}"> <%-- 회원으로 로그인한 경우 --%>
                        <%--<a href="${path}/member/mypage.do" class="button is-link is-rounded" >--%>
                        <a href="${path}/member/mypage.do" class="button is-link is-rounded b1" >
                            마이페이지
                        </a>
                        <%--<a href="${path}/member/logout.do" class="button is-link2 is-rounded" >--%>
                        <a href="${path}/member/logout.do" class="button is-link2 is-rounded b2" >
                            로그아웃
                        </a>
                    </c:if>
                    <c:if test="${empty sid}"> <%-- 로그인을 안 한 경우 --%>
                        <%--<a href="${path}/member/term.do" class="button is-link is-rounded" >--%>
                        <a href="${path}/member/term.do" class="button is-link is-rounded b1" >
                            회원가입
                        </a>
                        <%--<a href="${path}/member/login.do" class="button is-link2 is-rounded" >--%>
                        <a href="${path}/member/login.do" class="button is-link2 is-rounded b2" >
                            로그인
                        </a>
                    </c:if>
                    <c:if test="${sid.equals('admin')}"> <%-- 관리자로 로그인 한 경우 --%>
                        <%--<a href="${path}/admin/adminMain.do" class="button is-link is-rounded " >--%>
                        <a href="${path}/admin/adminMain.do" class="button is-link is-rounded b1" >
                            관리자페이지
                        </a>
                        <%--<a href="${path}/member/logout.do" class="button is-link2 is-rounded" >--%>
                        <a href="${path}/member/logout.do" class="button is-link2 is-rounded b2" >
                            로그아웃
                        </a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</header>
<!-- hero area -->
<section class="hero-area has-background-primary" id="parallax" >
    <div class="columns">
        <img src="${path }/resources/img/new_main.png">
    </div>
</section>
<!-- /hero area -->
<!-- 사이드 메뉴 -->
<%@include file="main/sidemenu.jsp"%>
<!-- 사이드 메뉴 -->
<!-- 소개글 -->
<%@include file="main/introduction.jsp"%>
<!-- 소개글 -->
<!-- slidebanner -->
<%@include file="main/slidebanner.jsp"%>
<!-- slidebanner -->
<!-- parentsinfo -->
<%@include file="main/parentsinfo.jsp"%>
<!-- parentsinfo -->
<!-- awards -->
<%@include file="main/awards.jsp"%>
<!-- awards -->
<!-- 회원가입 -->
<%@include file="main/mainjoin.jsp"%>
<!-- 회원가입 -->
<!-- footer -->
<footer class="has-background-dark footer-section">
    <div class="section">
        <div class="container">
            <div class="columns">
                <div class="column is-4-tablet">
                    <h5 class="has-text-light">Email</h5>
                    <p class="has-text-white paragraph-lg font-secondary">steve.fruits@email.com</p>
                </div>
                <div class="column is-4-tablet">
                    <h5 class="has-text-light">Phone</h5>
                    <p class="has-text-white paragraph-lg font-secondary">+880 2544 658 256</p>
                </div>
                <div class="column is-4-tablet">
                    <h5 class="has-text-light">Address</h5>
                    <p class="has-text-white paragraph-lg font-secondary">125/A, CA Commercial Area, California, USA</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section is-small has-text-centered has-border-top is-border-dark">
        <p class="has-text-light">Copyright ©
            <script>
                var CurrentYear = new Date().getFullYear()
                document.write(CurrentYear)
            </script> a theme by <a href="themefisher.com">themefisher.com</a></p>
    </div>
</footer>
<!-- /footer -->
<!-- jQuery -->
<script src="${path}/resources/theme/plugins/jQuery/jquery.min.js"></script>
<!-- slick slider -->
<script src="${path}/resources/theme/plugins/slick/slick.min.js"></script>
<!-- filter -->
<script src="${path}/resources/theme/plugins/shuffle/shuffle.min.js"></script>
<!-- Main Script -->
<script src="${path}/resources/theme/js/script.js"></script>
</body>
</html>