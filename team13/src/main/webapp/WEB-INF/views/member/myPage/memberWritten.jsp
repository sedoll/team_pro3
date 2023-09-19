<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="path1" value="${pageContext.request.contextPath }"/>--%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="kr.co.teaspoon.dto.BoardlistVO" %>
<%@ page import="kr.co.teaspoon.dto.CommentlistVO" %>

<%

    List<BoardlistVO> board = (List<BoardlistVO>)request.getAttribute("board");
    List<CommentlistVO> commentlist_al = (List<CommentlistVO>)request.getAttribute("c_listal");
    List<BoardlistVO> boardlist_fd = (List<BoardlistVO>)request.getAttribute("b_listfd");
    List<CommentlistVO> commentlist_fd = (List<CommentlistVO>)request.getAttribute("c_listfd");
    List<BoardlistVO> boardlist_fa = (List<BoardlistVO>)request.getAttribute("b_listfa");
    List<CommentlistVO> commentlist_fa = (List<CommentlistVO>)request.getAttribute("c_listfa");
    List<BoardlistVO> boardlist_ah = (List<BoardlistVO>)request.getAttribute("b_listah");
    List<CommentlistVO> commentlist_ah = (List<CommentlistVO>)request.getAttribute("c_listah");
    List<BoardlistVO> boardlist_co = (List<BoardlistVO>)request.getAttribute("b_listco");
    List<CommentlistVO> commentlist_co = (List<CommentlistVO>)request.getAttribute("c_listco");
    List<BoardlistVO> boardlist_p = (List<BoardlistVO>)request.getAttribute("b_listp");
    List<CommentlistVO> commentlist_p = (List<CommentlistVO>)request.getAttribute("c_listp");
    List<BoardlistVO> boardlist_m = (List<BoardlistVO>)request.getAttribute("b_listm");
    List<CommentlistVO> commentlist_m = (List<CommentlistVO>)request.getAttribute("c_listm");
