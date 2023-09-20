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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form class = "content" action="pw_auth.do" method="post">
        <div class="textbox">
            <input id="text" name=name required="" type="text" />
            <label for="text">이름</label>
            <div class="error">이름을 입력하세요  </div>
        </div>
        <div class="textbox">
            <input id="email" name=email required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" type="email" />
            <label for="email">이메일</label>
            <div class="error">유효하지 않은 이메일주소 입니다  </div>
        </div><br><br>
        <input type="submit" id="check" value="비밀번호찾기">
    </form>

</body>
</html>
