<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero{
            height: 100px;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-white is-small">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
        </p>
        <p class="subtitle">

        </p>
    </div>
</section>

<div class="container">
    <div class="columns">
        <jsp:include page="./adminMenu.jsp"></jsp:include>


<%--        -----------------이하 컨텐츠 부분--------------------------   ----%>
        <div class="column is-9">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="../">Teaspoon</a></li>
                    <li class="is-active"><a href="#" aria-current="page">Admin</a></li>
                </ul>
            </nav>
            <section class="hero is-white welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title" style="text-align: center">
                            ${categoryKor}게시판 게시글 관리
                        </h1>
                    </div>
                </div>
            </section>

<%--                    <table class="table" style="width: 100%">--%>
        <table class="table is-fullwidth">
            <thead>
            <tr>
                <th width="80">No</th>
                <th>Title</th>
                <th width="120">RegDate</th>
                <th width="100">Visited</th>
                <th width="100">비고</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${boardList }" var="board" varStatus="status">
                <tr>
                    <td>${status.count }</td>
                    <td><a href="${path}/${boardCate}/detail.do?bno=${board.bno }">${board.title }</a></td>
                    <td>
                        <fmt:parseDate value="${board.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                    </td>
                    <td>${board.cnt }</td>
                    <td><a href="${path}/admin/boardDelete.do?bno=${board.bno}&category=${category}" class=""><button class="button is-danger is-light"> 삭제 </button></a></td>


                </tr>
            </c:forEach>
            </tbody>



        </table>




        </div>
    </div>
</div>


    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>