%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="resources/img/title.png" rel="shortcut icon" type="image/x-icon">
    <title>작성 글</title>

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <!-- 부트스트랩 4.0 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>

    <link href="resources/css/com_write.css" rel="stylesheet">
    <script type="text/javascript" src="resources/js/com_write.js" charset="UTF-8"></script>

    <script>
        $('.search-box btn').click(function(){

        });
        $('#keyword').keypress(function(event){
            if(event.which == 13){
                $('.search-box btn').click();
                return false;
            }
        });
    </script>
    <style>
        /* 공통으로 사용하는 CSS */
        @charset "utf-8";

        * {
            margin:0;
            padding: 0;
        }
        html{
            margin:0 auto;
            width : 100%;
            height: 100%;
            overflow: auto;
        }
        body::-webkit-scrollbar {

            display: none;

        }

        body {
            margin: 0;
            height: auto;
            min-height : 600px;
            box-sizing : content-box;
            line-height: 1.7;
            color: gray;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 300;
            font-size: .9rem;
        }
        .path{
            text-decoration : none;
            color : #000000;
        }

        a{
            text-decoration : none;
            color : #9494b8;
        }
        a:hover {
            color: #0056b3;
            text-decoration: none;
        }

        body {
            text-align: -webkit-center;
            display : flex;
            flex-direction : column;
            justify-content : space-between;
        }

        .body_content{
            margin : 0;
            padding : 0;
            width : 100%;
            height:100vh;
            display : flex;
            flex-direction : column;
        }

        #header {
            width: 100%;
            height: 189px;
            box-sizing: content-box;
            display: flex;
            flex-direction: column;
            border-bottom: 1px solid #efefef;
            padding-bottom: 18px;
            background-color : #fff;
            position : fixed;
            z-index : 10000;
            top : 0;
            left : 0;
            right : 0;
        }

        .inout_gocen{
            position : inline;
            display : flex;
            justify-content : flex-end;
            margin-top : 20px;
            margin-right : 340px;
            background-color : #fff;
        }
        .fixinner{
            position: fixed;
        }
        .header-top {
            margin-top : -10px;
            display : flex;
            justify-content : flex-start;
            margin-right: auto;
        }
        .header_btn{
            width : 70px;
            height : 30px;
            background-color : #fff;
            color : #9494b8;
            border-radius: 5px;
            border : none;
            outline : 0;
        }
        .header_btn:hover{
            color : #6200cc;
            font-weight: 700;
        }
        #logout, #mypage{
            display : none;
        }
        .img-circle{
            width : 450px;
            height : 150px;
            display: block;
            margin : 0 auto;
        }
        .nav-menu{
            margin : 0 auto;
            display : flex;
            justify-content : space-around;
            align-items: baseline;
            width: 1200px;
        }
        .sticky-wrapper{
            width: 400px;
            height: 50px;
            margin : 0;
            margin-left: 0;
            position: sticky;
            list-style : none;
            display : flex;
            padding: 0;
        }

        .sticky-wrapper > li{
            padding : 8px 8px;
            list-style-type:none;
            float: left;
        }
        .sticky-wrapper > ul{
            padding : 8px 8px;
        }

        li.dropdown {
            color: #9494b8;
            background: #fff;
            transition: .3s all ease;
            font-size: 20px;
            width: 90px;
            height: 50px;
        }

        .sticky-wrapper.active{
            position: fixed;
            top: 0px;
        }

        /* dropdown */
        .dropdown-menu {
            display: none;
            justify-content : flex-start;
            position: absolute;
            list-style : none;
            visibility: visible;
            background-color: #fff;
            width: 1200px;
            top : 48px;
            margin-left : -30px;
            border: none;
            border-top: 1px solid #efefef;
        }

        .board {
            padding-left: 46px;
        }
        .care {
            padding-left: 30px;
        }
        .commu {
            padding-left: 35px;
        }

        li.dropdown > a {
            text-decoration: none;
        }

        .dropdown-menu li{
            margin-right : 40px;
        }
        .dropdown:hover .dropdown-menu {
            display: flex;
            visibility: visible;
        }

        /* search-wrapper */
        .search-wrapper {
            padding : 5px;
            width: 280px;
            height: 38px;
            display: flex;
            justify-content : space-betwwen;
            background: #fff;
            border: 2px solid #9494b8;
            border-radius: 10px;
        }
        .search-box {
            height : 100%;
            padding: 0;
            border: none;
            background: #fff;
        }
        .search-box.input {
            width : 80%;
            margin-left : 15px;
            font-size : .9rem;
        }
        .search-box.input:focus {outline:none;}

        body::-webkit-scrollbar {
            display: none;
        }

        .search-box.btn {
            color : #9494b8;
            text-align : left;
            font-size: 1rem;
        }


        /* search-wrqpper */

        .main-content{
            width : 100%;
            height : auto;
            margin : 0 auto;
        }


        /* footer */
        #footer {
            margin: 0 auto;
            width: fit-content;
            bottom: 20px;
            position: relative;
        }

        p{
            text-align : center;
            margin-top: 50px;
            font-size: 16px;
        }
        .fa-heart{
            color : red;
        }

        /* pageup button */
        .back-to-top{
            width : 40px;
            height : 40px;
            margin : 0 auto;
            font-size : 24px;
            color : white;
            background-color : #149DDD;
            border-radius : 50%;
            visibility : visible;
            position: fixed;
            bottom: 45px;
            right: 30px;
            text-align : center;
        }
        /* pageup button */
        *, ::after, ::before {
            box-sizing: border-box;
        }


        /*카카오톡 톡상담*/
        .kakaoChat {
            text-align: right;
            position: fixed;
            margin-right: 28px;
            bottom: 90px;
            right: 0;
        }
        .kakao_btn {
            border-radius: 1rem!important;
        }

        /* side menu와 내용 묶음 */
        .content-wrap {
            width: 1200px;
            min-height: 100%;
            margin: 0 auto;
            position: relative;
            top: 50px;

        }
        /* side menu 틀*/
        .sidemenu-section {
            width: 200px;
            font-size: 18px;
            text-align: left;
            min-height: 740px;
            border-right-color: darkblue;
            border-right: 1px solid #efefef;
            padding: 0px 0px 0 0;
            margin-left: 0;
            margin-top: 210px;
            position: fixed;
        }


        /* 내용 틀*/
        .content-section {
            width: 1001px;
            height: max-content;
            position: relative;
            left: 100px;
            text-align: left;
            font-size: 14px;
            margin-top: 0px;
            color: black;
            margin-left: 0;
            padding-bottom: 100px;
            border-left-color: darkblue;
            border-left: 1px solid #efefef;
            padding-left: 50px;
            padding-right: 0;
            min-height: 940px;
            padding-top: 200px;
        }

        /* 각각의 페이지에서 사용할 CSS */
        .list-group {
            border-bottom: 1px solid rgba(0,0,0,.125);
        }
        .list-group-item {
            position: relative;
            display: block;
            padding: .75rem 1.25rem;
            margin-bottom: -1px;
            background-color: white;
            border: 1px solid rgba(0,0,0,.125);
        }
        /* 현재 페이지의 서브메뉴 */
        li.list-group-item.click > a {
            font-weight: bold;
            color: #5c5c8a;
        }


        .list-group-item > a {
            text-decoration : none;
        }


    </style>

