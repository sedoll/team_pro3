<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path15" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <title>회원 탈퇴 안내</title>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path15}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path15}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path15}/resources/css/myPage/validateUser.css"/>
    <link rel="stylesheet" href="${path15}/resources/css/myPage/withdraw.css"/>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

    <div class="withdraw-content">
        <h1 class="header" style="font-size: 40px;">회원 탈퇴 안내</h1>
        <p>* 별도의 목적의 경우 고객센터로 문의해주시기 바랍니다.</p>
        <p>* 개인정보는 개인정보 처리 방침에 따라 보관합니다.</p>
        <p>* 탈퇴가 진행되면 이후에는 어떠한 복구도 할 수 없습니다.</p>
        <div class="warn-list">
            <p class="text-danger">
                * 회원 탈퇴 시 기존의 정보는 즉시 소멸됩니다.
            </p>
            <p class="text-danger">
                * 탈퇴 시 기존의 아이디, 이메일은 본인 또는 타인 모두 재사용할 수
                없음을 알립니다.
            </p>
            <p class="text-danger">
                * 회원 탈퇴 시 30일 동안 재가입 처리가 불가능해집니다.
            </p>
        </div>
        <div class="user-info">
            <h4>가입 정보</h4>
            <p>아이디: <span> ${member.id} </span></p>
            <p>이름: <span> ${member.name} </span></p>
            <%-- <p>가입날짜: <span> ${member.regdate} </span></p>--%>
            <%-- <p>가입날짜: <span><fmt:formatDate value="${member.regdate}" pattern="yyyy.MM.dd" type="date"/></span></p>--%>
        </div>
        <%--<div class="confirm-input">
            <h4>
                탈퇴 처리 진행을 원하시는 경우, 아래 입력칸에
                <b>탈퇴처리에 동의합니다</b>라고 입력해주세요
            </h4>
            <input
                    id="withdraw"
                    type="text"
                    class="input-control"
                    placeholder="탈퇴처리에 동의합니다"
            />
        </div>--%>
        <label for="withdraw_agre" class="input-line" id="chk_label">
            <input type="checkbox" id="withdraw_agre" class="normal" hidden/>
            <img
                    class="agree-checkbox"
                    src="${path15}/resources/img/myPage_unchecked.png"
                    width="20"
                    height="20"
            />
            <span>위 사항을 모두 숙지하였으며 동의합니다.</span>
        </label>
        <div class="btn-container">
            <button class="cancel ">취소하기</button>
            <button class="withdraw" onclick="location.href='${path15}/member/withdraw.do?id=${member.id}' " >탈퇴하기</button>
        </div>
    </div>

</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="/js/member/msg.js"></script>
<script>
    $(document).ready(function () {
        $(".cancel").click(function () {
            window.location.href = "${path15}/member/mypage.do";
        });

        $(".confirm").attr("disabled", true); //ok

        let withdraw_msg = "탈퇴처리에 동의합니다";
        let input_failed = true; //인풋 불일치
        let chked = false; //동의 체크여부

        let validate = function (failed, checked) {
            $(".confirm").attr("disabled", (failed || !checked) ? true : false);
        }

        $("#withdraw").keyup(function (e) {
            input_failed = e.target.value != withdraw_msg;
            validate(input_failed, chked);
        });

        $("#chk_label").click(function () {
            chked = $("#withdraw_agre").is(":checked");

            $("#chk_label")
                .children("img")
                .attr(
                    "src",
                    chked ? "${path15}/resources/img/myPage_checked.png" : "${path15}/resources/img/myPage_unchecked.png"
                );
            validate(input_failed, chked);
        });

    });
</script>
</body>
</html>