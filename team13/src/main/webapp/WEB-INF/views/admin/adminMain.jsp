<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>

</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="container" style="top: 100px">
    <div class="columns">
        <jsp:include page="./adminMenu.jsp"></jsp:include>


        <div class="column is-9">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="../">Teaspoon</a></li>
                    <li class="is-active"><a href="#" aria-current="page">Admin</a></li>
                </ul>
            </nav>
            <section class="hero is-white welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title">
                            어서오세요, 관리자님
                        </h1>
                        <h2 class="subtitle">
                            관리자페이지
                        </h2>
                    </div>
                </div>
            </section>
            <section class="info-tiles">
                <div class="tile is-ancestor has-text-centered">
                    <div class="tile is-parent">
                        <article class="tile is-child box">
                            <p class="title">439k</p>
                            <p class="subtitle">Users</p>
                        </article>
                    </div>
                    <div class="tile is-parent">
                        <article class="tile is-child box">
                            <p class="title">59k</p>
                            <p class="subtitle">Products</p>
                        </article>
                    </div>
                    <div class="tile is-parent">
                        <article class="tile is-child box">
                            <p class="title">3.4k</p>
                            <p class="subtitle">Open Orders</p>
                        </article>
                    </div>
                    <div class="tile is-parent">
                        <article class="tile is-child box">
                            <p class="title">19</p>
                            <p class="subtitle">Exceptions</p>
                        </article>
                    </div>
                </div>
            </section>
            <div class="columns">
                <div class="column is-6">
                    <div class="card events-card">
                        <header class="card-header">
                            <p class="card-header-title">
                                Events
                            </p>
                            <a href="#" class="card-header-icon" aria-label="more options">
                  <span class="icon">
                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                  </span>
                            </a>
                        </header>
                        <div class="card-table">
                            <div class="content">
                                <table class="table is-fullwidth is-striped">
                                    <tbody>
                                    <c:forEach items="${boardList }" var="board" varStatus="status">
                                        <tr style="line-height: 22px;">
                                            <td style="line-height: 22px; padding-left:10px; vertical-align: middle; border: none">
                                            <span class="icon-text" style="line-height: 22px;padding:0; margin: 0">
                                              <span class="icon" style="line-height: 22px;padding:0; margin: 0">
                                                <i class="fas fa-home" style="padding-top: 8px;height: 20px"><img src="${path}/resources/img/alert.png" width="20px" height="20px"></i>
                                              </span>
                                                <span style="font-weight: bold; padding-bottom: 10px;position: absolute"> [${board.reason } 신고]</span><span style="position: relative"> 제목 : ${board.title}</span>
                                            </span>
                                            </td>

                                            <td class="level-right" style="line-height: 22px; margin-bottom: 0; padding-bottom: 14px; border: none"><a class="button is-small is-link is-outlined" style="margin-top: 10px " href="${path}/${board.board_type}/detail.do?bno=${board.bno }">상세보기</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <footer class="card-footer">
                            <a href="#" class="card-footer-item">View All</a>
                        </footer>
                    </div>
                </div>
                <div class="column is-6">


                    <div class="card">
                        <header class="card-header">
                            <p class="card-header-title">
                                User Search
                            </p>
                            <a href="#" class="card-header-icon" aria-label="more options">
                  <span class="icon">
                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                  </span>
                            </a>
                        </header>
                        <div class="card-content">
                            <div class="content">
                                <div class="control has-icons-left has-icons-right">
                                    <input class="input is-large" type="text" placeholder="">
                                    <span class="icon is-medium is-left">
                      <i class="fa fa-search"></i>
                    </span>
                                    <span class="icon is-medium is-right">
                      <i class="fa fa-check"></i>
                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>