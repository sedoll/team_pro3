<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>티스푼 메인 페이지</title>
    <jsp:include page="./include/head.jsp"/>
</head>
<body>
    <jsp:include page="./include/header.jsp"/>
    <section class="hero is-primary">
        <div class="hero-body">
            <p class="title">
                Primary hero
            </p>
            <p class="subtitle">
                Primary subtitle
            </p>
        </div>
    </section>
    <div class="container is-fullhd">
        <h2>티스푼 메인 페이지</h2>
        <div class="container">
            <%-- 나중에 이부분 제거 --%>
            회원 : ${sid}
            직업 : ${job}
        </div>
        <ul class="list">
            <li><a href="${path}/sample/main.do">RequestMapping 방식 : Get</a></li>
            <li><a href="${path}/sample/get1.do?id=kkt&pw=1234">GetMapping 방식 : request+model</a></li>
            <li><a href="${path}/sample/get2.do?id=kkt&pw=1234">RequestMapping.GET 방식 : request+model</a></li>
            <li><a href="${path}/sample/get3.do?id=kkt&pw=1234">RequestMapping.GET 방식 : RequestParam+model</a></li>
            <li><a href="${path}/sample/get4.do?id=kkt&pw=1234">RequestMapping.GET 방식 : dto+model</a></li>
            <li><a href="${path}/sample/get5.do?id=kkt&pw=1234">RequestMapping.GET 방식 : ModelAttribute+model</a></li>
            <li><a href="${path}/sample/get6.do/kkt/1234">RequestMapping.GET 방식 : PathVariable+model</a></li>
            <li><a href="${path}/sample/get7.do?id=kkt&pw=1234">RequestMapping.GET 방식 : RequestParam+ModelAndView</a></li>
        </ul>
    </div>
    <jsp:include page="./include/footer.jsp"/>
</body>
</html>