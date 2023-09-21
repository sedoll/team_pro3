<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path13" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
          integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
          crossorigin="anonymous"/>
    <!-- 부트스트랩 4.0 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/validateUser.css"/>
    <link href="${path13}/resources/css/myPage/com_write.css" rel="stylesheet">
    <script type="text/javascript" src="${path13}/resources/js/com_write.js" charset="UTF-8"></script>

    <title>작성글</title>


</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>

<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

    <div class="content-wrap" style="float:left; margin-left: -50px">
            <h5 class="font"> 신고한 게시글 목록 > </h5>
            <br>

            <form class="content">

                <div id="ud_tab" style="float:left; margin-left: -20px">
                    <input type="radio" name="ud_tabs" id="tab1" checked>
                    <label for="tab1">신고 목록</label>

                    <div id="ud_tab-content1" class="ud_content" style="float:left; margin-left: -20px">
                        <table style="width: 800px; margin-left: -20px">
                            <thead>
                            <tr>
                                <th style="width: 6%">No</th>
                                <th style="width: 14%">분류</th>
                                <th style="width: 10%">사유</th>
                                <th style="width: 40%">제목</th>
                                <th style="width: 20%">신고일</th>
                                <th style="width: 10%">비고</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${boardList }" var="boardlist" varStatus="status">
                                <tr class="boardlist1">
                                    <td>${status.count}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${boardlist.board_type == 'board'}">자유 게시판</c:when>
                                            <c:when test="${boardlist.board_type == 'boardPar'}">학부모 게시판</c:when>
                                            <c:when test="${boardlist.board_type == 'boardTea'}">선생님 게시판</c:when>
                                            <c:otherwise>${boardlist.board_type}</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${boardlist.reason}</td>
                                    <td><a class="path"
                                           href="${path13}/board/detail.do?bno=${boardlist.bno}">${boardlist.title}</a>
                                    </td>
                                    <td><fmt:parseDate value="${boardlist.report_date }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" /></td>
                                    <td><a href="${path13}/member/myReportCancel.do?bno=${boardlist.bno}&category=${boardlist.board_type}" style="background-color: #fc5a5a; color: white; border-radius: 4px; padding: 6px">취소</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <%--<input type="button" id="check11" value="더보기">
                        <div class="error11"></div>--%>

                    </div> <%-- 작성글("ud_tab-content1") 끝--%>



            <%-- ---------------------------------------------------------------------------------------------  --%>


            </form>
        </div>







</div>
</div>


<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>
