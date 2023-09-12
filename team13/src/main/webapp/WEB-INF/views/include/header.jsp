<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path2" value="<%=request.getContextPath() %>" />

<header id="header">
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="https://bulma.io">
                <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
            </a>

            <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div id="navbarBasicExample" class="navbar-menu">
            <div class="navbar-start">
                <a href="${path2}" class="navbar-item">
                    Home
                </a>

                <a class="navbar-item">
                    Documentation
                </a>

                <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link">
                        커뮤니티
                    </a>

                    <div class="navbar-dropdown">
                        <a href="${path2}/board/list.do" class="navbar-item">
                            자유게시판
                        </a>
                        <a href="${path2}/boardTea/list.do" class="navbar-item">
                            선생님게시판
                        </a>
                        <a href="${path2}/boardPar/list.do" class="navbar-item">
                            학부모게시판
                        </a>
                        <hr class="navbar-divider">
                        <a class="navbar-item">
                            Report an issue
                        </a>
                    </div>
                </div>
            </div>

            <div class="navbar-end">
                <div class="navbar-item">
                    <div>
                        <c:if test="${not empty sid}">
                            ${sid} 회원님 환영합니다.
                        </c:if>
                    </div>
                    <div class="buttons">
                        <c:if test="${not empty sid}"> <%-- 로그인한 경우 --%>
                            <a href="${path2}/member/mypage.do" class="button is-primary">
                                <strong>MyPage</strong>
                            </a>
                            <a href="${path2}/member/logout.do" class="button is-light">
                                LogOut
                            </a>
                        </c:if>
                        <c:if test="${empty sid}"> <%-- 로그인을 안 한 경우 --%>
                            <a href="${path2}/member/term.do" class="button is-primary">
                                <strong>Sign up</strong>
                            </a>
                            <a href="${path2}/member/login.do" class="button is-light">
                                Log in
                            </a>
                        </c:if>
                        <c:if test="${sid.equals('admin')}"> <%-- 관리자인 경우 --%>
                            <a href="${path2}/member/list.do" class="button is-light">
                                MemberList
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>