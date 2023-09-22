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
    <title>파일 자료 수정하기</title>
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
                        파일 자료 수정하기
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
                <form method="post" enctype="multipart/form-data" action="${path1}/file/modifyFileboard.do">
                    <table class="table table-active">
                        <tbody>
                        <tr>
                            <th>글 번호</th>
                            <td>${fileboard.fileBoard.postNo}
                                <input type="hidden" name="postNo" id="postNo" class="input" value="${fileboard.fileBoard.postNo}">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="title">제목</label></th>
                            <td><input type="text" name="title" id="title" class="input" value="${fileboard.fileBoard.title}" required></td>
                        </tr>
                        <tr>
                            <th>글 내용</th>
                            <td><textarea name="content" id="content" class="textarea" required>${fileboard.fileBoard.content}</textarea></td>
                        </tr>
                        <tr>
                            <th>첨부 파일</th>
                            <td>
                                현재 파일 : <br>
                                <c:forEach var="file" items="${fileboard.fileList}" varStatus="status">
                                    <a href="${path1}/resources/upload/${file.originFile}" title="${file.fileSize}" id="filelink${status.count}" download>${file.originFile}</a>
                                    <button type="button" class="remove_btn${status.count}" style="display:inline-block;padding:0;background-color: black;color:#fff;width:18px;height:18px;font-size:12px;line-height:18px;text-align:center;border-radius:10px;" data1="${file.no}" data2="${file.postNo}">x</button><br>
                                </c:forEach>
                                <c:if test="${empty fileboard.fileList}">
                                    첨부된 파일이 없습니다.
                                </c:if>
                                <hr>새로 첨부할 파일 : <br>
                                <div class="control">
                                    <label for="file1" class="file-label" id="file-js-example1">
                                        <span style="padding:5px;margin:5px">파일1 : </span>
                                        <input type="file" name="file1" id="file1" class="file-input">
                                        <span class="file-cta">
                                          <span class="file-icon">
                                            <i class="fas fa-upload"></i>
                                          </span>
                                          <span class="file-label">
                                            Choose a file…
                                          </span>
                                            <span class="file-name">
								            </span>
                                        </span>
                                    </label>
                                </div>
                                <div class="control">
                                    <label for="file2" class="file-label" id="file-js-example2">
                                        <span style="padding:5px;margin:5px">파일2 : </span>
                                        <input type="file" name="file2" id="file2" class="file-input">
                                        <span class="file-cta">
                                          <span class="file-icon">
                                            <i class="fas fa-upload"></i>
                                          </span>
                                          <span class="file-label">
                                            Choose a file…
                                          </span>
                                            <span class="file-name">
								            </span>
                                        </span>
                                    </label>
                                </div>
                                <div class="control">
                                    <label for="file3" class="file-label" id="file-js-example3">
                                        <span style="padding:5px;margin:5px">파일3 : </span>
                                        <input type="file" name="file3" id="file3" class="file-input">
                                        <span class="file-cta">
                                          <span class="file-icon">
                                            <i class="fas fa-upload"></i>
                                          </span>
                                          <span class="file-label">
                                            Choose a file…
                                          </span>
                                            <span class="file-name">
								            </span>
                                        </span>
                                    </label>
                                </div>
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
                                <input type="submit" class="button is-link is-outlined" value="자료 수정" />
                                <a href="${path1}/file/filelist1.do" class="button is-black is-outlined">파일 자료 목록</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <script>
                $(document).ready(function(){
                    $(".remove_btn1").click(function(){
                       var tar = {
                           no : parseInt($(this).attr("data1")),
                           postNo:parseInt($(this).attr("data2"))
                       };
                       $.ajax({
                           url:"${path1}/file/fileRemove.do", //요청URL
                           type:"post",    //요청 전송방식
                           dataType:"json",
                           data:tar,
                           success:function(){
                             console.log("파일 삭제 성공");
                             $("#filelink1").remove();
                               $(".remove_btn1").remove()
                           },
                           error:function(){
                               console.log("파일 삭제 실패");
                               $("#filelink1").remove();
                               $(".remove_btn1").remove()
                           }
                       });
                    });
                    $(".remove_btn2").click(function(){
                        var tar = {
                            no : parseInt($(this).attr("data1")),
                            postNo:parseInt($(this).attr("data2"))
                        };
                        $.ajax({
                            url:"${path1}/file/fileRemove.do", //요청URL
                            type:"post",    //요청 전송방식
                            dataType:"json",
                            data:tar,
                            success:function(){
                                console.log("파일 삭제 성공");
                                $("#filelink2").remove();
                                $(".remove_btn2").remove()
                            },
                            error:function(){
                                console.log("파일 삭제 실패");
                                $("#filelink2").remove();
                                $(".remove_btn2").remove()
                            }
                        });
                    });
                    $(".remove_btn3").click(function(){
                        var tar = {
                            no : parseInt($(this).attr("data1")),
                            postNo:parseInt($(this).attr("data2"))
                        };
                        $.ajax({
                            url:"${path1}/file/fileRemove.do", //요청URL
                            type:"post",    //요청 전송방식
                            dataType:"json",
                            data:tar,
                            success:function(){
                                console.log("파일 삭제 성공");
                                $("#filelink3").remove();
                                $(".remove_btn3").remove()
                            },
                            error:function(){
                                console.log("파일 삭제 실패");
                                $("#filelink3").remove();
                                $(".remove_btn3").remove()
                            }
                        });
                    });
                });
                </script>
                <script>
                    const fileInput1 = document.querySelector('#file-js-example1 input[type=file]');
                    fileInput1.onchange = () => {
                        if (fileInput1.files.length > 0) {
                            const fileName = document.querySelector('#file-js-example1 .file-name');
                            fileName.textContent = fileInput1.files[0].name;
                        }
                    }
                    const fileInput2 = document.querySelector('#file-js-example2 input[type=file]');
                    fileInput2.onchange = () => {
                        if (fileInput2.files.length > 0) {
                            const fileName = document.querySelector('#file-js-example2 .file-name');
                            fileName.textContent = fileInput2.files[0].name;
                        }
                    }
                    const fileInput3 = document.querySelector('#file-js-example3 input[type=file]');
                    fileInput3.onchange = () => {
                        if (fileInput3.files.length > 0) {
                            const fileName = document.querySelector('#file-js-example3 .file-name');
                            fileName.textContent = fileInput3.files[0].name;
                        }
                    }
                </script>
            </div>
        </div>
    </div>
</div>
<!-- 푸터 부분 인클루드 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>