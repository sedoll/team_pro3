<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
        <div class="column is-3 " style="background-color: #eeeeee; margin-top: 12px">
            <aside class="menu is-hidden-mobile">
                <p class="menu-label">
                    General
                </p>
                <ul class="menu-list">
                    <li><a href="${path}/admin/adminMain.do">Dashboard</a></li>
                </ul>
                <p class="menu-label">
                    Member
                </p>
                <ul class="menu-list">
                    <li><a href="${path}/admin/memberList.do">회원 목록</a></li>
                </ul>
                <p class="menu-label">
                    Content
                </p>
                <ul class="menu-list">
                    <li>
                        <p>신고 관리</p>
                        <ul>
                            <li><a href="${path}/admin/boardReportList.do?category=free">자유게시판 신고 내역</a></li>
                            <li><a href="${path}/admin/boardReportList.do?category=teacher">선생님게시판 신고 내역</a></li>
                            <li><a href="${path}/admin/boardReportList.do?category=parent">학부모게시판 신고 내역</a></li>
                        </ul>
                    </li>
                    <li>
                        <p>게시글 관리</p>
                        <ul>
                            <li><a href="${path}/admin/boardList.do?category=free">자유게시판 게시글 관리</a></li>
                            <li><a href="${path}/admin/boardList.do?category=teacher">선생님게시판 게시글 관리</a></li>
                            <li><a href="${path}/admin/boardList.do?category=parent">학부모게시판 게시글 관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <p>댓글 관리</p>
                        <ul>
                            <li><a href="${path}/admin/commentList.do?category=free">자유게시판 댓글 관리</a></li>
                            <li><a href="${path}/admin/commentList.do?category=teacher">선생님게시판 댓글 관리</a></li>
                            <li><a href="${path}/admin/commentList.do?category=parent">학부모게시판 댓글 관리</a></li>
                        </ul>
                    </li>


                </ul>
                <p class="menu-label">
                    Help
                </p>
                <ul class="menu-list">
                    <li><a href="${path}/notice/insert.do">공지사항 작성</a></li>
<%--                    <li><a>FAQ 작성</a></li>--%>
                </ul>
            </aside>
        </div>