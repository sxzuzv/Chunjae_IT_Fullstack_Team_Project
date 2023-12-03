<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="Author" content="silverline">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>회원가입</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="../../css/headers.css" rel="stylesheet">
    <link href="../../css/main.css" rel="stylesheet">
    <link href="../../css/carousel.css" rel="stylesheet">


    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            daum.postcode.load(function () {
                new daum.Postcode({
                    oncomplete: function (data) {
                        var fullAddr = data.address; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수

                        // 기본 주소와 조합형 주소를 동일하게 설정
                        document.getElementById("addr").value = fullAddr;

                        // 기본 주소가 도로명 타입일 때 조합형 주소 설정
                        if (data.addressType === 'R') {
                            // 법정동명이 있을 경우 추가
                            if (data.bname !== '') {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가
                            if (data.buildingName !== '') {
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 조합형 주소를 추가
                            fullAddr += ' (' + extraAddr + ')';
                        }

                        // 주소 정보 입력 필드에 값 설정
                        document.getElementById("addr").value = fullAddr;
                    }
                }).open();
            });
        }

        function join() {
            var form = document.joinForm;

            if (!form.userID.value) {
                alert("아이디를 입력해주세요.");
                form.userID.focus();
                return;
            }
            if (form.userID.value.length < 4 || form.userID.value.length > 16) {
                alert("아이디는 4자 이상, 16자 이하로 입력해주세요.");
                form.userID.focus();
                return;
            }
            if (!form.userPW.value) {
                alert("비밀번호를 입력해주세요.");
                form.userPW.focus();
                return;
            }

            // 비밀번호 유효성 검사 로직 추가
            var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
            if (!passwordRegex.test(form.userPW.value)) {
                alert("비밀번호는 8자리 이상이어야 하며, 영문/숫자 모두 포함해야 합니다.");
                form.userPW.focus();
                return;
            }

            if (form.userPW.value !== form.userPW2.value) {
                alert("비밀번호를 확인해주세요.");
                form.userPW2.focus();
                return;
            }

            if (!form.name.value) {
                alert("이름을 입력해주세요.");
                form.name.focus();
                return;
            }


            form.submit();
        }

        function CheckDup() {
            var form = document.joinForm;

            if (!form.userID.value) {
                alert("아이디를 입력해주세요.");
                form.userID.focus();
                return;
            }

            $.ajax({
                url:"/member/checkId.do",		// servlet
                type: "post",
                datatype:"text",
                data: {"userID" : form.userID.value},
                success:function(data){

                    if(data === 'success'){
                        $('input[name=checkID]').val("ok");
                        alert("사용 가능한 아이디입니다.")
                        $('#message').text('사용할 수 있는 ID입니다.')
                        $('#message').css('color','green')

                    }
                    else {
                        alert("사용 불가능한 아이디입니다.")
                        $('#message').text('이미 사용 중인 아이디입니다.')
                        $('#message').css('color','red')

                    }
                },
                error:function(){
                    alert("error");
                }
            })
        }
    </script>
</head>
<header>
    <jsp:include page="../common/top.jsp"></jsp:include>
</header>
<body>
<form name="joinForm" method="post" enctype="multipart/form-data" action="${contextPath}/member/save.do" class="container mt-5">
    <input type="hidden" name="checkID" value="no" />
    <div class="joinBox">
        <h1 class="tit">회원가입</h1>
        <div class="text-right mt-3">
            <span class="blet">* </span>표시는 필수입니다.
        </div>
        <div class="table-responsive mt-4">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <th><span class="blet">*</span> 아이디</th>
                    <td>
                        <div class="input-group">
                            <input type="text" name="userID" class="form-control" size="20" maxlength="16">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" onClick="CheckDup();">중복 검사</button>
                            </div>
                        </div>
                        <div id='message' class="mt-2"></div>
                    </td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 닉네임</th>
                    <td><input type="text" name="nickname" class="form-control" size="15" maxlength="6"></td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 비밀번호</th>
                    <td>
                        <input type="password" name="userPW" class="form-control" size="20" maxlength="16">
                        <small class="text-muted">※ 8~16글자의 영어, 숫자 혼용</small>
                    </td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 비밀번호 확인</th>
                    <td><input type="password" name="userPW2" class="form-control" size="20" maxlength="16"></td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 이름</th>
                    <td><input type="text" name="name" class="form-control" size="15" maxlength="6"></td>
                </tr>
                <tr>
                    <th>전화</th>
                    <td><input type="text" name="tel" class="form-control" size="15" maxlength="15"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" class="form-control" size="30" maxlength="40"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" id="addr" name="addr" class="form-control" placeholder="주소" size="60">
                        <input type="button" onclick="execDaumPostcode()" value="주소 찾기" class="btn btn-secondary mt-2">
                    </td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td><input type="text" id="user_addr2" name="addr2" class="form-control" placeholder="상세주소" size="20"></td>
                </tr>
                <tr>
                    <th>재직증명서</th>
                    <td><input type="file" id="school_aut" name="ofile" class="form-control-file"></td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 학교이름</th>
                    <td><input type="text" name="userschool" class="form-control" size="15" maxlength="15"></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="btnZone mt-4">
            <input type="button" onClick="join();" class="btn btn-primary mr-2" value="확인">
            <input type="button" onClick="history.go(-1);" class="btn btn-secondary" value="뒤로">
        </div>
    </div>
</form>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>