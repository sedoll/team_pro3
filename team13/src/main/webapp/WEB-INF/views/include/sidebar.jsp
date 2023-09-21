<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path4" value="${pageContext.request.contextPath }"/>

<nav style="margin-right: 0">
    <div class="sidebar">
        <div class="header">티스푼</div>
        <ul>
            <li>
                <a href="${path4}/member/update.do?id=${sid }" >
                    개인정보 수정
                </a>
            </li>
            <li>
                <a href="${path4}/member/writtenList.do" >
                    작성글
                </a>
            </li>
            <li>
                <a href="${path4}/member/myReportList.do">
                    신고한 게시글
                </a>
            </li>
        </ul>
        <a href="${path4}/qna/list.do" class="mypage-inquiry">
            <div>
                <span class="ask-help">도움이 필요하신가요?</span>
                <span>1:1 문의하기</span>
            </div>
        </a>
    </div>
</nav>