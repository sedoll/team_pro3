<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<style>
    .text02{
        margin-bottom: 20px;
    }
    .text03{
        margin-top: 10px;
        margin-bottom: 20px;
    }
    .imgsize{
        width:1200px;
        height:800px;
    }
</style>

<section class="section has-background-primary is-relative testimonial-bg-shapes">
    <div class="container">
        <div class="has-text-centered">
            <h2 class="section-title has-text-grey">서비스 소개</h2>
        </div>
        <div class="columns is-centered">
            <div class="column is-10 testimonial-slider">
                <!-- slider-item01 -->
                <div class="has-text-centered">
                    <h3 class="has-text-grey text02">정보</h3>
                    <img class="imgsize" src="${path}/resources/img/slidebanner01.jpg" alt="slide-image">
                    <br>
                    <h4 class="has-text-grey text03">
                        자녀의 교육과 관련된 핵심 정보를 한 곳에서 확인하세요.<br>
                        교육, 대입, 대외활동, 자료실 등 다양한 정보와 자료를 제공합니다.
                    </h4>
                </div>
                <!-- slider-item02 -->
                <div class="has-text-centered">
                    <h3 class="has-text-grey text02">커뮤니티</h3>
                    <img class="imgsize" src="${path}/resources/img/slidebanner02.png" alt="slide-image">
                    <br>
                    <h4 class="has-text-grey text03">
                        학부모, 학생, 그리고 교사들이 모여 정보를 공유하고 소통할 수 있는 공간입니다.<br>
                        다양한 게시판을 통해 자유롭게 의견을 나누고, 정보를 교환하세요.
                    </h4>
                </div>
                <!-- slider-item03 -->
                <div class="has-text-centered">
                    <h3 class="has-text-grey text02">내 자녀</h3>
                    <img class="imgsize" src="${path}/resources/img/slidebanner03.jpg" alt="slide-image">
                    <br>
                    <h4 class="has-text-grey text03">
                        자녀의 학교 생활을 더 가깝게 지켜보고, 관리할 수 있는 편리한 기능을 제공합니다.<br>
                        자녀의 성장과 학습 과정을 더욱 쉽게 확인하세요.
                    </h4>
                </div>
            </div>
        </div>
    </div>
</section>