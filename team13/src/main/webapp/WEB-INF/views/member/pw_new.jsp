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

</body>
</html>
