<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<style>
    .mainjoin {
        font-size: 32px;
        font-weight: 700;
        line-height: 1.6;
        color: #191f28;
        text-align: center;
        margin-top: 200px;
        margin-bottom: 300px;
    }
</style>

<section class="section">
    <div class="container">
        <div class="columns is-centered">
            <div class="column is-four-fifths-desktop has-text-centered">
                <p class="mainjoin">
                    내 아이의 하루를 담다, 부모의 하루를 열다 "T spoon"
                    <br>
                    <br>
                    아이 교육에 필요한 정보만을 한 번에 담은 우리 아이 통합 관리 플랫폼!
                    <br>
                    <br>
                    지금 바로 가입하세요!
                    <br>
                    <br>
                    <a href="${path}/member/term.do" class="button is-link is-rounded b1 button is-large" >
                    회원가입
                    </a>
                </p>
            </div>
        </div>
    </div>
</section>