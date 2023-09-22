<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<style>
    .asize{
        margin-top: 200px;
    }
    .aimgsize{
        width: 100px;
        height: 100px;
    }
</style>
<section class="section is-relative asize">
    <div class="container">
        <div class="has-text-centered">
            <h2 class="section-title">수상</h2>
        </div>
        <div class="columns is-multiline">
            <div class="column is-6 mb-80">
                <div class="media">
                    <div class="media-left aimgsize">
                        <img src="${path }/resources/img/medal.gif" alt="Placeholder image">
                    </div>
                    <div class="media-content">
                        <p class="has-text-dark mb-1">2022</p>
                        <h4>
                            사용자 친화적 디자인 상
                            <br>
                            (User-Friendly Design Award)
                        </h4>
                        <p class="mb-0 has-text-light">웹 서비스의 사용자 경험을 향상시키는 혁신적인 디자인과 직관적인 인터페이스를 도입하여 학부모들에게 효과적인 서비스를 제공하였습니다.</p>
                    </div>
                </div>
            </div>
            <div class="column is-6 mb-80">
                <div class="media">
                    <div class="media-left aimgsize">
                        <img src="${path }/resources/img/medal.gif" alt="Placeholder image">
                    </div>
                    <div class="media-content">
                        <p class="has-text-dark mb-1">2019</p>
                        <h4>
                            지속가능한 교육상
                            <br>
                            (Sustainable Education Award)
                        </h4>
                        <p class="mb-0 has-text-light">교육 서비스를 지속 가능하게 제공하고 환경적, 사회적 책임을 다하며 교육 분야에서의 미래를 고려하였습니다.</p>
                    </div>
                </div>
            </div>
            <div class="column is-6 mb-80">
                <div class="media">
                    <div class="media-left aimgsize">
                        <img src="${path }/resources/img/medal.gif" alt="Placeholder image">
                    </div>
                    <div class="media-content">
                        <p class="has-text-dark mb-1">2018</p>
                        <h4>
                            교육 협력 우수상
                            <br>
                            (Excellence in Educational Collaboration)
                        </h4>
                        <p class="mb-0 has-text-light">학교 및 교육 기관과의 협력을 촉진하며, 학부모, 교사 및 학생 간의 소통과 협력을 증진시키는데 기여하였습니다.</p>
                    </div>
                </div>
            </div>
            <div class="column is-6 mb-80">
                <div class="media">
                    <div class="media-left aimgsize">
                        <img src="${path }/resources/img/medal.gif" alt="Placeholder image">
                    </div>
                    <div class="media-content">
                        <p class="has-text-dark mb-1">2016</p>
                        <h4>
                            디지털 학부모 혁신상
                            <br>
                            (Digital Parenting Innovation Award)
                        </h4>
                        <p class="mb-0 has-text-light">디지털 리터러시와 온라인 안전에 중점을 두며, 학부모들을 디지털 시대에 적응시키고 지원하는 데 기여하였습니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>