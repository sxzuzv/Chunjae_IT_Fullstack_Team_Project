<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function toggleLogout() {
		var logoutText = document.getElementById("logoutText");
		if (logoutText.innerText === "로그아웃") {
			logoutText.innerText = "로그인";
			// TODO: 로그아웃 동작 추가
		} else {
			logoutText.innerText = "로그아웃";
			// TODO: 로그인 동작 추가
		}
	}

	$(document).ready(function(){
		$('#btn').click(function(){
			$('#slideTogglebox').slideToggle();
		});
	});

</script>

<!DOCTYPE html>

<link rel="stylesheet" href="../css/toggle.css" />
<c:choose>
	<c:when test="${empty userId }">
		<nav class="py-2 border-bottom fixed-top">
			<div class="container d-flex flex-wrap">
				<ul class="nav me-auto">
					<div class="col-md-3 mb-2 mb-md-0">
						<a class="navbar-brand" href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
							<svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap" style="background-color: black;"><use xlink:href="#bootstrap"></use></svg>
							쌤마켓
						</a>
					</div>
				</ul>
				<ul class="nav">
					<li class="nav-item"><a href="#" class="nav-link link-body-emphasis px-2">Login</a></li>
					<li class="nav-item"><a href="#" class="nav-link link-body-emphasis px-2">Sign up</a></li>
				</ul>
			</div>
		</nav>
	</c:when>
	<c:when test="${!empty userId}">
		<nav class="py-2 border-bottom fixed-top">
			<div class="container-fluid container d-flex flex-wrap">
				<ul class="nav me-auto">
					<div class="col-md-3 mb-2 mb-md-0">
						<a class="navbar-brand" href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
							<svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap" style="background-color: black;"><use xlink:href="#bootstrap"></use></svg>
							쌤마켓
						</a>
					</div>
				</ul>
				<ul class="nav">
					<li id="btn" class ="nav-item"><a href="#">${userId}</a>
						<ul id="slideTogglebox">
							<li><a href="/member/updatefrom.do">회원정보수정</a></li>
							<li><a href="/member/logout.do" onclick="toggleLogout()"><span id="logoutText">로그아웃</span></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>


	</c:when>
</c:choose>

<div>
	<nav class="d-flex justify-content-center py-3">
		<ul class="nav nav-pills menu">
			<li class="nav-item">
				<a href="#" class="nav-link">중고 거래</a>
				<ul class="submenu" id = "submenu01">
					<li><a href="#">submenu01</a></li>
					<li><a href="#">submenu02</a></li>
					<li><a href="#">submenu03</a></li>
					<li><a href="#">submenu04</a></li>
					<li><a href="#">submenu05</a></li>
					<li><a href="#">submenu06</a></li>
					<li><a href="#">submenu06</a></li>
					<li><a href="#">submenu06</a></li>
					<li><a href="#">submenu06</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">선생님 요모조모</a>
				<ul class="submenu" id = "submenu02">
					<li><a href="#">submenu01</a></li>
					<li><a href="#">submenu02</a></li>
					<li><a href="#">submenu03</a></li>
					<li><a href="#">submenu04</a></li>
					<li><a href="#">submenu05</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">내 상점</a>
				<ul class="submenu" id = "submenu03">
					<li><a href="#">submenu01</a></li>
					<li><a href="#">submenu02</a></li>
					<li><a href="#">submenu03</a></li>
					<li><a href="#">submenu04</a></li>
				</ul>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">고객지원</a>
				<ul class="submenu" id = "submenu04">
					<li><a href="#">submenu01</a></li>
					<li><a href="#">submenu02</a></li>
					<li><a href="#">submenu03</a></li>
					<li><a href="#">submenu04</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>
