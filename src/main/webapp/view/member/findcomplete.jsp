<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <form action="${contextPath}/member/login.do>">
    <h1>아이디 찾기</h1>
    <div>회원가입시 사용한 아이디는 ${userId} 입니다.</div>
    <input type="submit" value="로그인화면으로 돌아가기">
    </form>
</head>
<body>

</body>
</html>
