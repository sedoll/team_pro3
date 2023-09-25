<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 입력</title>
    <%@ include file="../include/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="../css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>
        .hero {
            height: 250px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-white">
                <div class="hero-body has-text-centered">
                    <p class="title is-size-3">
                        자유게시판
                    </p>
                    <p class="subtitle is-size-5">
                        작성
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="content" id="contents">
        <div class="row column text-center">
            <div class="container">
                <form action="${path}/board/insert.do" method="post">
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">글 제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="input" placeholder="제목 입력" maxlength="98" autofocus required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">글 내용</th>
                            <td>
                                <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="900" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="submit button is-link is-outlined" value="글 등록" >
                                <input type="reset" value="취소" class="button is-danger is-outlined" onclick="window.history.back();">
                                <a class="button is-black is-outlined" href="${path }/board/list.do">글 목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- footer imclude -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>