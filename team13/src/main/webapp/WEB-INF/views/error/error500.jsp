<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500</title>
    <style>
        .image-container {
            width: 1000px;
            height: 1000px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('${path}/resources/img/error500.jpg');
            background-size: contain;
            background-repeat: no-repeat;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div class="image-container">
    <!-- 이미지가 중앙에 배치되고 크기에 맞게 표시됩니다. -->
</div>
</body>
</html>
