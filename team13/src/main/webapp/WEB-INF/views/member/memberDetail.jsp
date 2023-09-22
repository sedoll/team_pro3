<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="/pro3_war" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 보기</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
    <jsp:include page="../include/header.jsp"></jsp:include>
    <figure class="visual" id="vs1">
        <ul class="imgbox">
            <li class="hero is-medium is-whtie">
                <div class="hero-body has-text-centered">
                    <p class="title is-size-3">
                        Medium hero
                    </p>
                    <p class="subtitle is-size-5">
                        Medium subtitle
                    </p>
                </div>
            </li>
        </ul>
    </figure>
    <div class="content" id="content">
        <div class="row column text-center">
            <div class="container">
                <c:if test="${sid=='admin' }">
                    <h2 class="page_tit">회원 정보 수정</h2>
                </c:if>
                <c:if test="${sid!='admin' }">
                    <h2 class="page_tit">마이 페이지</h2>
                </c:if>
                <hr>
                <form action="${path }/member/update.do" method="post" onsubmit="return updateCheck(this)">
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            <tr>
                                <th><label for="id">아이디</label></th>
                                <td><input type="text" name="id" id="id" size="100" class="input" value="${member.id }" readonly required>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw">비밀번호</label></th>
                                <td><input type="password" name="pw" id="pw"  class="input" value="${member.pw }" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                    <p>(최소 8자리에서 최대 16자리까지, 숫자, 영문 대소문자, 특수문자가 각 1 문자 이상 포함되어야 함)</p>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw2">비밀번호 확인</label></th>
                                <td><input type="password" name="pw2" id="pw2"  class="input" value="${member.pw }" required></td>
                            </tr>
                            <tr>
                                <th><label for="name">이름</label></th>
                                <td><input type="text" name="name" id="name" class="input"  value="${member.name }" required></td>
                            </tr>
                            <tr>
                                <th><label for="email">이메일</label></th>
                                <td><input type="email" name="email" id="email" class="input" value="${member.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
                            </tr>
                            <tr>
                                <th><label for="tel">전화번호</label></th>
                                <td><input type="tel" name="tel" id="tel" class="input"  value="${member.tel }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required></td>
                            </tr>
                            <tr>
                                <th><label for="findBtn" onclick="findAddr()">주소</label></th>
                                <td>
                                    <input type="text" name="addr1" id="addr1" class="input" value="${member.addr1 }" required readonly><br>
                                    <input type="text" name="addr2" id="addr2" class="input" value="${member.addr2 }"><br>
                                    <input type="text" name="postcode" id="postcode"  class="input" value="${member.postcode }" required readonly>
                                    <input type="button" value="주소찾기" onclick="findAddr()" id="findBtn" class="btn is-primary">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="birth" >생년월일</label></th>
                                <td>
                                    <fmt:parseDate value="${member.birth }" var="birth" pattern="yyyy-MM-dd" />
                                    <span style="display:none">
                                        <fmt:formatDate var="br" value="${birth }" pattern="yyyy-MM-dd" />
                                    </span>
                                    <input type="date" name="birth" id="birth" value="${br }" class="input" required readonly>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" class="button btn-writer" value="회원정보수정">
                                    <input type="reset" class="button btn-primary" value="취소">
                                    <c:if test="${sid=='admin' }">
                                        <a href="${path }/member/delete.do?id=${member.id }" class="button is-primary">직권 강퇴</a>
                                    </c:if>
                                    <c:if test="${sid!='admin' }">
                                        <a href="${path }/member/delete.do?id=${sid }" class="button is-primary">회원 탈퇴</a>
                                    </c:if>
                                    <c:if test="${sid=='admin' }">
                                        <a href="${path }/member/list.do" class="button is-primary">회원 목록</a>
                                    </c:if>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <script>
                    function updateCheck(f){
                        if(f.userpw.value!=f.userpw2.value){
                            alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                            return false;
                        }
                    }
                </script>
                <script>
                    function findAddr() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                console.log(data);
                                var roadAddr = data.roadAddress;
                                var jibunAddr = data.jibunAddress;
                                document.getElementById("postcode").value = data.zonecode;
                                if(roadAddr !== '') {
                                    document.getElementById("addr1").value = roadAddr;
                                } else if(jibunAddr !== ''){
                                    document.getElementById("addr1").value = jibunAddr;
                                }
                            }
                        }).open();
                    }
                </script>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            </div>
        </div>
    </div>

    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>