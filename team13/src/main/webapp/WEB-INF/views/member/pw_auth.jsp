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
<div class ="body_content">

    <div class="main-content">
        <div class="content-wrap">


            <div class="content-section">
                <h5 class ="font"> 비밀번호찾기</h5>
                <form action="pw_set.do" method="post">
                    <input type="hidden" name ="num" value="${num }">
                    <div class=content>
                        <div class="textbox">
                            <input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
                            <div class="error"> </div>
                        </div><br><br>
                        <input type="submit" id="check" value="확인">
                    </div>
                </form>

            </div>


        </div>

    </div>



</div><!-- 바디컨텐트 -->

</body>
</html>
