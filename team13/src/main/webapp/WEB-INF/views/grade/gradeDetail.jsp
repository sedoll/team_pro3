<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적표 상세 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>

        .content table th{
            border: 1px solid white;
        }
        .content table td{
            border: 1px solid white;
        }

        #content{
            height: 701px;
            padding-top: 24px;
        }
        .hero {
            height: 250px;
            margin-top: 40px;
        }

    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- hero -->
<section class="hero is-white is-medium">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
            성적표 상세보기
        </p>
        <p class="subtitle is-size-5">
        </p>
    </div>
</section>

<!-- content -->
<div class="content">
<div class="container is-fullhd">
    <div class="content" id="content" >
            <tbody class="container">
                <section class="page" id="page1">
                    <tbody class="page_wrap">
                        <table class="tb1 box is-size-5" style="width: 540px; margin-left: 400px; margin-top: 50px;">
                            <tbody style="">
                            <tr>
                                <th >학생 이름</th>
                                <td class="data">${grade.sname}</td>
                            </tr>
                            <tr>
                                <th >학부모님 아이디</th>
                                <td class="data">${grade.pid}</td>
                            </tr>
                            <tr>
                                <th>시험 종류</th>
                                <td class="data">${grade.exam}</td>
                            </tr>
                            <tr>
                                <th>국어</th>
                                <td class="data">${grade.kor}</td>
                            </tr>
                            <tr>
                                <th>영어</th>
                                <td class="data">${grade.eng}</td>
                            </tr>
                            <tr>
                                <th>수학</th>
                                <td class="data">${grade.math}</td>
                            </tr>
                            <tr>
                                <th>사회</th>
                                <td class="data">${grade.social}</td>
                            </tr>
                            <tr>
                                <th>과학</th>
                                <td class="data">${grade.science}</td>
                            </tr>
                            <tr>
                                <th>담당 선생님 성함</th>
                                <td class="data">${grade.tname}</td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="tb2" style="margin-left: 540px">
                            <tr>
                                <td colspan="2">
                                    <c:if test="${job == 2 || job == 0}">
                                    <a href="${path}/grade/gradeedit.do?no=${grade.no}" class="button is-outlined is-link">성적 수정</a>
                                    </c:if>
                                    <a href="/team13_war/" class="button is-black is-outlined">메인화면</a>
                                </td>
                            </tr>
                        </table>
                    </tbody>
                </section>
            </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>