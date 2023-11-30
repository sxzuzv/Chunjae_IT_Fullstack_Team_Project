<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <script>
        function passChange() {
            var form = document.passchangeForm;
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


            form.submit();
        }
    </script>
</head>
    <!-- Tabs Titles -->
    <h2 class="active">비밀번호 변경</h2>
    <!-- password Form -->
    <form name="passchangeForm" action="${contextPath}/member/passChange.do" method="post">
        <input type="password" id="password" class="fadeIn second" name="userPW" placeholder="비밀번호">
        <input type="password" id="password2" class="fadeIn third" name="userPW2" placeholder="비밀번호확인" autocomplete="off">
    <!-- Signup Link -->
    <div id="formFooter">
        <input type="button" onClick="passChange();" class="btnOk" value="비밀번호 변경">
    </div>
    </form>
</html>