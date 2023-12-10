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
    <style>
        .joinBox {
            max-width: 650px; /* 원하는 폭으로 조절하세요 */
            margin: 0 auto; /* 중앙 정렬을 위한 마진 설정 */
        }

        .btnZone input[type="button"] {
            margin: 0 5px; /* 버튼 간 여백 조절 */
            background-color: #114276; /* 원하는 색상 코드 */
            color: #fff;
        }

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
            if (!form.nickname.value) {
                alert("닉네임을 입력해주세요.");
                form.name.focus();
                return;
            }
            if (!form.ofile.value) {
                alert("파일을 첨부해주세요");
                form.ofile.focus();
                return;
            }
            if (!form.userschool.value) {
                alert("학교이름을 입력해주세요");
                form.userschool.focus();
                return;
            }
            CheckDup(function(result) {
                if (result === true) {
                    form.submit(); // 회원가입 진행
                } else {
                    // 사용 가능한 아이디가 아닌 경우 처리
                    alert("아이디 중복검사를 다시 진행해주세요.");
                }
            });
        }

        function CheckDup(callback) {
            var form = document.joinForm;

            $.ajax({
                url: "${contextPath}/member/checkId.do",
                type: "post",
                dataType: "text",
                data: { "userID": form.userID.value },
                success: function (data) {
                    if (data === 'success') {
                        $('input[name=checkID]').val("ok");
                        $('#message').text('사용할 수 있는 ID입니다.');
                        $('#message').css('color', 'green');
                        callback(true); // 사용 가능한 아이디를 전달하여 콜백 실행
                    } else {
                        $('#message').text('이미 사용 중인 아이디입니다.');
                        $('#message').css('color', 'red');
                        callback(false); // 사용 불가능한 아이디를 전달하여 콜백 실행
                    }
                },
                error: function () {
                    alert("서버 오류가 발생했습니다.");
                    callback(false); // 오류 발생시 false를 전달하여 콜백 실행
                }
            });
        }

    </script>
</head>

    <jsp:include page="/view/common/header.jsp"></jsp:include>


<body>
<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
    <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
        <div class="titleArea">
            <h1 class="tit text-center">
                <font color="#555555">회원가입
                </font>
            </h1>
        </div>
    </div>
</div>

<form name="joinForm" method="post" enctype="multipart/form-data" action="${contextPath}/member/save.do" class="container mt-5">
    <hr class="my-4">
    <input type="hidden" name="checkID" value="no" />

    <div class="joinBox">
        <div>

        <div class="text-right mt-3">
            <span class="blet">* </span>표시는 필수입니다.
        </div>
        <div class="table-responsive mt-4">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <th><span class="blet">*</span> 아이디</th>
                    <td>
                            <input type="text" name="userID" class="form-control form-control-lg" size="20" maxlength="16">
                    </td>
                    <td>
                        <button class="btn btn-secondary" type="button" onClick="CheckDup();">중복 검사</button>
                    </td>
                </tr>
                <td colspan="2" id='message'></td>
                <tr>
                    <th><span class="blet">*</span> 이름</th>
                    <td><input type="text" name="name" class="form-control form-control-lg" size="15" maxlength="6"></td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 닉네임</th>
                    <td><input type="text" name="nickname" class="form-control form-control-lg" size="15" maxlength="6"></td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 비밀번호</th>
                    <td>
                        <input type="password" name="userPW" class="form-control form-control-lg" size="20" maxlength="16">
                        <small class="text-muted">※ 8~16글자의 영어, 숫자 혼용</small>
                    </td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 비밀번호 확인</th>
                    <td><input type="password" name="userPW2" class="form-control form-control-lg" size="20" maxlength="16"></td>
                </tr>
                <tr>
                    <th>전화</th>
                    <td><input type="text" name="tel" class="form-control form-control-lg" size="15" maxlength="15"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="text" name="email" class="form-control form-control-lg" size="15" maxlength="30"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input type="text" id="addr" name="addr" class="form-control form-control-lg" placeholder="주소" size="60" readonly>
                    </td>
                    <td>
                        <input type="button" onclick="execDaumPostcode()" value="주소 찾기" class="btn btn-secondary">
                    </td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td><input type="text" id="user_addr2" name="addr2" class="form-control form-control-lg" placeholder="상세주소" size="20"></td>
                </tr>
                <tr>
                    <th><span class="blet">*</span>재직증명서</th>
                    <td><input type="file" id="school_aut" name="ofile" class="form-control-file"></td>
                </tr>
                <tr>
                    <th><span class="blet">*</span> 학교이름</th>
                    <td><input type="text" name="userschool" class="form-control form-control-lg" size="15" maxlength="15"></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="btnZone d-flex justify-content-center">
            <input type="button" onClick="join();" class="btn btn-custom mr-2" value="확인">
            <input type="button" onClick="history.go(-1);" class="btn btn-secondary" value="뒤로">
        </div>

        </div>
    </div>
        </div>
    </div>
</form>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>