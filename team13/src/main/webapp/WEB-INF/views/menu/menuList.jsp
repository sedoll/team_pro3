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
    <title>식단표</title>
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
            ${not empty schoolName ? schoolName : '학교'}
        </p>
        <p class="subtitle is-size-5">
            식단표
        </p>
    </div>
</section>
<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <%-- post 방식 --%>
            <p class="is-size-3">학교 선택<p>
            <form action="${path}/menu/list.do" method="post">
                <input type="text" name="name" id="name" class="input" placeholder="학교 이름 입력" required autofocus>
                <input class="button is-link is-outlined" type="submit" value="확인">
            </form>
                <hr>
            <%-- get 방식 --%>
<%--            <div>--%>
<%--                <a class="button" href="${path}/menu/list.do?name=신구로초">신구로초등학교</a>--%>
<%--                <a class="button" href="${path}/menu/list.do?name=고척중">고척중학교</a>--%>
<%--                <a class="button" href="${path}/menu/list.do?name=경인고">경인고등학교</a>--%>
<%--            </div>--%>
            <p class="is-size-3">이번 주 식단표</p>
            <table>
                <thead>
                <tr>
                    <c:forEach var="day" items="${mlsvList}" varStatus="status">
                        <th>
                            ${day}
                            <c:if test="${status.index == 0}">
                                (월)
                            </c:if>
                            <c:if test="${status.index == 1}">
                                (화)
                            </c:if>
                            <c:if test="${status.index == 2}">
                                (수)
                            </c:if>
                            <c:if test="${status.index == 3}">
                                (목)
                            </c:if>
                            <c:if test="${status.index == 4}">
                                (금)
                            </c:if>
                        </th>
                    </c:forEach>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach var="eat" items="${ddishList }" varStatus="status">
                        <td>${eat}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach var="cal" items="${calList }" varStatus="status">
                        <td>${cal}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach var="orplc" items="${orplcList }" varStatus="status">
                        <td>${orplc}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach var="ntr" items="${ntrList }" varStatus="status">
                        <td>${ntr}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <td colspan="5">
                        알레르기 유발 식재료 번호 : 1.난류, 2.우유, 3.메밀, 4.땅콩, 5.대두, 6.밀, 7.고등어, 8.게, 9.새우, 10.돼지고기, 11.복숭아, 12.토마토, 13.아황산류, 14.호두,
                        15.닭고기, 16.쇠고기, 17.오징어, 18.조개류(굴, 전복, 홍합 포함), 19.잣
                    </td>
                </tr>
                </tbody>
            </table>
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