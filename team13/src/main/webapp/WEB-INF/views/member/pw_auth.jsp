<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>비밀번호 찾기</title>

    <%-- <link rel="stylesheet" href="${path}/resources/css/myPage/baseLayout.css"/>--%>
    <link rel="stylesheet" href="${path}/resources/css/member/pw_find.css"/>
    <link rel="stylesheet" href="${path}/resources/css/member/member.css"/>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<div class ="body_content">

    <div class="main-content">
        <div class="content-wrap">

            <div class="content-section">
                <h5 class ="font"> 비밀번호찾기</h5>
                <form action="pw_set.do" method="post">
                    <input type="hidden" name ="num" value="${num }">
                    <div class=content2 style="padding-top: 110px;">
                        <div class="textbox">
                            <input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
                            <div class="error"> </div>
                        </div>
                        <input type="submit" id="check" value="확인">
                    </div>
                </form>

            </div>


        </div>

    </div>



</div><!-- 바디컨텐트 -->

</body>
</html>
