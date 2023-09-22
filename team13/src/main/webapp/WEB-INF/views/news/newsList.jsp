<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴스</title>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero {
            height: 250px;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-white is-medium">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
            ${not empty newsName ? newsName : '뉴스'}
        </p>
        <p class="subtitle is-size-5">
            뉴스 검색
        </p>
    </div>
</section>
<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <h2>뉴스 검색</h2>
            <form action="${path}/news/list.do" method="post">
                <input type="text" name="search" id="search" class="input" placeholder="뉴스 제목 입력" required autofocus>
                <input class="button is-link is-outlined" type="submit" value="확인">
            </form>
            <hr>
            <article class="media">
                <div class="media-content">
                    <div class="content" style="margin-left: 150px;  margin-right: 150px;">
                        <c:forEach var="item" items="${titleList}" varStatus="status"> <%-- 가져온 url중 64-72번째만 나오게한다--%>
                            <br>
                            <p>
                                <a href="${urlList.get(status.index)}" target="_blank"><strong style="color:hsl(217, 71%, 53%);font-size: 30px;font-weight: bold;">${titleList.get(status.index)}</strong></a>   <small>${companyList.get(status.index)}</small>
                                <br><br>
                                    ${textList.get(status.index)}..<a href="${urlList.get(status.index)}" class="is-link" target="_blank">더보기</a>
                            <hr>
                            </p>
                        </c:forEach>
                    </div>
                </div>
            </article>
            <hr>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
