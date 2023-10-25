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
    <title>QNA 목록</title>
    <!-- 헤드 부분 인클루드 -->
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
            QNA
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
                    <option value="1">제목</option>
                    <option value="2">게시일</option>
                </select>
                <input type="text" name="search_filter" class="search_filter">
            </div>
            <table id="myTable">
                <thead>
                <tr>
                    <th width="80">번호</th>
                    <th>제목</th>
                    <th width="120">게시일</th>
                    <th width="100">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${qnaList }" var="board" varStatus="status">
                    <tr>
                        <td>${status.count }</td>
                        <c:choose>
                            <c:when test="${empty board.pw || board.pw eq ''}">
                                <td><a href="${path}/qna/detail.do?bno=${board.bno}">${board.title}</a></td>
                            </c:when>
                            <c:otherwise>

                                <c:choose>
                                    <c:when test="${sid eq 'admin'}">
                                        <td><a href="${path}/qna/detail.do?bno=${board.bno}">[비밀글] ${board.title}</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><a href="${path}/qna/qnapw.do?bno=${board.bno}">[비밀글] ${board.title}</a></td>
                                    </c:otherwise>
                                </c:choose>

                            </c:otherwise>
                        </c:choose>
                        <td>
                            <fmt:parseDate value="${board.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                        <td>${board.cnt }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
             <c:if test='${not empty sid}'>
                <div class="button-group">
                    <a class="button is-link is-outlined" href="${path}/qna/insert.do">글쓰기</a>
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