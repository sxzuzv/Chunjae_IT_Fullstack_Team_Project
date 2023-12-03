<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>



<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="Author" content="silverline">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>마이페이지</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
	<!--헤더 공통 css -->
	<<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">


	<link href="../../css/headers.css" rel="stylesheet">
	<link href="../../css/main.css" rel="stylesheet">


	<!-- 슬라이드 css-->
	<link href="../../css/carousel.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		/* 사용자 정의 스타일 추가 */
		body {
			padding-top: 20px;
		}
		.form-group {
			max-width: 400px; /* 폼 요소의 최대 가로 크기 조정 */
			margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
		}
		.btnZone {
			margin-top: 20px;
			text-align: center; /* 버튼을 가운데 정렬 */
		}

		.small-heading {
			font-size: 2rem; /* 원하는 크기로 설정 */
		}
	</style>

</head>

<body>
<header>
	<jsp:include page="../common/header.jsp"></jsp:include>
</header>
	<div id="viewport">
		<!-- Content -->
		<div id="content">

			<div class="main_back">
				<div class="container">
					<form name="updateForm" method="post" action="${contextPath}/member/update.do">
						<div class="jumbotron">
							<h1 class="display-4 small-heading">마이페이지</h1>
							<hr class="my-4">
							<div class="form-group">
								<label for="name">이름</label>
								<input type="text" class="form-control" id="name" name="name" maxlength="6" value="${userDTO.userName}" disabled>
							</div>
							<div class="form-group">
								<label for="tel">전화번호</label>
								<input type="text" class="form-control" id="tel" name="tel" maxlength="15" value="${userDTO.userCp}" disabled>
							</div>
							<div class="form-group">
								<label for="email">이메일</label>
								<input type="text" class="form-control" id="email" name="email" maxlength="40" value="${userDTO.userEmail}" disabled>
							</div>
							<div class="form-group">
								<label for="addr">주소</label>
								<div class="input-group">
									<input type="text" class="form-control" id="addr" name="addr" value="${userDTO.userAddr}" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="addr2">상세주소</label>
								<input type="text" class="form-control" id="addr2" name="addr2" value="${userDTO.userDaddr}" disabled>
							</div>
							<div class="btnZone">
								<a href="${contextPath}/member/updateform.do" class="btn btn-primary underlineHover">변경하기</a>
								<button type="button" onclick="history.go(-1);" class="btn btn-secondary">뒤로</button>
								<a href="${contextPath}/member/selfDelete.do" onclick="confirmWithdrawal(event)" class="btn btn-danger underlineHover">회원탈퇴</a>

								<script>
									function confirmWithdrawal(event) {
										event.preventDefault(); // 링크 기본 동작 방지
										if (confirm('정말 회원 탈퇴를 진행하시겠습니까?')) {
											window.location.href = event.target.href;
										} else {
											console.log('회원 탈퇴가 취소되었습니다.');
										}
									}
								</script>
							</div>
						</div>
					</form>
				</div>

				<!-- 부트스트랩 및 jQuery 스크립트 -->
				<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>