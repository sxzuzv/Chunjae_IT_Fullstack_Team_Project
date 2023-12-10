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
	<title>마이페이지</title>



	<style>
		/* 사용자 정의 스타일 추가 */


		.form-group {
			max-width: 400px; /* 폼 요소의 최대 가로 크기 조정 */
			margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
		}
		.btnZone {
			margin-top: 20px;
			text-align: center; /* 버튼을 가운데 정렬 */

		}

		.custom-btn{
			background-color: #114276;
			color: white;
		}


	</style>
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
</head>
<jsp:include page="/view/common/header.jsp"></jsp:include>
				<div class="container">
					<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
						<form name="updateForm" method="post" action="${contextPath}/member/update.do">
							<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
								<div class="titleArea">
									<h1>
										<font color="#555555">마이페이지</font>
									</h1>
								</div>
							</div>
								<hr class="my-4">
								<div class="form-group">
									<label for="name">이름</label>
									<input type="text" class="form-control form-control-lg" id="name" name="name" maxlength="10" value="${userDTO.userName}" readonly>
								</div>
							<div class="form-group">
								<label for="nickname">닉네임</label>
								<input type="text" class="form-control form-control-lg" id="nickname" name="nickname" maxlength="10" value="${userDTO.user_nick}" readonly>
							</div>
								<div class="form-group">
									<label for="tel">전화번호</label>
									<input type="text" class="form-control form-control-lg" id="tel" name="tel" maxlength="15" value="${userDTO.userCp}" readonly>
								</div>
								<div class="form-group">
									<label for="email">이메일</label>
									<input type="text" class="form-control form-control-lg" id="email" name="email" maxlength="30" value="${userDTO.userEmail}" readonly>
								</div>
								<div class="form-group">
									<label for="addr">주소</label>
									<div class="input-group">
										<input type="text" class="form-control form-control-lg" id="addr" name="addr" value="${userDTO.userAddr}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="addr2">상세주소</label>
									<input type="text" class="form-control form-control-lg" id="addr2" name="addr2" value="${userDTO.userDaddr}" readonly>
								</div>
								<div class="btnZone">
									<a href="${contextPath}/member/updateform.do" class="btn custom-btn underlineHover" style="background-color:#114276; color: white; ">변경하기</a>
									<button type="button" onclick="history.go(-1);" class="btn btn-secondary">뒤로</button>
									<a href="${contextPath}/member/selfDelete.do" onclick="confirmWithdrawal(event)" class="btn btn-danger underlineHover">회원탈퇴</a>
								</div>
						</form>
					</div>
				</div>


	<!-- 부트스트랩 및 jQuery 스크립트 -->
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>