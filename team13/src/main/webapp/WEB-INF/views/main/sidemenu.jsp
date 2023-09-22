<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<style>
    .sidemenu {
        position: fixed;
        width: 120px;
        top: 50%;
        margin-top: -50px;
        right: 10px;
        background: rgba(255, 255, 255, 0.8);
        z-index: 999;
        transition: opacity 0.3s ease;
        border-radius: 10px 10px 10px 10px;
    }

    .sidemenu ul {
        position: relative;
        float: left;
        width: 100%;
        display: inline-block;
        *display: inline;
        border: 1px solid #ddd;
        border-radius: 10px 10px 10px 10px;
    }

    .sidemenu ul li {
        float: left;
        width: 100%;
        border-bottom: 1px solid #ddd;
        text-align: center;
        display: inline-block;
        *display: inline;
    }

    .sidemenu ul li a {
        position: relative;
        float: left;
        width: 100%;
        height: 30px;
        line-height: 30px;
        text-align: center;
        color: #999;
        font-size: 9.5pt;
    }

    .sidemenu ul li a:hover {
        color: #000;
    }

    .sidemenu ul li:last-child {
        border-bottom: 0;
    }
</style>

<div class="sidemenu">
    <ul>
        <li><a href="${path}/notice/list.do" class="navbar-item">공지 사항</a></li>
        <li><a href="${path}/faq/list.do" class="navbar-item">자주 묻는 질문</a></li>
        <li><a href="${path}/qna/list.do" class="navbar-item">QnA</a></li>
    </ul>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $(window).scroll(function () {
            $(".sidemenu").css("top", "50%");
        });
    });
    $(document).ready(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop() > 100) {
                $(".sidemenu").css("opacity", "1");
            } else {
                $(".sidemenu").css("opacity", "0");
            }
        });
    });
</script>