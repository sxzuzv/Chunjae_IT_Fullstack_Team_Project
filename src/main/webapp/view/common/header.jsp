<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Teacher Market</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

	<link rel="stylesheet" href="${contextPath}/css/froala_style_ec.min.css" />
	<link rel="stylesheet" href="${contextPath}/css/optimizer.css" />
	<link rel="stylesheet" href="${contextPath}/css/optimizer_user.css" />
	<link rel="stylesheet" href="${contextPath}/css/headers.css" />


</head>

<body>
<div id="skipNavigation">
	<p><a href="#category">전체상품목록 바로가기</a></p>
	<p><a href="#contents">본문 바로가기</a></p>
</div>

<div id="header">
	<div class="topArea">
		<div class="inner">
			<!-- 로고 -->
			<h1 class="xans-element- xans-layout xans-layout-logotop "><a href="${contextPath}/"><img src="${contextPath}/img/logo.png"
																						alt="Teacher Market" /></a>
			</h1>
			<div id="category" class="gnb">
				<!-- 전체 상품 카테고리 버튼 -->
				<!-- 상품 대분류 : 관리자 연동 -->
				<div
						class="xans-element- xans-layout xans-layout-category-1 xans-layout-category xans-layout-1 cate-list">
					<ul class="menu">
						<li class="xans-record-">
							<a href="${contextPath}/market/list.do">중고 거래</a>
							<ul class="submenu" id = "submenu01">
								<li><a class = "sub" href="${contextPath}/market/list.do?cateSub=1">교재</a></li>
								<li><a class = "sub" href="${contextPath}/market/list.do?cateSub=2">교구</a></li>
								<li><a class = "sub" href="${contextPath}/market/list.do?cateSub=3">일상용품</a></li>
							</ul>
						</li>
						<li class="xans-record-">
							<a href="${contextPath}/teachercommunity/list.do">선생님 요모조모</a>
							<ul class="submenu" id = "submenu02">
								<li><a class = "sub" href="${contextPath}/teachercommunity/list.do?cateSub=1">꿀팁 나눠요</a></li>
								<li><a class = "sub" href="${contextPath}/teachercommunity/list.do?cateSub=2">고민 있어요</a></li>
								<li><a class = "sub" href="${contextPath}/teachercommunity/list.do?cateSub=3">수업 질문</a></li>
							</ul>
						</li>
						<li class="xans-record-">
							<a href="#">내 상점</a>
							<ul class="submenu" id = "submenu03">
								<li><a class = "sub" href="${contextPath}/market/list.do?myStore=sell">판매내역</a></li>
								<li><a class = "sub" href="${contextPath}/market/list.do?myStore=buy">구매내역</a></li>
							</ul>
						</li>
					</ul>
					<!-- 추가 메뉴 -->
					<ul class="etc-list menu2">
						<ul class = "menu2">
							<li>
								<a id = "etcfont" href="#">고객지원</a>
								<ul class="submenu2" id = "submenu04">
									<li><a class = "sub2" href="${contextPath}/cscenter/list.do">문의사항</a></li>
									<li><a class = "sub2" href="${contextPath}/cscenter/list/report.do">신고내역</a></li>
								</ul>
							</li>
						</ul>
					</ul>
				</div>
			</div>

		</div>
	</div>
	<!-- 회원 메뉴 -->
	<div class="header-util">
		<div class="inner">
			<c:choose>
				<c:when test="${empty userId }">
					<ul>
						<li class="xans-element- xans-layout xans-layout-statelogoff log "><a
								href="${contextPath}/member/main.do">로그인</a>
						</li>
						<li class="xans-element- xans-layout xans-layout-statelogoff join "><a
								href="${contextPath}/member/join.do">회원가입</a>
						</li>
					</ul>
				</c:when>
				<c:when test="${!empty userId}">
					<ul>
						<li class="xans-element- xans-layout xans-layout-statelogoff log "><a
								href="${contextPath}/main/main.do"><strong>${ userId } 님</strong></a>
						</li>
						<li class="xans-element- xans-layout xans-layout-statelogoff log "><a
								href="${contextPath}/member/mypage.do">회원정보수정</a>
						</li>
						<li class="xans-element- xans-layout xans-layout-statelogoff join "><a
								href="${contextPath}/member/logout.do">로그아웃</a>
						</li>
					</ul>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>
</body>

</html>

