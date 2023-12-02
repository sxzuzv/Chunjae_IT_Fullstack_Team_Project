<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>home</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">

	<link href="../../css/bootstrap.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">



	<link href="../../css/main.css" rel="stylesheet"/>
	<link href="../../css/nav.css" rel="stylesheet"/>
	<link rel="stylesheet" href="../css/toggle.css"/>
	<link rel="stylesheet" href="../../css/carousel.css">





	<link rel="stylesheet" href="../../css/login.css">
</head>
<body>
<header>
	<jsp:include page="../common/top.jsp"></jsp:include>
</header>
<div class="wrapper fadeInDown">
	<div id="formContent">
		<!-- Tabs Titles -->
		<h2 class="active">로그인</h2>
		<!-- Login Form -->
		<form action="${contextPath}/member/login.do" method="post">
			<input type="text" id="login" class="fadeIn second" name="userID" placeholder="아이디">
			<input type="password" id="password" class="fadeIn third" name="userPW" placeholder="비밀번호" autocomplete="off">
			<input type="submit" class="fadeIn fourth" value="로그인">
		</form>
		<!-- Signup Link -->
		<div id="formFooter">
			<a class="underlineHover" href="${contextPath}/member/join.do">회원가입</a>
		</div>
		<div id="formFooter2">
			<a class="underlineHover" href="${contextPath}/member/find.do">아이디/비밀번호 찾기</a>
		</div>
	</div>
</div>
</body>
</html>