</head>






<body>
<div class ="body_content">
<header id = "header">

	<div class ="inout_gocen">
         <%if(email != null){ %>

         <input  type="button" class= "header_btn"  value="로그아웃" onclick="location.href='logout.me'">
         <input  type="button" class= "header_btn"  value="마이페이지" onclick="location.href='mypage.me'">
         <%}else{ %>
         <input  type="button" class= "header_btn" value="로그인" onclick="location.href='loginForm.me'">
         <input  type="button" class= "header_btn" value="회원가입" onclick="location.href='joinform.me'">
         <%} %>
         <a href="customer_service.me"><input type="button" class= "header_btn" id="gocen" value="고객센터"></a>
      </div>

	 <div class="nav-menu">
            <ul class="sticky-wrapper">
               <li class="dropdown"><a href="home.me">HOME</a></li>
               <li class="dropdown"><a href="home_list.bo">분양</a>
                  <ul class="dropdown-menu board">
                     <li><a href="home_list.bo">&nbsp;&nbsp;가정분양</a></li>
                     <li><a href="fdoclist.bo">책임분양</a></li>
                     <li><a href="selladopt_list.bo">업체분양</a></li>
                  </ul></li>
               <li class="dropdown"><a href="SJ/pet_list">보호소</a>
                  <ul class="dropdown-menu care">
                     <li><a href="SJ/pet_list">&nbsp;&nbsp;&nbsp;&nbsp;보호소</a></li>
                     <li><a href="SJ/payang/list">파양</a></li>
                     <li><a href="SJ/missing/list">실종</a></li>
                  </ul></li>
               <li class="dropdown"><a href="doclist.bo">커뮤니티</a>
                  <ul class="dropdown-menu commu">
                     <li><a href="doclist.bo">&nbsp;자유게시판</a></li>
                     <li><a href="auth_fdoc.bo">책임분양인증</a></li>
                     <li><a href="hospital_map.me">Map</a></li>
                  </ul></li>
            </ul>

	<div class="header-top">
		<div class="mainlogo">
		<a href="home.me">
		<img src = "resources/img/mainlogo.png" class = "img-circle">
		</a>
		</div>
	</div>
	<form action="home_search.me" method="post" name="home_search">
				<div class="search-wrapper">
					<input class="search-box input" id="keyword" name="keyword" type="text" placeholder="Search">
					<button class="search-box btn" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
			 </form>
	</div><!-- nav-menu -->
	<div class ="blank"></div>
