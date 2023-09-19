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
    <title>글 수정하기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <script type="text/javascript" src="${path }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-primary">
                <div class="hero-body">
                    <p class="title">
                        교육 정보
                    </p>
                    <p class="subtitle">
                        글수정
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="content" id="contents">
        <div class="row column text-center">
            <div class="container">
                <form action="${path }/infoStu/edit.do" method="post">
                    <table id="table1">
                        <tbody>
                        <tr>
                            <th style="background-color:#dcdcdc">글 제목</th>
                            <td>
                                <input type="hidden" name="bno" id="bno" value="${dto.bno }" >
                                <input type="text" name="title" id="title" class="input" placeholder="제목 입력" value="${dto.title }" maxlength="98" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color:#dcdcdc">글 내용</th>
                            <td>
			      				<textarea name="content" class="textarea" id="content" placeholder="내용 입력" rows="8" cols="100" maxlength="800" required>
                                    ${dto.content }
                                </textarea>
                                <script>
                                    CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/infoStu/imageUpload.do'});
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" class="submit button is-danger" value="글 수정" >
                                <a class="button is-info" href="${path }/infoStu/list.do">글 목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>