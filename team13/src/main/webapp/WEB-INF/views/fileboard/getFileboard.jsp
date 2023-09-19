<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>파일 자료 상세보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<figure class="visual" id="vs1">
		<ul class="imgbox">
			<li class="hero is-medium is-link">
				<div class="hero-body">
					<p class="title">
						Medium hero
					</p>
					<p class="subtitle">
						Medium subtitle
					</p>
				</div>
			</li>
		</ul>
	</figure>
	<div class="content" id="contents">
	    <div class="row column text-center">
	      <h2 class="h1">파일 자료 상세보기</h2>
	      <hr>
	      <div class="container">
				  <table class="table table-active">
				  <tbody>
				  <tr>
					  <th>글 번호</th>
					  <td>${fileboard.fileBoard.postNo}</td>
				  </tr>
				  <tr>
					  <th>글 제목</th>
					  <td>${fileboard.fileBoard.title}</td>
				  </tr>
				  <tr>
					  <th>글 내용</th>
					  <td>${fileboard.fileBoard.content}</td>
				  </tr>
				  <tr>
					  <th>첨부 파일</th>
					  <td>
						  <c:forEach var="file" items="${fileboard.fileList}">
							  <a href="${path1}/resources/upload/${file.originFile}" title="${file.fileSize}" download>${file.originFile}</a>
						  </c:forEach>
						  <c:if test="${empty fileboard.fileList}">
							  첨부된 파일이 없습니다.
						  </c:if>
					  </td>
				  </tr>
				  <tr>
					  <th>작성일</th>
					  <td>${fileboard.fileBoard.regdate}</td>
				  </tr>
				  <tr>
					  <th>조회수</th>
					  <td>${fileboard.fileBoard.visited}</td>
				  </tr>
				  <tr>
					  <td>
						  <a href="${path1}/file/filelist1.do" class="button is-primary">파일 자료 목록</a>
<%--						  <c:if test="${sid.equals('admin')}">--%>
							  <a href="${path1}/file/removeFileboard.do?postNo=${fileboard.fileBoard.postNo}" class="button is-danger">자료 삭제</a>
							  <a href="${path1}/file/modifyFileboard.do?postNo=${fileboard.fileBoard.postNo}" class="button is-info">자료 수정</a>
<%--						  </c:if>--%>
					  </td>
				  </tr>
				  </tbody>
			  </table>
		  </div>
	    </div>
	</div>
	<!-- 푸터 부분 인클루드 -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>