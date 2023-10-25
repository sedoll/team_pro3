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
    <title>성적표 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero {
            height: 250px;
            margin-top: 40px;
        }

        tbody .button{
            width: 40px;
            height: 20px;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-white is-medium">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
            성적 게시판
        </p>
        <p class="subtitle is-size-5">
            목록
        </p>
    </div>
</section>
<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <div  class="search_from">
                <select name="select_filter" class="select_filter">
                    <option value="0">번호</option>
                    <option value="1">학생이름</option>
                    <option value="2">학부모아이디</option>
                    <option value="3">담임</option>
                </select>
                <input type="text" name="search_filter" class="search_filter">
            </div>
            <table id="myTable">
                <thead>
                <tr>
                    <th width="80">No</th>
                    <th>학생 이름</th>
                    <th>학부모님 아이디</th>
                    <th>담당선생님 성함</th>
                    <th width="120">등록일</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${gradeList}" var="grade" varStatus="status">
                    <tr>
                        <td>${grade.no}</td>
                        <td>${grade.sname}</td>
                        <td>${grade.pid}</td>
                        <td>${grade.tname}</td>
                        <td>
                            <fmt:parseDate value="${grade.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                        <td colspan="2">
                            <c:if test="${sid == grade.pid || job == 2 || job == 0}">
                                <a href="${path}/grade/gradedetail.do?no=${grade.no}" class="button is-black is-outlined">상세보기</a>
                            </c:if>
                            <c:if test="${ (job == 2  || job == 0) && sid == grade.tid}">
                                <a href="${path}/grade/gradedelete.do?no=${grade.no}" class="button is-danger is-outlined">성적삭제</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <c:if test='${job == 2 || job == 0}'>
            <div class="button-group">
                <a class="button is-link is-outlined" href="${path}/grade/gradeinsert.do">성적입력</a>
            </div>
            </c:if>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
<script src="${path}/resources/js/datatables.js"></script>
</body>
</html>