<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>비밀번호 찾기</title>


    <link rel="stylesheet" href="${path}/resources/css/member/pw_find.css"/>
    <link rel="stylesheet" href="${path}/resources/css/member/member.css"/>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-fullheight">
    <div class="body_content">
        <div class="main-content ">

            <div class="content-section">
                <h5 class="font"> 비밀번호 찾기</h5>
                <form class="content2" action="pw_auth.do" method="post">
                    <div class="textbox">
                        <input id="text" name=name required="" type="text"/>
                        <label for="text">이름</label>
                        <div class="error">이름을 입력하세요</div>
                    </div>
                    <div class="textbox">
                        <input id="email" name=email
                               required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i"
                               type="email"/>
                        <label for="email">이메일</label>
                        <div class="error">유효하지 않은 이메일주소 입니다</div>
                    </div>

                    <input type="submit" id="check" value="비밀번호 찾기">
                </form>
            </div>

        </div>
    </div>
</section>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
