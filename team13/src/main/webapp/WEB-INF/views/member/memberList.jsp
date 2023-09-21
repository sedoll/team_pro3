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
    <title>회원 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-whtie is-medium">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
            회원 목록
        </p>
        <p class="subtitle is-size-5">

        </p>
    </div>
</section>
<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <table>
                <thead>
                <tr>
                    <th width="80">No</th>
                    <th>ID</th>
                    <th width="120">Name</th>
                    <th width="100">RegDate</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${memberList }" var="member" varStatus="status">
                    <tr>
                        <td>${status.count }</td>
                        <td><a href="${path}/member/detail.do?id=${member.id }">${member.id }</a></td>
                        <td>${member.name }</td>
                        <td>
                            <fmt:parseDate value="${member.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>