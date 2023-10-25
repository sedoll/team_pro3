<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path13" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
          integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
          crossorigin="anonymous"/>
    <!-- 부트스트랩 4.0 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
            integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
            crossorigin="anonymous" type="text/javascript"></script>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/validateUser.css"/>
    <link href="${path13}/resources/css/myPage/com_write.css" rel="stylesheet">
    <script type="text/javascript" src="${path13}/resources/js/com_write.js" charset="UTF-8"></script>

    <title>작성글</title>


</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>

<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

    <div class="content-wrap" style="float:left; margin-left: -50px">
        <div class="content-section">
            <h5 class="font"> 작성글관리 > </h5>
            <br>

            <form class="content">

                <div id="ud_tab" style="float:left; margin-left: -20px">
                    <input type="radio" name="ud_tabs" id="tab1" checked>
                    <label for="tab1">작성글</label>
                    <input type="radio" name="ud_tabs" id="tab2">
                    <label for="tab2">작성댓글</label>


                    <div id="ud_tab-content1" class="ud_content">

                        <h5> 자유 게시판</h5>
                        <table style="width: 700px; margin-left: -20px">
                            <thead>
                            <tr>
                                <th style="width: 10%">글번호</th>
                                <th style="width: 65%; text-align: center">제목</th>
                                <th style="width: 25%; text-align: center">작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${boardlist }" var="board">
                                <tr class="boardlist1">
                                    <td>${board.num}</td>
                                    <td><a class="path"
                                           href="${path13}/board/detail.do?bno=${board.num}">${board.subject}</a>
                                    </td>
                                    <td>${board.write_date}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <%--<input type="button" id="check11" value="더보기">
                        <div class="error11"></div>--%>


                        <c:if test="${member.job == 2}">
                            <h5> 선생님 게시판</h5>
                            <table style="width: 700px; margin-left: -20px">
                                <thead>
                                <tr>
                                    <th style="width: 10%">글번호</th>
                                    <th style="width: 65%; text-align: center">제목</th>
                                    <th style="width: 25%; text-align: center">작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${boardtealist }" var="boardtea">
                                    <tr class="boardlist2">
                                        <td>${boardtea.num}</td>
                                        <td><a class="path"
                                               href="${path13}/boardTea/detail.do?bno=${boardtea.num}">${boardtea.subject}</a>
                                        </td>
                                        <td>${boardtea.write_date}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%--<input type="button" id="check12" value="더보기">
                            <div class="error12"></div>--%>
                        </c:if>

                        <c:if test="${member.job == 1}">
                            <h5> 학부모 게시판</h5>
                            <table style="width: 700px; margin-left: -20px">
                                <thead>
                                <tr>
                                    <th style="width: 10%">글번호</th>
                                    <th style="width: 65%; text-align: center">제목</th>
                                    <th style="width: 25%; text-align: center">작성일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${boardparlist }" var="boardpar">
                                    <tr class="boardlist3">
                                        <td>${boardpar.num}</td>
                                        <td><a class="path"
                                               href="${path13}/boardPar/detail.do?bno=${boardpar.num}">${boardpar.subject}</a>
                                        </td>
                                        <td>${boardpar.write_date}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%--<input type="button" id="check13" value="더보기">
                            <div class="error13"></div>--%>
                        </c:if>


                       <%-- <h5> 자료실 </h5>
                        <table>
                            <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${boardfreelist }" var="boardfreelist">
                                <tr class="boardlist4">
                                    <td>${boardfreelist.num}</td>

                                    <td><a class="path"
                                           href="${path13}/boardPar/detail.do?bno=${boardparlist.num}">${boardfreelist.subject}</a>
                                    </td>
                                    <td>${boardfreelist.write_date}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                       <input type="button" id="check14" value="더보기">
                        <div class="error14"></div>--%>

                    </div> <%-- 작성글("ud_tab-content1") 끝--%>



            <%-- ---------------------------------------------------------------------------------------------  --%>

                        <%--댓글 시작--%>
                        <div id="ud_tab-content2" class="ud_content">

                                <h5> 자유 게시판</h5>
                                <table style="width: 700px; margin-left: -20px">
                                    <thead>
                                    <tr>
                                        <th style="width: 60%; text-align: center">내용</th>
                                        <th style="width: 35%; text-align: center">작성일</th>
                                        <th style="width: 15%"></th></tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${board_comlist }" var="board_comlist">
                                        <tr class = "commentlist">
                                            <td>${board_comlist.content}</td>
                                            <td>${board_comlist.write_date}</td>
                                            <td><button type="button" class ="origin" onclick="location.href='${path13}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>
                                </table>

                                 <%--<input type="button" id="check21" value="더보기">
                                <div class="error21"></div>--%>


                                <%--<c:if test="${member.job == 2}">
                                    <h5> 선생님 게시판</h5>
                                    <table>
                                        <thead>
                                        <tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${boardtealist }" var="boardtealist">
                                            <tr class = "boardlist2">
                                                <td>${boardtealist.num}</td>
                                                <td><a class="path" href="${path13}/boardTea/detail.do?bno=${boardlist.num}">${boardtealist.subject}</a></td>
                                                <td>${boardtealist.write_date}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    &lt;%&ndash;<input type="button" id="check12" value="더보기">
                                    <div class="error12"></div>&ndash;%&gt;
                                </c:if>

                                <c:if test="${member.job == 1}">
                                    <h5> 학부모 게시판</h5>
                                    <table>
                                        <thead>
                                        <tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${boardparlist }" var="boardparlist">
                                            <tr class = "boardlist3">
                                                <td>${boardparlist.num}</td>
                                                <td><a class="path" href="${path13}/boardPar/detail.do?bno=${boardlist.num}">${boardparlist.subject}</a></td>
                                                <td>${boardparlist.write_date}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    &lt;%&ndash;<input type="button" id="check13" value="더보기">
                                    <div class="error13"></div>
                                </c:if>


                                <h5> 자료실 </h5>
                                <table>
                                    <thead>
                                    <tr><th>글번호</th><th>제목</th><th>작성일</th></tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${boardfreelist }" var="boardfreelist">
                                        <tr class = "boardlist4">
                                            <td>${boardfreelist.num}</td>
                                            <td><a class="path" href="/InfoActCtrl/board.do?num=${boardfreelist.num}">${boardfreelist.subject}</a></td>
                                            <td>${boardfreelist.write_date}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                &lt;%&ndash;<input type="button" id="check13" value="더보기">
                                <div class="error13"></div>--%>

                        </div>

              </div>
            </form>
        </div>







</div>
</div>


<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>
