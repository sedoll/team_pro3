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
    <title>회원 정보수정</title>
    <jsp:include page="../include/head.jsp"></jsp:include>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="${path}/css/font.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="${path}/css/common.css">
    <link rel="stylesheet" href="${path}/css/hd.css">


    <style>
        /* 본문 영역 스타일 */
        .contents {
            clear: both;
            min-height: 250vh;
            background-image: url("${path}/img/login.jpg");
            background-repeat: no-repeat;
            background-position: center -250px;
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .page {
            clear: both;
            width: 100vw;
            height: 150vh;
            position: relative;
        }

        .page::after {
            content: "";
            display: block;
            width: 100%;
            clear: both;
        }

        .page_wrap {
            clear: both;
            width: 1200px;
            height: auto;
            margin: 0 auto;
        }

        .page_tit {
            font-size: 48px;
            text-align: center;
            padding-top: 1em;
            color: #fff;
            padding-bottom: 2.4rem;
        }

        .breadcrumb {
            clear: both;
            width: 1200px;
            margin: 0 auto;
            text-align: right;
            color: #fff;
            padding-top: 28px;
        }

        .breadcrumb a {
            color: #fff;
        }


        d {
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .join_form {
            margin: 0 auto;
            margin-top: 50px;
            background: #eaf4fa;
            border-radius: 5px;
            width: 600px;
            height: auto;
            max-width: 100%;
            overflow: hidden;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.2);
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
            /*padding-bottom: 15px;*/
            padding-left: 4px;

        }


        .frm1 {
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
            background: cornflowerblue;
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
            background-color: cornflowerblue;
            border: 2px solid cornflowerblue;
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

        .frm1 p {
            text-align: right;
        }


        .frm1 input {
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
            background: cornflowerblue;
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
            background: cornflowerblue;
            border: 0;
            border-radius: 5px;
            width: 120px;
            color: #fff;
            font-size: 18px;
            float: left;
            padding: 0;
            margin-top: 4px;
            cursor: pointer;
        }
    </style>

    <link rel="stylesheet" href="${path}/css/ft.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <jsp:include page="../include/header.jsp"></jsp:include>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <span>회원가입</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">회원 가입</h2>


                <div class="join_form">
                    <div class="header">
                        <img src="${path}/img/logo_48.png" />
                        <h2>회원가입</h2>
                    </div>

                    <form class="frm1" action="${path }/member/insert.do" method="post" onsubmit="return joinCheck(this)">
                        <div class="register_info_id">
                            <label>아이디<%--<span>사용할 수 없는 아이디 입니다</span>--%></label>
                            <input type="text" name="id" id="id" class="indata" placeholder="아이디 (6~16자)" pattern="^[a-z0-9]{6,16}" maxlength="16" autofocus required/>
                            <button type="button" id="ck_btn" class="btn-primary" onclick="idCheck()">중복확인</button>
                            <%-- <input type="button" id="ck_btn"  class="btn btn-primary" value="중복 확인" onclick="idCheck()"> --%>
                            <input type="hidden" name="idck" id="idck" value="no">
                        </div>
                        <div>
                            <c:if test="${empty qid }">
                                <p id="msg" style="padding-left:0.5rem">아직 아이디 중복 체크를 하지 않으셨습니다.</p>
                            </c:if>
                            <c:if test="${not empty qid }">
                                <p id="msg" style="padding-left:0.5rem">아이디 중복 체크후 수정하였습니다.</p>
                            </c:if>
                        </div>

                        <div class="register_info">
                            <label>비밀번호<%--<span>20자 이내 비밀번호를 입력하세요</span>--%></label>
                            <input type="password" name="pw" id="pw" class="indata"
                                   placeholder="비밀번호 (문자, 숫자, 특수문자 포함 8~20자)" required="">
                        </div>

                        <div class="register_info">
                            <label>비밀번호 확인<%--<span>비밀번호가 일치하지 않습니다</span>--%></label>
                            <input type="password" name="pw2" id="pw2" class="indata" placeholder="비밀번호 확인" required="">
                        </div>

                        <div class="register_info">
                            <label>이름</label>
                            <input type="text" name="name" id="name" class="indata" placeholder="이름" required="">
                            <input type="hidden" name="job" id="job" value="${job}">
                        </div>

                        <div class="register_info">
                            <label>생년월일</label>
                            <td><input type="date" name="birth" id="birth" placeholder="생년월일 입력" class="form-control" required></td>
                        </div>

                        <div class="register_info">
                            <label>전화번호</label>
                            <input type="tel" name="tel" id="tel" class="indata" placeholder="전화번호" required="">
                        </div>

                        <div class="register_info">
                            <label>이메일 주소</label>
                            <input type="email" name="email" id="email" class="indata" placeholder="이메일" required="">
                        </div>

                        <div class="register_info">
                            <label>주소</label>
                            <input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" class="form-control" readonly>
                            <button type="button" id="post_btn" onclick="findAddr()" class="btn btn-primary">우편번호 검색</button>
                            <input type="text" name="addr1" id="addr1" placeholder="기본 주소 입력" class="form-control" required readonly/><br>
                            <input type="text" name="addr2" id="addr2" placeholder="상세 주소 입력" class="form-control" required /><br>
                        </div>

                        <div class="register_info">
                            <label>약관</label>
                            <div class="agree_fr2">
                                제 1 장 총칙

                                제 1 조 (목적) 이 이용약관은 “단체표준종합정보센터 (이하 "당 사이트")”에서 제공하는 인터넷 서비스(이하 '서비스')의 가입조건, 당 사이트와 이용자의
                                권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

                                제 2 조 (용어의 정의)
                                1. "이용자"라 함은 당 사이트에 접속하여 이 약관에 따라 당 사이트가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                                2. “단체표준종합정보센터”에서 제공하는 단체표준, 단체인증, 예고현황 정보를 말합니다.
                                3. "회원"이라 함은 서비스를 이용하기 위하여 당 사이트에 개인정보를 제공하여 아이디(ID)와 비밀번호를 부여 받은 자를 말합니다.
                                4. “비회원”이하 함은 회원으로 가입하지 않고 " 단체표준종합정보센터"에서 제공하는 서비스를 이용하는 자를 말합니다.
                                5. "회원 아이디(ID)"라 함은 회원의 식별 및 서비스 이용을 위하여 자신이 선정한 문자 및 숫자의 조합을 말합니다.
                                6. "비밀번호"라 함은 회원이 자신의 개인정보 및 직접 작성한 비공개 콘텐츠의 보호를 위하여 선정한 문자, 숫자 및 특수문자의 조합을 말합니다.

                                제 3 조 (이용약관의 효력 및 변경)
                                1. 당 사이트는 이 약관의 내용을 회원이 알 수 있도록 당 사이트의 초기 서비스화면에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수
                                있도록 할 수 있습니다.
                                2. 당 사이트는 이 약관을 개정할 경우에 적용일자 및 개정사유를 명시하여 현행 약관과 함께 당 사이트의 초기화면 또는 초기화면과의 연결화면에 그 적용일자
                                7일 이전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이
                                경우 당 사이트는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
                                3. 당 사이트가 전항에 따라 개정약관을 공지하면서 “개정일자 적용 이전까지 회원이 명시적으로 거부의 의사표시를 하지 않는 경우 회원이 개정약관에 동의한
                                것으로 봅니다.”라는 취지를 명확하게 공지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 않은 경우에는 개정약관에 동의한 것으로 봅니다. 회원이 개정약관에
                                동의하지 않는 경우 당 사이트 이용계약을 해지할 수 있습니다.

                                제 4 조(약관 외 준칙)
                                1. 이 약관은 당 사이트가 제공하는 서비스에 관한 이용안내와 함께 적용됩니다.
                                2. 이 약관에 명시되지 아니한 사항은 관계법령의 규정이 적용됩니다.

                                제 2 장 이용계약의 체결

                                제 5 조 (이용계약의 성립 등)
                                이용계약은 이용고객이 당 사이트가 정한 약관에 「동의합니다」를 선택하고, 당 사이트가 정한 회원가입양식을 작성하여 서비스 이용을 신청한 후, 당 사이트가 이를
                                승낙함으로써 성립합니다.

                                제 6 조 (회원가입)
                                서비스를 이용하고자 하는 고객은 당 사이트에서 정한 회원가입양식에 개인정보를 기재하여 가입을 하여야 합니다.

                                제 7 조 (개인정보의 보호 및 사용)
                                당 사이트는 관계법령이 정하는 바에 따라 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위해 노력합니다. 회원 개인정보의 보호 및 사용에 대해서는 관련법령
                                및 당 사이트의 개인정보 보호정책이 적용됩니다. 다만, 당 사이트 이외에 링크된 사이트에서는 당 사이트의 개인정보 보호정책이 적용되지 않습니다.

                                제 8 조 (이용 신청의 승낙과 제한)
                                1. 당 사이트는 제6조의 규정에 의한 이용신청고객에 대하여 약관에 정하는 바에 따라 서비스 이용을 승낙합니다.
                                2. 당 사이트는 아래사항에 해당하는 경우에 대해서 회원가입을 승낙하지 아니하거나 이후 사전 통보 없이 취소할 수 있습니다.
                                - 회원가입 신청 시 내용을 허위로 기재한 경우
                                - 기타 규정한 제반사항을 위반하며 신청하는 경우
                                - 다른 사람의 당 사이트 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 경우
                                - 당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우

                                제 9 조 (회원 아이디 부여 및 변경 등)
                                1. 당 사이트는 이용고객에 대하여 약관에 정하는 바에 따라 자신이 선정한 회원 아이디를 부여합니다.
                                2. 회원 아이디는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경 하고자 하는 경우에는 해당 아이디를 해지하고 재가입해야 합니다.
                                3. 회원은 회원가입 시 기재한 개인정보가 변경되었을 경우 온라인으로 직접 수정할 수 있습니다. 이때 변경하지 않은 정보로 인해 발생되는 문제에 대한 책임은
                                회원에게 있습니다.

                                제 3 장 계약 당사자의 의무

                                제 10 조 ("단체표준종합정보센터"의 의무)
                                1. 당 사이트는 이용고객이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록 하여야 합니다.
                                2. 당 사이트는 개인정보 보호를 위해 보안시스템을 구축하며 개인정보 보호정책을 공시하고 준수합니다.
                                3. 당 사이트는 회원으로부터 제기되는 의견이 합당하다고 판단될 경우에는, 적절한 조치를 취하여야 합니다.
                                4. 당 사이트는 전시, 사변, 천재지변, 비상사태, 현재의 기술로는 해결이 불가능한 기술적 결함 기타 불가항력적 사유 및 이용자의 귀책사유로 인하여 발생한
                                이용자의 손해, 손실, 기타 모든 불이익에 대하여 어떠한 책임도 지지 않습니다.

                                제 11 조 (회원의 의무)
                                1. 이용자는 회원가입 신청 또는 회원정보 변경 시 실명으로 모든 사항을 사실에 근거하여 작성하여야 하며, 허위 또는 타인의 정보를 등록할 경우 일체의 권리를
                                주장할 수 없습니다.
                                2. 당 사이트가 관계법령 및 개인정보 보호정책에 의거하여 그 책임을 지는 경우를 제외하고, 회원에게 부여된 아이디의 비밀번호 관리소홀, 부정사용 등에 의하여
                                발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
                                3. 회원은 당 사이트 및 제 3자의 지식재산권을 침해해서는 안 됩니다.
                                4. 이용자는 당 사이트의 운영자, 직원, 기타 관계자를 사칭하는 행위를 하여서는 안 됩니다.
                                5. 이용자는 바이러스, 악성코드 등을 제작, 배포, 이용하여서는 아니 되고, 당 사이트의 승인 없이 광고하는 행위를 하여서는 안 됩니다.
                                6. 이용자는 당 사이트 및 제 3자의 명예를 훼손하거나 업무를 방해하거나, 외설적이거나, 폭력적이거나 기타 공서양속에 반하는 게시물, 쪽지, 메일 등을
                                게시, 전송, 배포하여서는 안 됩니다.

                                제 4 장 서비스의 이용

                                제 12 조 (서비스 이용 시간)
                                1. 회원의 이용신청을 승낙한 때부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시합니다.
                                2. 업무상 또는 기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 사이트에 공시하거나 회원에게 이를 통지합니다.
                                3. 서비스의 이용은 연중무휴, 1일 24시간을 원칙으로 하며, 서비스 응대 및 처리 시간은 법정 근무일 근무시간(09:00~18:00, 법정공휴일 및 주말
                                제외)으로 합니다. 다만, 당 사이트의 업무상 또는 기술상의 이유로 서비스가 일시 중지 될 수 있습니다. 이러한 경우 당 사이트는 사전 또는 사후에 이를
                                공지합니다.
                                4. 회원으로 가입한 이후라도 일부 서비스 이용 시 서비스 제공자의 요구에 따라 특정회원에게만 서비스를 제공할 수 있습니다.
                                5. 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공개합니다.

                                제 13 조 (홈페이지 저작권)
                                1. 당 사이트가 게시한 본 홈페이지의 모든 콘텐트에 대한 저작권은 당 사이트에 있습니다. 다만, 게시물의 원저작자가 별도로 있는 경우 그 출처를 명시하며
                                해당 게시물의 저작권은 원저작자에게 있습니다.
                                2. 회원이 직접 게시한 저작물의 저작권은 회원에게 있습니다. 다만, 회원은 당 사이트에 무료로 이용할 수 있는 권리를 허락한 것으로 봅니다.
                                3. 당 사이트 소유의 콘텐트에 대하여 제3자가 허락 없이 다른 홈페이지에 사용 또는 인용하는 것을 금지합니다.

                                제 14 조 (서비스의 변경, 중단))
                                1. 당 사이트는 기술상?운영상의 필요에 의해 제공하는 서비스의 일부 또는 전부를 변경하거나 중단할 수 있습니다. 당 사이트의 서비스를 중단하는 경우에는
                                30일 전에 홈페이지에 이를 공지하되, 다만 사전에 통지할 수 없는 부득이한 사정이 있는 경우는 사후에 통지를 할 수 있습니다.
                                2. 제1항의 경우에 당 사이트가 제공하는 서비스의 이용과 관련하여, 당 사이트는 이용자에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다. 다만 당
                                사이트의 고의 또는 중대한 과실로 인하여 발생한 손해의 경우는 제외합니다.

                                제 5 장 계약 해지 및 이용 제한

                                제 15 조 (계약 해지)
                                1. 회원은 언제든지 마이페이지 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, 당 사이트는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야
                                합니다.
                                2. 회원이 계약을 해지할 경우, 관련법령 및 개인정보처리방침에 따라 당 사이트가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 회원의 모든 데이터는
                                소멸됩니다.
                                3. 회원이 계약을 해지하는 경우, 회원이 작성한 게시물(공용게시판에 등록된 게시물 등)은 삭제되지 아니합니다.

                                제 16 조 (서비스 이용제한))
                                1. 당 사이트는 회원이 서비스 이용에 있어서 본 약관 및 관련 법령을 위반하거나, 다음 각 호에 해당하는 경우 서비스 이용을 제한할 수 있습니다.
                                - 2년 이상 서비스를 이용한 적이 없는 경우
                                - 기타 정상적인 서비스 운영에 방해가 될 경우
                                2. 상기 이용제한 규정에 따라 서비스를 이용하는 회원에게 사전 통지 후 서비스 이용을 일시정지 등 제한하거나 이용계약을 해지 할 수 있습니다. 단, 불가피한
                                사유로 사전 통지가 불가능한 경우에는 그러하지 아니합니다.

                                제 6 장 손해배상 및 기타사항

                                제 17 조 (손해배상)
                                당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당 사이트가 고의 또는 과실로 인한 손해발생을 제외하고는 이에 대하여 책임을
                                부담하지 아니합니다.

                                제 18 조 (관할 법원)
                                서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 민사 소송법상의 관할 법원에 제기합니다.

                                제 19 조 (서비스별 이용자 사전 동의 사항과 의무)) 당 사이트에 ‘기술정보를 제공하는 이용자는 자신의 기술정보에 대한 권리(특허권, 실용신안권,
                                디자인권, 상표권 등)를 법적으로 보호받기 위해서 필요한 조치를 스스로 취하여야 합니다. 당 사이트는 이용자의 권리 보장이나 취득 등을 위한 어떠한 명목의
                                의무나 책임도 부담하지 않고, 이를 보장하지 않으며, 이용자 개인의 행위(당 사이트의 서비스 이용 행위 일체를 포함)로 인한 어떠한 분쟁이나 어떠한 명목의
                                손실, 손해에 대해서도 법적 책임을 지지 아니합니다.

                                제 7 장 " 단체표준종합정보센터" 게시물 운영정책

                                제 20 조 (운영정책)
                                "단체표준종합정보센터" 각종 게시물에 대한 운영정책은 방송통신심의위원회의 정보통신에 관한 심의규정에 기반하며 이를 위반할 경우, "단체표준종합정보센터"
                                운영정책에 의해 관련 게시물은 예고 없이 삭제, 이동될 수 있으며, 게시자(회원)는 아이디 이용제한 등 "단체표준종합정보센터" 이용에 제한을 받을 수
                                있습니다.

                                제 21 조 (게시물 등록)
                                게시물은 실명을 통해 등록합니다. 악성 글 등을 업로드 하실 경우 게시물 삭제 또는 게시자(회원)의 이용제한 등의 경고 조치가 가능합니다.
                                1. 주민등록번호 도용 타인의 개인정보를 이용한 활동이 발견될 경우, 해당 회원은 이용에 제한을 받을 수 있으며, 해당 계정은 본인인증 후에 정상적인 이용이
                                가능합니다. 또한 여러 개의 아이디를 생성하여 허위신고를 하거나, 타인 사칭을 통한 문제 발생 시, 그에 따른 이용 제한을 받을 수 있습니다.

                                제 22 조 (게시물의 저작권)
                                1. 게시물은 회원이 서비스를 이용하면서 게재한 글, 사진, 파일, 관련 링크 및 댓글 등을 말합니다.
                                2. 회원이 서비스에 등록하는 게시물로 인하여 본인 또는 타인에게 손해 및 기타 문제가 발생하는 경우, 회원은 이에 대한 책임을 질수 있으며 또한 명예훼손이나
                                개인정보 유출, 저작권과 같은 법률에 위배되는 게시물 및 댓글은 관련 법안에 따라 민형사상 처벌을 받을 수 있으니 이 점 유의하여 주시기 바랍니다.

                                제 23 조 (게시물 제한규정(삭제 및 이동))
                                1. 욕설/비속어 및 분란을 조장하는 게시물- 욕설 및 비속어가 담겨있거나, 연상시키는 내용- 이유 없이 회원 간의 분란을 발생시킬 여지가 있는 내용의 게시물
                                또는 댓글
                                2. 게시판 및 자료실과 관련 없는 게시물- 각 주제 분야별로 나뉘어 있는 게시판 및 자료실의 주제와 관련 없는 내용
                                3. 상업성 광고 및 홍보 글에 관한 게시물
                                4. 개인정보의 유포에 관한 게시물- 타인, 혹은 본인의 메일주소/실명/사진/전화번호/주민등록번호 등의 개인정보 또는 해당 정보가 담겨 있는 내용
                                5. 확인되지 않은 소문의 유포에 관한 게시물- 공개되었을 경우, 당사자의 권리침해가 우려되는 내용
                                6. 정치적 견해 차이 및 인종/성별/지역/종교에 대한 차별, 비하하는 게시물
                                - 인종/성별/지역/종교에 대한 차별적 발언 또는 비하하는 내용
                                - 상이한 정치적 견해를 비하하거나 폄하하는 내용
                                7. 타인을 사칭하거나 범죄행위에 관한 게시물
                                - 공인이나 특정이슈와 관련한 당사자 또는 지인, 주변인 등을 사칭하여 게시물을 작성하거나, "단체표준종합정보센터" 운영자를 사칭하여 작성된 내용
                                - 범죄와 관련 있거나 범죄를 유도하는 행위를 포함하는 내용
                                8. 저작권 위반에 관한 게시물
                                - 기사, 사진, 동영상, 음원, 영상물 등 저작권에 의해 보호받는 콘텐츠와 관련된 내용 뉴스의 경우, 기사 내용의 전부 혹은 일부를 게시하는 경우에는
                                저작권에 저촉될 수 있기 때문에 링크(URL)만을 허용합니다.
                                - 음원, 사진, 동영상 등 해당 자료에 대한 불법공유를 목적으로 작성한 내용 공유를 목적으로 이메일을 수집하는 행위도 동일하게 처리됩니다.
                                9. 악성코드/스파이웨어/혐오감 조성에 관한 게시물
                                - 악성코드 및 스파이웨어의 유포 및 유도 관련 게시물은 사전경고 없이 제재를 받을 수 있습니다.
                                - 시각 및 청각적으로 타인에게 혐오감을 줄 수 있는 게시물은 사전경고 없이 제재를 받을 수 있습니다.
                                10. 기타 서비스 운영에 지장을 초래할 수 있는 게시물

                                제 24 조 (이용제한)
                                1. 게시물 제한규정(3조)에 해당하는 내용을 게재하는 경우
                                2. 다량의 게시물 등록을 목적으로 의미 없는 제목을 사용하거나, 반복되는 제목을 사용하여 게재하는 경우
                                3. 비정상적인 방법으로 게시물을 등록, 조회 및 추천하는 경우 등

                                제 25 조 (게시중단 요청 서비스)
                                다른 회원의 게시물로 인하여 명예훼손, 저작권 침해 등의 피해를 입었을 경우, 운영담당자를 통해 해당 게시물에 대한 게시중단을 요청하실 수 있습니다.

                                [부 칙]
                                (시행일) 이 약관은 2016년 12월 30일부터 적용되며, 종전 약관은 본 약관으로 대체되며, 개정된 약관의 적용일 이전 가입자도 개정된 약관의 적용을
                                받습니다.
                            </div>

                            <div class="btn_fr"><input type="checkbox" id="ck_item1" name="ck_item1" required> <label
                                    for="ck_item1">약관의 동의</label>
                            </div>
                        </div>




                        <div class="btn1">
                            <button class="submit btn btn-primary" type="submit">가입 완료</button>
                            <button class="reset btn" type="reset">가입 취소</button>
                        </div>


                    </form>
                </div>
                <script>
                    $(document).ready(function(){
                        $("#id").keyup(function(){
                            $("#idck").val("no");
                            if($(this).val()!=""){
                                $("#msg").html("<strong>아이디 입력중입니다.</strong>");
                                $("#id").focus();
                            } else {
                                $("#msg").html("아직 아이디 중복 체크를 하지 않으셨습니다.");
                            }
                        });
                    });
                    function idCheck(){
                        if($("#id").val()==""){
                            alert("아이디를 입력하지 않으셨습니다.");
                            $("#id").focus();
                            return;
                        }
                        var params = {	id : $("#id").val()	} //전송되어질 데이터를 객체로 묶음
                        $.ajax({
                            url:"${path }/member/idCheck.do",	//아이디가 전송되어질 곳
                            type:"post",		//전송방식
                            dataType:"json",	//데이터 반환 방식
                            data:params,		//전송방식이 post인 경우 객체로 묶어서 전송
                            success:function(result){
                                console.log(result.result);
                                var idChk = result.result;	//true 또는 false를 받음
                                if(idChk==false){	//사용할 수 없는 아이디
                                    $("#idck").val("no");
                                    $("#msg").html("<strong style='color:red'>기존에 사용되고 있는 아이디 입니다. 다시 입력하시기 바랍니다.</strong>");
                                    $("#id").focus();
                                } else if(idChk==true){	//사용 가능한 아이디
                                    $("#idck").val("yes");
                                    $("#msg").html("<strong style='color:blue'>사용가능한 아이디 입니다.</strong>");
                                } else if(idck==""){
                                    $("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
                                }
                            }
                        });
                    }
                </script>
                <script>
                    function joinCheck(f){
                        if(f.pw.value!=f.pw2.value){
                            alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                            f.pw.focus();
                            return false;
                        }
                        if(f.idck.value!="yes"){
                            alert("아이디 중복 체크를 하지 않으셨습니다.");
                            return false;
                        }
                    }
                    function findAddr(){
                        new daum.Postcode({
                            oncomplete:function(data){
                                console.log(data);
                                var roadAddr = data.roadAddress;
                                var jibunAddr = data.jibunAddress;
                                document.getElementById("postcode").value = data.zonecode;
                                if(roadAddr !== ''){
                                    document.getElementById("addr1").value = roadAddr;
                                } else if(jibunAddr !== ''){
                                    document.getElementById("addr1").value = jibunAddr;
                                }
                                document.getElementById("addr2").focus();
                            }
                        }).open();
                    }
                </script>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</div>
</body>
</html>