<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }"/>

<html>
<head>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path1}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path1}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path1}/resources/css/myPage/validateUser.css"/>


</head>
<body>

<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="mypage-base">

    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">
        <div class="page-header">
            <h2>개인 정보 수정</h2>
        </div>
        <div class="check-pwd-content">
            <h4>비밀번호 재확인</h4>
            <p>
                회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.
            </p>
            <form class="check-pwd-form" action="/user/info" method="post" id="verify_form">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label">
                            <label>아이디</label>
                        </div>
                        <div class="input">
                            <input name="id" type="text" readonly="true" value="${sessionScope.sid}" />
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>
                                비밀번호<span class="required">*</span>
                            </label>
                        </div>
                        <div class="input">
                            <input name="pw" type="password" class="test" />
                        </div>
                    </div>
                </div>
                <div class="button-box">
                    <button id="verify_confirm">확인</button>
                    <button id="withdraw">탈퇴하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
<script>
    let msg = "${msg}";
    if(msg === "PWD_EMPTY_ERR") alert("비밀번호를 입력해 주세요");
    if(msg === "NOT_FOUND_ERR") alert("정보를 찾을 수 없습니다");
    if(msg === "EXCEPTION_ERR") alert("오류가 발생했습니다. 다시 시도해 주세요");
    if(msg === "MOD_OK") alert("회원정보 수정을 성공했습니다");
</script>
<script>
    $(document).ready(function() {
        $("#withdraw").click(function(e) {
            e.preventDefault();
            window.location.href = "/member/myPage/withdraw";
        });
        $("#verify_confirm").click(function(e){
            e.preventDefault();
            let pwd = $("input[name=pw]");

            if($.trim(pwd.val()) === "") {
                alert("비밀번호를 입력해주세요"); //ok
                pwd.focus();
            } else $(".check-pw-form").submit();
        });
    });
</script>
</body>
</html>