
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path1" value="/team13_war" />
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>티스푼 메인 페이지</title>
    <jsp:include page="./include/head.jsp"/>
</head>

<body>
    <jsp:include page="./include/header.jsp"/>
    <section class="hero is-primary">
        <div class="hero-body">
            <p class="title">
                Primary hero
            </p>
            <p class="subtitle">
                Primary subtitle
            </p>
        </div>
    </section>
    <div class="container is-fullhd">
        <h2>티스푼 메인 페이지</h2>
        <div class="container">
            <div class="columns">
                <div class="column is-4-tablet">
                    <h5 class="has-text-light">Email</h5>
                    <p class="has-text-white paragraph-lg font-secondary">steve.fruits@email.com</p>
                </div>
                <div class="column is-4-tablet">
                    <h5 class="has-text-light">Phone</h5>
                    <p class="has-text-white paragraph-lg font-secondary">+880 2544 658 256</p>
                </div>
                <div class="column is-4-tablet">
                    <h5 class="has-text-light">Address</h5>
                    <p class="has-text-white paragraph-lg font-secondary">125/A, CA Commercial Area, California, USA</p>
                </div>
            </div>
        </div>
    </div>
    <div class="section is-small has-text-centered has-border-top is-border-dark">
        <p class="has-text-light">Copyright ©
            <script>
                var CurrentYear = new Date().getFullYear()
                document.write(CurrentYear)
            </script> a theme by <a href="themefisher.com">themefisher.com</a></p>
    </div>
    <jsp:include page="./include/footer.jsp"/>
</body>
</html>
