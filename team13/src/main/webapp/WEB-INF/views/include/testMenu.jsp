<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<ul class="list">
    <li><a href="${path3}/sample/main.do">RequestMapping 방식 : Get</a></li>
    <li><a href="${path3}/sample/get1.do?id=kkt&pw=1234">GetMapping 방식 : request+model</a></li>
    <li><a href="${path3}/sample/get2.do?id=kkt&pw=1234">RequestMapping.GET 방식 : request+model</a></li>
    <li><a href="${path3}/sample/get3.do?id=kkt&pw=1234">RequestMapping.GET 방식 : RequestParam+model</a></li>
    <li><a href="${path3}/sample/get4.do?id=kkt&pw=1234">RequestMapping.GET 방식 : dto+model</a></li>
    <li><a href="${path3}/sample/get5.do?id=kkt&pw=1234">RequestMapping.GET 방식 : ModelAttribute+model</a></li>
    <li><a href="${path3}/sample/get6.do/kkt/1234">RequestMapping.GET 방식 : PathVariable+model</a></li>
    <li><a href="${path3}/sample/get7.do?id=kkt&pw=1234">RequestMapping.GET 방식 : RequestParam+ModelAndView</a></li>
    <li><a href="${path3}/board/list.do">게시글 목록</a></li>
    <li><a href="${path3}/sample2/list.do">샘플목록</a></li>
</ul>
</body>
</html>
