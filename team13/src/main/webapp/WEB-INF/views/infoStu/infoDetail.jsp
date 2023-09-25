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
    <title>게시판 상세</title>
    <%@ include file="../include/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- datatables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css">
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>

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
        .contents { clear:both; min-height: 180vh; background-image: url("../img/login.jpg");
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

        .tb1 {
            width: 1200px;
            font-size: 17px;
            margin-bottom: 50px;
            border-collapse: collapse; /* 테이블 간격 없애기 */
        }

        .tb1 thead th {
            line-height: 32px;
            padding: 12px 15px; /
            /*border: 1px solid #f5f5f5; !*/
            box-sizing: border-box;
            background-color: #eeeeee; /* 배경색 조정 */
            font-size: 22px;
            font-weight: 600;
            border-radius: 10px;
        }

        .tb1 thead td {
            font-size: 16px;
            text-align: right;
            line-height: 40px;
            border-bottom: #7e7e7e 1px solid;

        }
        .tb1 thead td:nth-child(1) {
            width: 6%;
            text-align: center;
        }.tb1 thead td:nth-child(2) {
            text-align: left;
             width: 14%;
         }
        .tb1 thead td:nth-child(3) {
            font-weight: 600;
            width: 62%;
        }
        .tb1 thead td:nth-child(4) {
            width: 10%;
        }
        .tb1 thead td:nth-child(5) {
            width: 8%;

        }
        /*글 내용*/
        .tb1 tbody tr td {
            padding-left: 10px;
            padding-top: 40px;
            font-size: 18px;
            text-align: left;


        }
        .content > div {
            min-height: 400px;
            border-bottom: 1px solid #7e7e7e;
        }





        .tb2{
            width: 1200px;
        }

        .tb2 .item1 { width: 10%; }
        .tb2 .item2 { width: 68%;}
        .tb2 .item3 { width: 10%; }
        .tb2 .item4 { width: 12%;}

        .tb2 td {
            border-bottom: 1px solid #7e7e7e;
            vertical-align: middle;
            height: 60px;
        }

        .tb2 thead tr th{
            text-align: center;
        }
        .tb2 tbody tr td:first-child{
            text-align: center;
            font-weight: bold;

        }
        .tb2 tbody tr td:nth-child(2){
            word-break: break-word;

        }
        .tb2 tbody tr td:nth-child(3){
            text-align: center;
        }

        .inbtn, .delete_btn {
            display: inline-block;
            border-radius: 5px;
            width: 50px;
            line-height: 28px;
            text-align: center;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s; /* 마우스 오버 효과 */
        }

        .inbtn {
            background-color: #333;
            color: #fff;
        }

        .delete_btn {
            background-color: red;
            color: #fff;
        }

        .inbtn:hover, .delete_btn:hover {
            background-color: #555;
        }

        .frm {
            margin-top: 50px;
        }

        /*.frm tr > * {*/
        /*    margin-right: 10px;*/
        /*}*/

        .btn_group {
            margin-top: 50px;
        }

        #ans_btn {

            border-radius: 5px;
            width: 80px; /* 버튼 크기  */
            padding: 7px 15px;
            text-align: center;
        }



        .tb3{
            width: 1200px;
            height: 140px;
            margin-bottom: 50px;
            background-color: #eeeeee;
            border-radius: 10px;
        }

        .tb3 th {
            line-height: 100px;

            text-align: center;
            vertical-align: middle;

        }
        .tb3 th:first-child{
            width: 15%;
            font-weight: bold;
            font-size: 18px;

        }
        .tb3 th:nth-child(2){
            width: 70%;
        }
        .tb3 th:last-child{
            width: 15%;

        }
        textarea {
             resize: none;
             padding: 10px;
             height: 80px;
             border: 1px solid #ccc;
             border-radius: 5px;
             vertical-align: middle;
         }
        #nologin_comment {
            width: 1200px;
            text-align: center;
            padding-top: 60px;
            position: absolute;
            font-weight: bold;
        }

        .hero {
            height: 250px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <section class="hero is-white is-medium">
        <div class="hero-body has-text-centered">
            <p class="title is-size-3">
                교육 정보
            </p>
            <p class="subtitle is-size-5">
                상세
            </p>
        </div>
    </section>
    <div class="contents" id="contents">
        <section class="page" id="page1">
            <div class="page_wrap">
                <table class="tb1">
                    <thead>
                        <tr class="title">
                            <th colspan="5" style="width: 10%">${dto.title}</th>
                        </tr>
                        <tr>
                            <td style="width: 5%">
                                <c:if test="${dto.author eq sid && not empty sid}">
                                <a href="${path}/infoStu/edit.do?bno=${dto.bno}" class="button is-link is-outlined">수정</a>
                                </c:if>
                            </td>
                            <td style="width: 55%">
                                <c:if test="${not empty sid && (sid eq 'admin' || dto.author eq sid)}">
                                <a href="${path}/infoStu/delete.do?bno=${dto.bno}" class="button is-danger is-outlined" >삭제</a>
                               </c:if>
                            </td>
                            <td style="width: 10%">${dto.author}</td>
                            <td style="width: 20%">${dto.resdate}</td>
                            <td style="width: 10%">조회수 : ${dto.cnt}</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="5" class="content">
                            <div>
                                ${dto.content}
                            </div>
                        </td>
                    </tr>
                    </tbody>

                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../include/footer.jsp" %>
    </footer>
</div>
</body>
</html>