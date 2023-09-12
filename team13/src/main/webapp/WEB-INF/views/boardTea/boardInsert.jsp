<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 입력</title>
    <%@ include file="../include/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="../css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="../css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <link rel="stylesheet" href="../css/ft.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height: 100vh; background-image: url("../img/login.jpg");
            background-repeat: no-repeat; background-position: center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center;  color:#fff;
            padding-bottom: 1.3em; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto;  }

        .tb1 { width:600px; margin:0 auto; font-size: 24px;}
        .tb1 th { width: 200px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}
        .tb1 td { width: 400px; line-height: 32px; padding-top:16px; padding-bottom:16px;
            border-bottom: 1px solid #333; border-top: 1px solid #333; box-sizing: border-box; text-align: center;}

        .tb1 td:last-child { line-height: 48px; padding-top:24px; padding-bottom:24px; }

        .inbtn { display:block;
            border-radius:10px;
            min-width:120px;
            padding-left: 24px;
            padding-right: 24px;
            text-align: center;
            line-height: 38px;
            background-color: #333;
            color:#fff;
            font-size: 18px;
            cursor: pointer; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
        .inbtn:hover {
            background-color: #666666;
        }
        .indata {
            display:inline-block;
            width: 590px;
            height: 32px;
            line-height: 32px;
            text-indent:10px;
            font-size:16px;
            border-radius: 5px;
            padding: 5px 15px;
        }

        textarea {
            resize: none; /* 크기 조절 기능 제거 */
            width: 600px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size:16px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <section class="hero is-primary">
        <div class="hero-body">
            <p class="title">
                선생님 게시판
            </p>
            <p class="subtitle">
                작성
            </p>
        </div>
    </section>
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
                <form action="${path}/boardTea/insert.do" id="login_frm" class="frm" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <td colspan="2"><input type="text" name="title" id="title" class="indata" value="${dto.title}" placeholder="제목 입력" autofocus required></td>
                        </tr>
                        <tr>
                            <td colspan="2"><textarea name="content" id="content" class="" cols="50" rows="15" maxlength="100" placeholder="내용 입력" required>${dto.content}</textarea></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="글쓰기" class="inbtn">
                                <input type="reset" value="취소" class="inbtn" onclick="window.history.back();">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../include/footer.jsp" %>
    </footer>
</div>
</body>
</html>