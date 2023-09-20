<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<html>
<head>
    <meta charset="UTF-8">
    <title>신고하기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%-- css 초기화 --%>
    <link rel="stylesheet" href="https://yarnpkg.com/en/package/normalize.css">
    <%-- bulma --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
</head>
<body>

<div class="field" style="text-align: center; margin-top: 30px">
    <label class="label" style="font-size: 24px">신고 사유 선택</label>
    <div class="control">
        <div class="select">
            <select id="reportReason" style="width: 150px">
                <option value="광고">광고</option>
                <option value="욕설">욕설</option>
                <option value="기타">기타</option>
            </select>
        </div>
    </div>
</div>
<div class="field" style="text-align: center; margin-top: 130px">
    <div class="control">
        <button class="button is-danger" onclick="submitReport()">게시글 신고</button>
        <button class="button is-light" onclick="cancel()">취소</button>
    </div>
</div>
<p id="reporterId" style="visibility: hidden">${param.id}</p>
<script>
    function submitReport() {
        let bno = <c:out value="${param.bno}" />;
        let reason = $("#reportReason").val();
        let sid = $("#reporterId").text();  // 신고자 ID

        // AJAX로 서버에 신고 정보 전송
        $.ajax({
            type: "POST",
            <%--url: "${path}/board/chkReported.do",--%>
            url: "${path}/board/report.do",
            data: {
                bno: bno,
                reason: reason,
                id: sid
            },
            dataType: "json",
            success: function(result) {
                console.log(result.result);
                var chk = result.result;
                // alert("게시글을 신고하였습니다.");
                // window.close(); // 팝업 창 닫기
                if(chk==true) {
                    alert("게시글을 신고하였습니다.");
                    window.close(); // 팝업 창 닫기
                } else {
                    alert("이미 신고한 게시글입니다.");
                    window.close();
                }
            },
            error: function(result) {
                console.log(result.result);
                alert("신고 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
    function cancel() {
        window.close();
    }


</script>
</body>
</html>
