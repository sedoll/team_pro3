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
    <title>로그인</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-primary">
                <div class="hero-body">
                    <p class="title">
                        로그인
                    </p>
                    <p class="subtitle">
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="content" id="content">
        <div class="row column text-center">
            <h2 class="h1">로그인</h2>
            <hr>
            <div class="container">
                <c:if test="${!empty msg }">
                    <script>
                        alert("로그인 실패");
                        document.loginForm.userid.focus();
                    </script>
                </c:if>
                <form action="${path }/member/signin.do" method="post" name="loginForm">
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            <tr>
                                <th><label for="id">아이디</label></th>
                                <td><input type="text" name="id" id="id" size="100" class="input" placeholder="아이디 입력" required>
                                    <!--  pattern="^[a-z0-9]+$"  -->
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw">비밀번호</label></th>
                                <td><input type="password" name="pw" id="pw"  class="input" placeholder="비밀번호 입력" required>
                                    <!--  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  -->
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" class="button is-primary" value="로그인">
                                    <input type="reset" class="button" value="취소">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <script>
                    function loginFaiure() {
                        alert("로그인 실패");
                    }
                </script>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>