</header>

		<div class="main-content">
			<div class="content-wrap">

			<!-- 왼쪽. 서브메뉴가 들어갈 부분 -->
			<div class="sidemenu-section">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="cominfo_member.me">회원정보</a></li>
				<li class="list-group-item click"><a href="cominfo_list.me">작성글관리</a></li>
				<li class="list-group-item"><a href="cominfo_main.do">분양관리</a></li>
			</ul>
			</div>

			<!-- 오른쪽. 내용이 들어갈 부분 -->
			<div class="content-section">
				<h5 class ="font"> 작성글관리 > </h5>
				<br>
	<frm class = "content">
		<div id="ud_tab">
		  <input type="radio" name="ud_tabs" id="tab1" checked>
  		  <label for="tab1">작성글</label>
  		  <input type="radio" name="ud_tabs" id="tab2">
          <label for="tab2">작성댓글</label>
  		  <div id="ud_tab-content1" class="ud_content">


    		<%
			if(boardlist_al.size() != 0 || boardlist_fd.size() != 0 || boardlist_fa.size() != 0 || boardlist_ah.size() != 0 || boardlist_co.size() != 0 || boardlist_p.size() != 0 || boardlist_m.size() != 0){
    	 		if(boardlist_al.size() != 0){
    		%>
    		<h5> 업체분양(<%=boardlist_al.size() %>) </h5>
    		<table>
  				<thead>
  					<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
  				</thead>
  			<tbody>
  			<% for(BoardlistVO b_list : boardlist_al){	 %>
    		<tr class = "boardlist1">

    			<td><a class="path" href="Selladopthomeview.bo?num=<%= b_list.getNum()%>"><%=b_list.getNum() %></a></td>
    			<td><a class="path" href="Selladopthomeview.bo?num=<%= b_list.getNum()%>"><%=b_list.getSubject() %></a></td>
    			<td><a class="path" href="Selladopthomeview.bo?num=<%= b_list.getNum()%>"><%=b_list.getWrite_date() %></a></td>
    		</tr>
   			<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check11" value="더보기">
   			<div class="error11"></div>
   			<% } %>
   			<%
    	 		if(boardlist_fd.size() != 0){
    	 	%>
    		<h5> 책임분양(<%=boardlist_fd.size() %>) </h5>

    	 	<table>
  				<thead>
  					<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
  				</thead>
  			<tbody>
    		<%	for(BoardlistVO b_list : boardlist_fd){	%>
    		<tr class = "boardlist tr">
    			<td><a class="path" href="fdocdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getNum() %></a></td>
    			<td><a class="path" href="fdocdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getSubject() %></a></td>
    			<td><a class="path" href="fdocdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getWrite_date() %></a></td>
    		</tr>
   			<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check12" value="더보기">
   			<div class="error12"></div>
   			<% } %>
   			<%
    	 		if(boardlist_fa.size() != 0){ %>
    		<h5> 책임인증글(<%=boardlist_fa.size() %>) </h5>

    	 	<table>
  				<thead>
  					<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
  				</thead>
  			<tbody>
    		<%for(BoardlistVO b_list : boardlist_fa){  		%>
    			<tr class = "boardlist tr">
    			<td><a class="path" href="fadocdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getNum() %></a></td>
    			<td><a class="path" href="fadocdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getSubject() %></a></td>
    			<td><a class="path" href="fadocdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getWrite_date() %></a></td>
    		</tr>
   			<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check13" value="더보기">
   			<div class="error13"></div>
   			<% } %>
   			<%
    	 		if(boardlist_ah.size() != 0){ %>
    		<h5>가정분양(<%=boardlist_ah.size() %>) </h5>

    	 	<table>
      			<thead>
      				<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
      			</thead>
      		<tbody>
    		<%	for(BoardlistVO b_list : boardlist_ah){    		%>
    		<tr class = "boardlist tr">
    			<td><a class="path" href="adopthomeview.bo?num=<%=b_list.getNum() %>"><%=b_list.getNum() %></a></td>
    			<td><a class="path" href="adopthomeview.bo?num=<%=b_list.getNum() %>"><%=b_list.getSubject() %></a></td>
    			<td><a class="path" href="adopthomeview.bo?num=<%=b_list.getNum() %>"><%=b_list.getWrite_date() %></a></td>
    		</tr>
   			<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check14" value="더보기">
   			<div class="error14"></div>
   			<% } %>
   			<%
    	 		if(boardlist_co.size() != 0){%>
    		<h5> 자유게시판(<%=boardlist_co.size() %>) </h5>
    	 	<table>
      			<thead>
      				<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
      			</thead>
      		<tbody>
    		<%
    			for(BoardlistVO b_list : boardlist_co){
    		%>
    		<tr class = "boardlist tr">
    			<td><a class="path" href="docdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getNum() %></a></td>
    			<td><a class="path" href="docdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getSubject() %></a></td>
    			<td><a class="path" href="docdetail.bo?doc_no=<%= b_list.getNum()%>"><%=b_list.getWrite_date() %></a></td>
    		</tr>
   			<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check15" value="더보기">
   			<div class="error15"></div>
   			<% } %>
   			<%
    	 		if(boardlist_p.size() != 0){%>
    		<h5> 파양게시판(<%=boardlist_p.size() %>) </h5>

    	 	<table>
      			<thead>
      				<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
      			</thead>
      		<tbody>
    		<%
    			for(BoardlistVO b_list : boardlist_p){
    		%>
    		<tr class = "boardlist tr">
    			<td><a class="path" href=""><%=b_list.getNum() %></a></td>
    			<td><a class="path" href=""><%=b_list.getSubject() %></a></td>
    			<td><a class="path" href=""><%=b_list.getWrite_date() %></a></td>
    		</tr>
   			<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check16" value="더보기">
   			<div class="error16"></div>
   			<% } %>
   			<%
    	 		if(boardlist_m.size() != 0){%>
    		<h5> 실종게시판(<%=boardlist_m.size() %>) </h5>

    	 	<table>
      			<thead>
      				<tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
      			</thead>
      		<tbody>
    		<%
    			for(BoardlistVO b_list : boardlist_m){
    		%>
    		<tr class = "boardlist tr">
    			<td><a class="path" href=""><%=b_list.getNum() %></a></td>
    			<td><a class="path" href=""><%=b_list.getSubject() %></a></td>
    			<td><a class="path" href=""><%=b_list.getWrite_date() %></a></td>
    		</tr>
   			<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check17" value="더보기">
   			<div class="error17"></div>
   			<% }} else{%>
   			<p> 작성글이 없습니다. </p>
   			<% } %>
  		</div><!-- tab1 -->
  		<div id="ud_tab-content2" class="ud_content">


    		<%
			if(commentlist_al.size() != 0 || commentlist_fd.size() != 0 || commentlist_fa.size() != 0 || commentlist_ah.size() != 0 || commentlist_co.size() != 0 || commentlist_p.size() != 0 || commentlist_m.size() != 0){
    			if(commentlist_al.size() != 0){ %>
    		<h5> 업체분양(<%=commentlist_al.size() %>) </h5>
    	<table>
  			<thead>
  				<tr><th>내용</th><th colspan="2">작성일</th></tr>
  			</thead>
  			<tbody>
    		<% for(CommentListVO c_list : commentlist_al){
    		%>
    			<tr class = "commentlist">
    			<a href="Selladopthomeview.bo?num=<%= c_list.getDoc_no()%>">
    				<td><%=c_list.getContent() %></td>
    				<td><%=c_list.getWrite_date() %></td>
    				<td><button type="button" class ="origin" onclick="location.href='Selladopthomeview.bo?num=<%= c_list.getDoc_no()%>'">원문보기</button></td>
    			</a>
    			</tr>
    		<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check21" value="더보기">
   			<div class="error21"></div>
   			<% } %>
    		<%
    			if(commentlist_fd.size() != 0){ %>
    		<h5> 책임분양(<%=commentlist_fd.size() %>) </h5>

    	    	<table>
      			<thead>
      				<tr><th>내용</th><th  colspan="2">작성일</th></tr>
      			</thead>
      			<tbody>
        		<%
    			for(CommentListVO c_list : commentlist_fd){
    		%>
    			<tr class = "commentlist">
    			<a href="fdocdetail.bo?doc_no=<%= c_list.getDoc_no()%>">
    				<td><%=c_list.getContent() %></td>
    				<td><%=c_list.getWrite_date() %></td>
    				<td><button type="button" class ="origin" onclick="location.href='fdocdetail.bo?doc_no=<%= c_list.getDoc_no()%>'">원문보기</button></td>
    			</a>
    			</tr>
    		<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check22" value="더보기">
   			<div class="error22"></div>
   			<% } %>
    		<%
    			if(commentlist_fa.size() != 0){ %>
        		<h5> 책임인증글(<%=commentlist_fa.size() %>) </h5>

    	    	<table>
      			<thead>
      				<tr><th>내용</th><th  colspan="2">작성일</th></tr>
      			</thead>
      			<tbody>
        		<%
    			for(CommentListVO c_list : commentlist_fa){
    		%>
    			<tr class = "commentlist">
    			<a href="fadocdetail.bo?doc_no=<%=c_list.getDoc_no()%>">
    				<td><%=c_list.getContent() %></td>
    				<td><%=c_list.getWrite_date() %></td>
    				<td><button type="button" class ="origin" onclick="location.href='fadocdetail.bo?doc_no=<%= c_list.getDoc_no()%>'">원문보기</button></td>
    			</a>
    			</tr>
    	<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check23" value="더보기">
   			<div class="error23"></div>
   			<% } %>
    		<%
    			if(commentlist_ah.size() != 0){%>
       		<h5> 가정분양(<%=commentlist_ah.size() %>) </h5>

    	    	<table>
      			<thead>
      				<tr><th>내용</th><th  colspan="2">작성일</th></tr>
      			</thead>
      			<tbody>
        		<%
    			for(CommentListVO c_list : commentlist_ah){
    		%>
    			<tr class = "commentlist">
    			<a href="adopthomeview.bo?num='+<%=c_list.getDoc_no() %>+'">
    				<td><%=c_list.getContent() %></td>
    				<td><%=c_list.getWrite_date() %></td>
    				<td><button type="button" class ="origin" onclick="location.href='adopthomeview.bo?num=<%= c_list.getDoc_no()%>'">원문보기</button></td>
    			</a>
    			</tr>
    		<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check24" value="더보기">
   			<div class="error24"></div>
   			<% } %>
    		<%
    			if(commentlist_co.size() != 0){%>
      		<h5> 자유게시판(<%=commentlist_co.size() %>) </h5>
    	    	<table>
      			<thead>
      				<tr><th>내용</th><th colspan="2">작성일</th></tr>
      			</thead>
      			<tbody>
        		<%
    			for(CommentListVO c_list : commentlist_co){
    		%>
    			<tr class = "commentlist">
    				<td><%=c_list.getContent() %></td>
    				<td><%=c_list.getWrite_date() %></td>
    				<td><button type="button" class="origin" onclick="location.href='docdetail.bo?doc_no=<%= c_list.getDoc_no()%>'">원문보기</button></td>
    			</tr>
    		<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check25" value="더보기">
   			<div class="error25"></div>
   			<% } %>
    		<%
    			if(commentlist_p.size() != 0){%>
     		<h5> 파양게시판(<%=commentlist_p.size() %>) </h5>

    	    	<table>
      			<thead>
      				<tr><th>내용</th><th  colspan="2">작성일</th></tr>
      			</thead>
      			<tbody>
        		<%
    			for(CommentListVO c_list : commentlist_p){
    		%>
    			<tr class = "commentlist">
    				<td><%=c_list.getContent() %></td>
    				<td><%=c_list.getWrite_date() %></td>
    				<td><button type="button" class ="origin" onclick="location.href='<%= c_list.getDoc_no()%>'">원문보기</button></td>
    			</tr>
    		<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check26" value="더보기">
   			<div class="error26"></div>
   			<% } %>
    		<%
    			if(commentlist_m.size() != 0){%>
     		<h5> 실종게시판(<%=commentlist_m.size() %>) </h5>

    	    	<table>
      			<thead>
      				<tr><th>내용</th><th  colspan="2">작성일</th></tr>
      			</thead>
      			<tbody>
        		<%
    			for(CommentListVO c_list : commentlist_m){
    		%>
    			<tr class = "commentlist">
    				<td><%=c_list.getContent() %></td>
    				<td><%=c_list.getWrite_date() %></td>
    				<td><button type="button" class ="origin" onclick="location.href='<%= c_list.getDoc_no()%>'">원문보기</button></td>
    			</tr>
    		<% } %>
  			</tbody>
  			</table>

   			<input type="button" id="check27" value="더보기">
   			<div class="error27"></div>
   			<% }} else{%>
   			<p> 작성댓글이 없습니다. </p>
   			<% } %>
  		</div><!-- tab2 -->
	</div>
	</frm>

			</div>


		</div>
		<footer id="footer">
		<p>Copyright ©2021 All rights reserved | This template is made with <i class="fas fa-heart"></i> by SamSam
		</footer>
		</div>


	<!-- 카카오톡 채널 상담 -->
	<div class="kakaoChat">
	<a href="javascript:void plusFriendChat()">
    <img src="resources/img/kakaolink_btn_medium.png" width="45px" height="45px" class="kakao_btn">
	</a>
	</div>

	<!-- pageup button -->
	<div class ="back-to-top">
	<a href="#" class ="back-to-top" style="display: inline;">
	<i class = "fas fa-angle-up"></i>
	</a>
	</div>

</div><!-- 바디컨텐트 -->

<script>

$(window).scroll(function(){
    var height = $(document).scrollTop(); //실시간으로 스크롤의 높이를 측정
    if(height > 190){
      $('#header').addClass('fixinner');

    }else if(height == 0){
      $('#header').removeClass('fixinner');
    }
  });

</script>

<!-- 부트스트랩 4.0 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- 카카오톡 채널 상담 js -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('be685f4c6119a7e447cd31c67878faf1');
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    function plusFriendChat() {
        Kakao.Channel.chat({
              channelPublicId: '_cjxmxiK' // 카카오톡채널 홈 URL에 명시된 홈ID
        });
    }

  //]]>
</script>

</body>
</html>