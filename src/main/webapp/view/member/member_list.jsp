<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/css/list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>회원관리</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}



</style>

</head>
<body>
<div>
<jsp:include page="/view/common/headerAdmin.jsp"></jsp:include>
</div>
<div id="viewport">
	<div class="main_back d-flex align-items-center justify-content-center">
		<div class="container">
			<h1 style="font-family: Namum">회원관리</h1>
			<div style="border-bottom: 1px solid #bdbdbd42; margin:5px 20px 20px 20px"></div>
			<form method="post" name="">
				<div class="d-flex align-items-center">
					<select class="form-control form-control-sm" name="searchField">
						<option value="userId">아이디</option>
						<option value="userName">이름</option>
					</select>
					<input type="text" class="form-control-lg" placeholder="검색어 입력" name="searchWord" maxlength="100">
					<button type="submit" class="btn btn-white btn-dark">검색</button>
				</div>
			</form>
		</div>
	</div>
<div class="container">
	<div class="main_back">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="active table1" style=" border: 1px solid #dddddd; ">
<thead style="background-color: #114276">
<tr>
	<th style="text-align: center; vertical-align: middle;">번호</th>
	<th style="text-align: center; vertical-align: middle;">아이디</th>
	<th style="text-align: center; vertical-align: middle;">이름</th>
	<th style="text-align: center; vertical-align: middle;">연락처</th>
<c:choose>
<c:when test="${list != null}">
        <th style="text-align: center; vertical-align: middle;">파일</th>
        <th style="text-align: center; vertical-align: middle;">가입신청일</th>
		<th style="text-align: center; vertical-align: middle;">승인상태</th>
		<th style="text-align: center; vertical-align: middle;">회원승인</th>
		<th style="text-align: center; vertical-align: middle;">회원거절</th>
			</c:when>
			<c:when test="${reportlist != null}">
			<th style="text-align: center; vertical-align: middle;">가입일</th>
			<th style="text-align: center; vertical-align: middle;">누적신고횟수</th>
			<th style="text-align: center; vertical-align: middle;">회원제재</th>
			</c:when>
		</c:choose>
	</tr>
</thead>
	<tbody>
	<c:choose>
		<c:when test="${not empty list}">
			<c:forEach items="${list}" var="item" varStatus="loop">
				<tr align="center">
					<!-- 변경된 부분 -->
					<td width="5%">${map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index)}</td>
					<td width="15%">${item.userId}</td>
					<td width="15%">${item.userName}</td>
					<td width="10%">${item.userCp}</td>
					<td width="15%"><a href="${contextPath}/Uploads/${item.sfile}" target="_blank" onclick="return !window.open(this.href, 'Image', 'width=auto,height=auto')">
							${item.sfile}
					</a></td>
					<td width="10%">${item.joinDate}</td>
					<td width="10%">${item.userStatus}</td>
					<td width="10%"><input type="button" value="승인" onclick="location.href='${contextPath}/admin/pass.do?id=${item.userId}'"></td>
					<td width="10%"><input type="button" value="거절" onclick="location.href='${contextPath}/admin/remove2.do?id=${item.userId}'"></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:when test="${not empty reportlist}">
			<c:forEach items="${reportlist}" var="item" varStatus="loop">
				<tr align="center">
					<!-- 변경된 부분 -->
					<td width="5%">${map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index)}</td>
					<td width="15%">${item.userId}</td>
					<td width="14%">${item.userName}</td>
					<td width="15%">${item.userCp}</td>
					<td width="8%">${item.joinDate}</td>
					<td width="8%">${item.reportCnt}</td>
					<td width="10%" colspan="2"><input type="button" value="정지" onclick="location.href='${contextPath}/admin/dropuser.do?id=${item.userId}'"></td>
				</tr>
			</c:forEach>
		</c:when>
	<c:when test="${empty list}">
		<tr height="10">
			<td colspan="6" style="text-align: center;">
				<b style="font-size: 9pt; display: block; width: 100%; text-align: center; margin-left: 200px">승인대기 회원이 없습니다.</b>
			</td>
		</tr>
	</c:when>
	<c:when test="${empty reportlist}">
		<tr height="10">
			<td colspan="6" style="text-align: center;">
				<b style="font-size: 9pt; display: block; width: 100%; text-align: center; margin-left: 200px">신고당한 회원이 없습니다.</b>
			</td>
		</tr>
	</c:when>
	<c:otherwise>
</c:otherwise>
</c:choose>
	</tbody>
</table>
<table>
	<div class="row">
		<div class="col-md-12 text-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					${map.pagingImg}
				</ul>
			</nav>
		</div>
	</div>
</table>
</div>
</div>
	<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>
