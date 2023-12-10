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
	<style>

		.wrapper {
			display: flex;
			justify-content: center;
			height: 100vh;
			margin-top: 100px;

		}

		#formContent {
			background-color: #fff; /* 폼의 배경색을 변경하세요 */
			padding: 40px;
			border-radius: 10px; /* 모서리를 둥글게 만듭니다 */
			box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
			width: 500px; /* 폼의 너비를 조정하세요 */
			height: 350px;
		}
		/* 입력 상자의 너비 및 여백을 조정하는 스타일 */
		input[type="text"].fadeIn,
		input[type="password"].fadeIn {
			width: 100%;
			height: 50px;
			margin-bottom: 15px;
		}
		/* 버튼 스타일 */
		input[type="submit"].fadeIn {
			width: 100%;
			padding: 8px;
			background-color: #114276;
			color: white;

		}
		/* 링크의 스타일 */
		#formFooter a {
			font-size: 18px; /* 링크의 글꼴 크기를 조정하세요 */
		}

		#formContent > * {
			margin-bottom: 15px;
		}


	</style>

</head>
	<jsp:include page="/view/common/header.jsp"></jsp:include>


<body>
<div class="wrapper">
	<div id="formContent">
		<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
			<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
		<h1 class="active text-center">
			<font color="#555555">로그인
			</font>
		</h1>
			</div>
		</div>
		<!-- Login Form -->
		<form action="${contextPath}/member/login.do" method="post">
			<input type="text" id="login" class="form-control fadeIn" name="userID" placeholder="아이디">
			<input type="password" id="password" class="form-control fadeIn" name="userPW" placeholder="비밀번호" autocomplete="off">
			<input type="submit" class="btn custom-btn-color fadeIn" value="로그인">
		</form>
		<!-- Signup and Password Reset Links -->
		<div id="formFooter" class="mt-3 text-center">
			<a class="underlineHover" href="${contextPath}/member/join.do">회원가입</a>
			<span class="mx-2">|</span>
			<a class="underlineHover" href="${contextPath}/member/find.do">아이디/비밀번호 찾기</a>
		</div>
	</div>
</div>
<jsp:include page="/view/common/footer.jsp" flush="false"/>

</body>
</html>