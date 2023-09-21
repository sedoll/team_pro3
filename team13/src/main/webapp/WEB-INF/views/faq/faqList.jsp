<%--
  Created by IntelliJ IDEA.
  User: jk347
  Date: 2023-09-14
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>자주 묻는 질문</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
    .faqlist li {
    padding: 20px;
    margin: 10px 0;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s, box-shadow 0.2s;
    cursor: pointer;
    }

    .faqlist li:hover {
    transform: translateY(-3px);
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    .faqlist li .ans {
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    margin-top: 10px;
    display: none;
    }

    .que:before {
    content: "Q";
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    text-align: center;
    background-color: #ee7498;
    color: #fff;
    border-radius: 50%;
    margin-right: 10px;
    }

    .ans:before {
    content: "A";
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    text-align: center;
    background-color: #58a5fc;
    color: #fff;
    border-radius: 50%;
    margin-right: 10px;
    }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-white is-medium">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
            FAQ
        </p>
        <p class="subtitle is-size-5">
            자주 묻는 질문 목록
        </p>
    </div>
</section>
<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <ul class="faqlist">
                <c:forEach var="faq" items="${faqList }" varStatus="status">
                    <li>
                        <div class="que">${faq.question }</div>
                        <div class="ans">${faq.answer }</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <script>
            $(document).ready(function(){
                $(".faqlist li").click(function(){
                    $(this).find(".ans").slideToggle(500);
                    $(this).find(".que").toggleClass("on");
                });
            });
        </script>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>