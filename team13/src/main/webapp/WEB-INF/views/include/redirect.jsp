<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path5" value="<%=request.getContextPath() %>" />
<html>
<head></head>
<body>
<script>
    alert('${msg}');
    location.href = '${path5}'+ '${url}';
</script>
</body>
</html>