<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="<%=request.getContextPath() %>" />

<style>
    .pi01 {
        margin-top: 300px;
    }
    .text02 {
        text-align: center;
    }
</style>

<section class="section pi01">
    <div class="container">
        <div class="has-text-centered">
            <h2 class="section-title">학부모가 꼭 알아야 할 정보</h2>
        </div>
        <div class="columns is-multiline">
            <div class="column is-4-desktop is-6-tablet">
                <article class="card shadow">
                    <figure class="image is-4by3">
                        <img src="${path }/resources/img/news.gif" alt="Placeholder image">
                    </figure>
                    <div class="card-content has-text-centered">
                        <h4 class="mb-10" ><a href="${path}/infoStu/list.do" class="navbar-item text02" style="padding-left: 150px;">교육정보</a>
                        </h4>
                        <p class="mb-10">최신 교육 동향과 교육 관련 뉴스를 한눈에!</p>
                        <a href="${path}/infoStu/list.do" class="button is-extra-small is-info">바로가기</a>
                    </div>
                </article>
            </div>
            <div class="column is-4-desktop is-6-tablet">
                <article class="card shadow">
                    <figure class="image is-4by3">
                        <img src="${path }/resources/img/mortarboard.gif" alt="Placeholder image">
                    </figure>
                    <div class="card-content has-text-centered">
                        <h4 class="mb-10"><a href="${path}/infoUni/list.do" class="navbar-item text02" style="padding-left: 150px;">대입정보</a>
                        </h4>
                        <p class="mb-10">대학 입시의 모든 것! 리얼 컨설팅과 신규 입시정보</p>
                        <a href="${path}/infoUni/list.do" class="button is-extra-small is-info">바로가기</a>
                    </div>
                </article>
            </div>
            <div class="column is-4-desktop is-6-tablet">
                <article class="card shadow">
                    <figure class="image is-4by3">
                        <img src="${path }/resources/img/rice.gif" alt="Placeholder image">
                    </figure>
                    <div class="card-content has-text-centered">
                        <h4 class="mb-10"><a href="${path}/menu/list.do" class="navbar-item text02" style="padding-left: 150px;">학교급식</a>
                        </h4>
                        <p class="mb-10">건강한 학교생활을 위한 우리아이 식단 체크!</p>
                        <a href="${path}/menu/list.do" class="button is-extra-small is-info">바로가기</a>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>