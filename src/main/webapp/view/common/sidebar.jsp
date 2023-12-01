<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- Sidebar -->
	<div id="sidebar">
		<header>
			<a href="${contextPath}/main/main.do">
<%--			${}의 경우 해석되는 즉시 해당 표현식의 값이 반영되므로 즉시 적용(immediate expression)이라 하며	--%>
				<!--<img src="../img/logo.png" width="120" height="60"></img>-->				 

				 쌤 마켓
			</a>
		</header>
		<ul class="nav">
			<c:choose>
				<c:when test="${0 eq katTargetNo}">
					<li class="active"><a class="eng" href="${contextPath}/main/main.do"><i class="zmdi zmdi-view-dashboard"></i> 메인페이지</a></li>
				</c:when>
				<c:otherwise>
					<li><a class="eng" href="${contextPath}/main/main.do"><i class="zmdi zmdi-view-dashboard"></i> 메인페이지</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="item" items="${katlist}">
				<c:choose>
					<c:when test="${item.kateNo eq katTargetNo}">
						<li class="active"><a href="${contextPath}/board/list.do?katNo=${item.kateNo}">${item.kateName}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${contextPath}/board/list.do?katNo=${item.kateNo}">${item.kateName}</a></li>				
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${userId !='admin' }">
				<c:choose>
					<c:when test="${1 eq katTargetNo}">
						<li class="active"><a href="${contextPath}/admin/list.do?katNo=1">고객지원</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${contextPath}/admin/list.do?katNo=1">고객지원</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${2 eq katTargetNo}">
						<li class="active"><a href="${contextPath}/admin/memberlist.do?katNo=2">회원관리</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${contextPath}/admin/memberlist.do?katNo=2">회원관리</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${100 eq katTargetNo}">
						<li class="active"><a href="${contextPath}/admin/approve_list?katNo=100">가입승인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${contextPath}/admin/approve_list?katNo=100">가입승인</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</ul>
	</div>
