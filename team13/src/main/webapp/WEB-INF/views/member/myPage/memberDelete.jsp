<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="path1" value="${pageContext.request.contextPath }"/>--%>
<c:set var="path10" value="<%=request.getContextPath() %>" />

<html>
<head>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path10}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path10}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path10}/resources/css/myPage/validateUser.css"/>


</head>
<body>

<!-- 헤더 부분 인클루드 -->
<jsp:include page="../../include/header.jsp"></jsp:include>
<div class="mypage-base">

    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">
        <div class="page-header">
            <h2>탈퇴하기</h2>
        </div>
        <div class="check-pwd-content">
            <h4>비밀번호 재확인</h4>
            <p>
                회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.
            </p>
            <form class="check-pwd-form" action="${path10 }/member/mypage.do" method="post" id="verify_form">
                <div class="center-padding">
                    <div class="input-line">
                        <div class="input-label"><label>아이디</label></div>
                        <div class="input">
                            <input name="id" type="text" readonly="true" value="${sessionScope.sid}" />
                        </div>
                    </div>
                    <div class="input-line">
                        <div class="input-label">
                            <label>비밀번호<span class="required">*</span></label>
                        </div>
                        <div class="input">
                            <input name="pw" type="password" class="test" />
                            <input type="hidden" name ="pwck" id="pwck" value="pw">
                        </div>
                    </div>
                </div>
                <div class="button-box">
                    <button id="return" class="button is-black is-outlined" onclick="location.href='${path10 }/member/mypage.do'" >취소하기</button>
                    <button id="withdraw" class="button is-danger is-outlined">탈퇴하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../../include/footer.jsp"></jsp:include>
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
        //탈퇴하기 버튼
        $("#withdraw").click(function(e) {
            e.preventDefault();
            let id = $("input[name=id]").val();
            let pw = $("input[name=pw]").val();

            //var params = { id:$("#id").val(), pw:$("#pw").val() }
            // var pw = { pw:$("#pw").val() }

            $.ajax({
                url:"${path10 }/member/pwCheck.do",
                type:"post",
                dataType:"json",
                //data:params,
                data:{id:id,pw:pw },
                success:function(result){   //console.log(data.result);
                    console.log(result.result);
                    var pwPass = result.result;
                    if(pw === ""){
                        alert("비밀번호를 입력해주세요");
                        $("#pw").focus();
                    }else if(pw !== "" && pwPass==false){
                        alert("비밀번호가 틀립니다. 다시 입력해주세요");
                        $("#pw").focus();
                    } else if(pwPass==true){
                        alert("탈퇴 안내 페이지로 이동합니다.")
                        window.location.href = "${path10}/member/withdrawForm.do?id=${sessionScope.sid}";
                    }
                }
            });



        });

        //확인버튼
        /* $("#verify_confirm").click(function(e){
             e.preventDefault();
             let pw = $("input[name=pw]");

             if($.trim(pw.val()) === "") {
                 alert("비밀번호를 입력해주세요"); //ok
                 pw.focus();
             } else $(".check-pw-form").submit();
         });*/
    });
</script>
</body>
</html>