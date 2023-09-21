<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>새 비밀번호 설정</title>

    <%-- <link rel="stylesheet" href="${path}/resources/css/myPage/baseLayout.css"/>--%>
    <link rel="stylesheet" href="${path}/resources/css/member/member.css"/>
    <link rel="stylesheet" href="${path}/resources/css/member/pw_new.css"/>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>


<div class="body_content">
    <div class="main-content">


        <!-- 오른쪽. 내용이 들어갈 부분 -->
        <div class="content-section">
            <h5 class="font"> 새비밀번호설정</h5>
            <form action="pw_new.do" method="POST" class="content">
                <div class="textbox">
                    <input id="pw" name="pw" type="password"><label>새비밀번호</label>
                    <div class="error">
                        Invalid password
                    </div>
                </div>
                <div class="textbox">
                    <input id="pw2" type="password" onchange="isSame();"><label>새비밀번호 확인</label>
                    <div class="error">
                        Invalid password
                    </div>
                </div>
                <span id=same></span>
                <br><br>
                <input type="submit" id="check" value="비밀번호변경">
                <input type="hidden" name="email" value=${email}>
            </form>
        </div>


    </div>


</body>
</html>
