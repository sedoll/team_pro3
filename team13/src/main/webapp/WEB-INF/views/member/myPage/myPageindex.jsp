<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path14" value="${pageContext.request.contextPath }"/>

<html>
<head>
    <title>마이페이지</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path14}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/myPage/validateUser.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/myPage/myPageindex.css"/>


</head>
<body>


<div id="wrap">
    <jsp:include page="../../include/header.jsp"></jsp:include>


    <div id="container">

        <div class="mypage-base">
            <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

            <main class="container__inner">
                <article class="my-page">
                    <h1 class="my-page__title">마이페이지</h1>

                    <div class="my-page__profile">
                        <div class="my-page-profile">
                            <img
                                    src="${path14 }/resources/img/basic-profile-image.png"
                                    alt="프로필 사진"
                                    class="my-page-profile__image"
                            />
                            <span class="my-page-profile__nickname">user</span>
                        </div>

                        <div class="my-transaction-info">
                            <ul class="my-transaction-info__list">
                                <li class="my-transaction-info__item">
                                    <span class="my-transaction-info__title">작성글 수</span>
                                    <span class="my-transaction-info__content">66</span>
                                </li>

                                <li class="my-transaction-info-item">
                                    <span class="my-transaction-info__title">회원등급</span>
                                    <span class="my-transaction-info__content">F</span>
                                </li>

                                <li class="my-transaction-info-item">
                                    <span class="my-transaction-info__title">POINT</span>
                                    <span class="my-transaction-info__content">1000 점</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <p class="my-page__introduction"></p>

                    <div class="my-page__edit-buttons">
                        <button type="button" class="button is-link is-rounded is-outlined" onclick="location.href='${path14}/member/update.do'">회원 정보 변경
                        </button>
                        <button type="button" class="my-info-edit" onclick="location.href='${path14 }/LikeList.do'">
                            <i class="fas fa-cog my-info-edit__icon"></i>
                            <span class="my-info-edit__text">내가 쓴 글</span>
                        </button>
                    </div>

                    <div class="transaction-history">
                        <div class="transaction-history__sale">
                            <a href="${path14}/PaymentList.do">결제정보</a>
                        </div>
                        <div class="transaction-history__purchase">
                            <a href="${path14}/CartList.do">장바구니</a>
                        </div>
                </article>
            </main>
        </div>

    </div>
    <footer id="footer" class="footer-nav row expanded collapse">
        <!-- 푸터 부분 인클루드 -->
        <jsp:include page="../../include/footer.jsp"></jsp:include>
    </footer>
</div>

<script
        src="https://kit.fontawesome.com/b17793764c.js"
        crossorigin="anonymous"
></script>


</body>
</html>