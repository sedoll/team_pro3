<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- /web/member/login.jsp -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적 입력</title>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        /* 본문 영역 스타일 */
        d {
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .join_form {
            margin: 0 auto;
            margin-top: 50px;
            margin-bottom: 50px;
            background: #eaf4fa;
            border-radius: 5px;
            width: 600px;
            height: auto;
            max-width: 100%;
            overflow: hidden;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.5);
        }

        .header {
            padding: 40px 40px;
            text-align: center;

        }

        .header img {
            display: inline-block;
            vertical-align: middle;
            width: 40px;
        }

        .header h2 {
            display: inline-block;
            margin: 0;
            font-size: 30px;
            font-weight: bolder;
            vertical-align: middle;
            padding-top: 4px;
            padding-left: 4px;

        }



        .box {
            padding: 30px 40px;
        }

        form inf {

            padding-bottom: 10px;

        }


        .register_info_id {
            position: relative;
        }

        .register_info_id button {
            position: absolute;
            width: 90px;
            height: 40px;
            top: 0;
            bottom: 0;
            right: 5px;
            margin: 32px 0;
            border-radius: 3px;
            color: #fff;
            border: 0;
            cursor: pointer;
        }


        .register_info input {
            border: 1.5px solid #535053;
            border-radius: 3px;
            display: block;
            font-size: 11px;
            padding: 5px;
            width: 80%;


        }
        #birth {
            cursor: pointer;
        }


        .submit {
            width: 120px;
            border-radius: 5px;
            padding: 5px;
            color: #ffffff;
            float: left;
        }


        .agree_fr {
            margin: 20px auto;
            border: 1px solid #eee;
            padding: 20px;
            overflow-y: auto;
            height: 100px;
            white-space: pre-wrap;
        }


        .agree_fr2 {
            border-radius: 5px;
            height: 100px;
            border: 1px solid #d9d6d6;
            background-color: white;
            white-space: pre-line;
            overflow-y: scroll;
            margin: 0 auto 20px;
            padding: 10px;
        }

        .box p {
            text-align: right;
        }


        .box input {
            display: inline-block;
            width: 100%;
            border: 1px solid #d9d6d6;
            padding: 17px 25px;
            box-sizing: border-box;
            margin: 0;
            border-radius: 5px;
        }

        .register_info {
            padding: 10px 0;
        }

        input::placeholder {
            font-size: 15px;
            color: #9d9d9d;
        }

        label {
            padding-bottom: 10px;
            display: block;
            font-weight: bold;
            font-size: 16px;
            color: #000;
        }

        label > span {
            font-weight: normal;
            color: red;
            font-size: 13px;
            padding-left: 10px;
        }

        .btn_fr input {
            display: inline-block;
            width: auto;
            float: left;
        }

        .btn_fr label {
            padding-left: 25px;
        }

        input.inbtn {
        }

        button.submit {
            display: block;
            height: 50px;

            border: 0;
            border-radius: 5px;
            width: 50%;
            color: #fff;
            font-size: 18px;
            float: left;
            margin: 0 5px;
            padding: 0;
            box-shadow: 2px 3px 7px 0px #0000005e;
            cursor: pointer;
        }

        button.reset {
            height: 50px;
            background: gray;
            border: 0;
            border-radius: 5px;
            width: 50%;
            color: #fff;
            font-size: 18px;
            padding: 0;
            margin: 0 5px;
            box-shadow: 2px 3px 7px 0px #0000005e;
            cursor: pointer;
        }

        .btn1 {
            color: #fff;
            width: 70%;
            display: flex;
            margin: 20px auto;
        }
        #msg {
            text-align: left;
            padding-top: 6px;
        }
        #post_btn {
            display: block;
            height: 40px;
            border: 0;
            border-radius: 5px;
            width: 120px;
            color: #fff;
            font-size: 18px;
            float: left;
            padding: 0;
            margin-top: 4px;
            cursor: pointer;
            box-shadow: 2px 3px 7px 0px #0000005e;
        }

        #ck_btn{
            margin-top: 41px;
        }

        #table1{
            width:500px;
        }

        #content{
            width: 400px
        }

        .hero {
            height: 250px;
            margin-top: 40px;
        }


    </style>
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>
<div class="wrap">
    <section class="hero is-white is-medium">
        <div class="hero-body has-text-centered">
            <p class="title is-size-3">성적표 입력</p>
        </div>
        <nav class="breadcrumb is-small has-bullet-separator is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="#">Bulma</a></li>
                <li><a href="#">Documentation</a></li>
                <li><a href="#">Components</a></li>
                <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
            </ul>
        </nav>
    </section>
    <div class="contents" id="contents">
        <div class="container">
                <div class="join_form">
                    <form class="box" action="${path }/grade/gradeinsert.do" method="post">
                        <div class="register_info_id">
                            <label>학생 이름</label>
                            <input type="text" name="sname" id="sname" class="indata" placeholder="학생 이름을 입력하세요" autofocus required/>
                        </div>
                        <div class="register_info">
                            <label>학부모님 아이디</label>
                            <input type="text" name="pid" id="pid" class="indata" placeholder="학생의 학부모님 성함을 입력하세요" required/>
                        </div>

                        <div class="register_info">
                            <label>시험 종류</label>
                            <input type="text" name="exam" id="exam" class="indata" placeholder="ex)1학기 중간고사" required/>
                        </div>

                        <div class="register_info">
                            <label>국어</label>
                            <input type="text" name="kor" id="kor" class="indata" placeholder="국어 점수 입력"  required/>
                        </div>

                        <div class="register_info">
                            <label>영어</label>
                            <td><input type="text" name="eng" id="eng" placeholder="영어 점수 입력" class="indata" required></td>
                        </div>

                        <div class="register_info">
                            <label>수학</label>
                            <input type="text" name="math" id="math" class="indata" placeholder="수학 점수 입력"  required/>
                        </div>

                        <div class="register_info">
                            <label>사회</label>
                            <input type="text" name="social" id="social" class="indata" placeholder="사회 점수 입력"  required/>
                        </div>

                        <div class="register_info">
                            <label>과학</label>
                            <input type="text" name="science" id="science" placeholder="과학 점수 입력" class="indata"  required/>
                        </div>

                        <div class="register_info">
                            <label>담당 선생님 성함</label>
                            <input type="text" name="tname" id="tname" value="${member.name}" class="indata" placeholder="선생님 성함 입력"  required/>
                        </div>


                        <div class="btn1">
                            <button class="submit button is-link is-outlined" type="submit"> 성적표 등록</button>
                            <button class="reset button is-danger is-outlined" type="reset">작성 취소</button>
                        </div>


                    </form>
                </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>