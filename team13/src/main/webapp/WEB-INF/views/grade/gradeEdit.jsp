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
    <title>성적표 수정</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<figure class="visual" id="vs1">
    <ul class="imgbox">
        <li class="hero is-link">
            <div class="hero-body has-text-centered">
                <p class="title is-size-4">
                    성적표 수정
                </p>
                <p class="subtitle is-size-5">
                    Medium subtitle
                </p>
            </div>
        </li>
    </ul>
    <nav class="breadcrumb is-small has-bullet-separator is-right" aria-label="breadcrumbs">
        <ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
        </ul>
    </nav>
</figure>
<div class="content" id="content">
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
        <div class="row column text-center">
            <div class="container">
                <form action="${path }/grade/gradeedit.do" method="post">
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            <tr>
                                <th><label for="exam">시험 종류</label></th>
                                <td><input type="text" name="exam" id="exam" class="input" value="${grade.exam }" required>
                            </tr>
                            <tr>
                                <th><label for="kor">국어</label></th>
                                <td><input type="text" name="kor" id="kor" class="input"  value="${grade.kor }" required></td>
                            </tr>
                            <tr>
                                <th><label for="eng">영어</label></th>
                                <td><input type="text" name="eng" id="eng"  class="input" value="${grade.eng }" required></td>
                            </tr>
                            <tr>
                                <th><label for="math">수학</label></th>
                                <td><input type="text" name="math" id="math" class="input" value="${grade.math }" required>
                            </tr>
                            <tr>
                                <th><label for="social">사회</label></th>
                                <td><input type="text" name="social" id="social" class="input" value="${grade.social }" required>
                            </tr>
                            <tr>
                                <th><label for="science" >과학</label></th>
                                <td><input type="text" name="science" id="science" class="input" value="${grade.science }" required>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <input type="submit" class="button is-link" value="수정">
                                    <a href="${path }/grade/gradedelete.do?no=${grade.no }" class="button is-primary">성적 삭제</a>
                                    <a href="${path }/grade/gradelist.do" class="button is-primary">회원 목록</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
        <!-- 푸터 부분 인클루드 -->
        <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>