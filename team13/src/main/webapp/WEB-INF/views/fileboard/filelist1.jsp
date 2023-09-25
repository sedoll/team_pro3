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
	<title>파일 자료 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
	<style>
		.hero {
			height: 250px;
			margin-top: 40px;
		}
	</style>
</head>
<body>
<div class="container is-fullhd">
	<!-- 헤더 부분 인클루드 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<figure class="visual" id="vs1">
		<ul class="imgbox">
			<li class="hero is-medium is-white">
				<div class="hero-body has-text-centered">
					<p class="title is-size-3">
						자료실 목록
					</p>
					<p class="subtitle is-size-5">

					</p>
				</div>
			</li>
		</ul>
	</figure>
	<div class="content" id="contents">
	    <div class="row column text-center">
	      <div class="container">
				  <table class="table table-active" id="myTable">
				  <thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>읽은횟수</th>
							<th></th>
						</tr>
				  </thead>
				  <tbody>
				  <c:forEach var="board" items="${fileboardList}">
						  <tr class="table-info">
							  <td>${board.fileBoard.postNo}</td>
							  <td><a href="${path1}/file/getFileboard.do?postNo=${board.fileBoard.postNo}">${board.fileBoard.title}</a></td>
							  <td>${board.fileBoard.regdate}</td>
							  <td>${board.fileBoard.visited}
							  </td>
							  <td>
								  <c:if test="${not empty board.fileList}">
									  <img src="${path1}/resources/img/disk.png" alt="디스크이미지" style="width:24px;height:24px;"/>
								  </c:if>
							  </td>
						  </tr>
				  </c:forEach>
				  </tbody>
			  </table>
			  <c:if test="${sid.equals('admin')}">
			  	<a href="${path1}/file/fileupload1.do" class="button is-link is-outlined">파일 자료 등록</a>
			  </c:if>
			  <script>
				  $(document).ready( function () {
					  $('#myTable').DataTable({
						  pageLength : 10,
						  order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
						  info: false,
						  dom: 't<f>p',
						  language: {
							  emptyTable: '등록된 글이 없습니다.'
						  }

					  });
				  } );
				  $(document).ready(function() {
					  $('.dataTables_paginate').css({
						  'textAlign':'left',
						  'float': 'none',
						  'margin-top':'10px',
					  });
					  $('.dataTables_filter').css({
						  'float': 'left',
						  'margin-top':'14px',
						  'margin-right':'280px'
					  });
					  $('#myTable_paginate').css({
						  'margin-right':'120px'
					  });
				  });
			  </script>
		  </div>
	    </div>
	</div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>