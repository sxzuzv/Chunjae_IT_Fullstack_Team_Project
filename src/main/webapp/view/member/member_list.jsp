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
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/list.css">
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
<jsp:include page="${contextPath}/view/common/headerAdmin.jsp"></jsp:include>
</div>
<div id="viewport">
<div id="content">
	<div class="main_back">
		<div class="container">
			<h1 style="font-family: Namum">승인관리</h1>
			<div style="border-bottom: 1px solid #bdbdbd42; margin:5px 20px 20px 20px"></div>
			<form method="post" name="">
				<table class="pull-right">
					<tr>
						<td>
							<select class="form-control" name="searchField">
								<option value="userId">아이디</option>
								<option value="userName">이름</option>
							</select>
						</td>
						<td>
							<input type="text" class="form-control-lg" placeholder="검색어 입력" name="searchWord" maxlength="100"></td>
						<td><button type="submit" class="btn btn-white btn-dark">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</div>
<div style="width:100%; height:70%; overflow:auto">
<<<<<<< HEAD
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="active table1" style=" border: 1px solid #dddddd">
<thead>
<tr>
	<th style="text-align: center; vertical-align: middle;">번호</th>
	<th style="text-align: center; vertical-align: middle;">아이디</th>
	<th style="text-align: center; vertical-align: middle;">이름</th>
	<th style="text-align: center; vertical-align: middle;">연락처</th>
<c:choose>
<c:when test="${list != null}">
        <th style="text-align: center; vertical-align: middle;">파일</th>
        <th style="text-align: center; vertical-align: middle;">가입신청일</th>
		<th style="text-align: center; vertical-align: middle;">회원등급</th>
		<th style="text-align: center; vertical-align: middle;">회원승인</th>
		<th style="text-align: center; vertical-align: middle;">회원거절</th>
			</c:when>
			<c:when test="${reportlist != null}">
			<th style="text-align: center; vertical-align: middle;">가입일</th>
			<th style="text-align: center; vertical-align: middle;">누적신고횟수</th>
			<th style="text-align: center; vertical-align: middle;">삭제</th>
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
					<td width="10%" colspan="2"><input type="button" value="삭제" onclick="location.href='${contextPath}/admin/dropuser.do?id=${item.userId}'"></td>
				</tr>
			</c:forEach>
		</c:when>
	<c:when test="${empty list}">
		<tr height="10">
			<td colspan="6">
				<p align="center">
					<b><span style="font-size: 9pt;">승인대기 회원이 없습니다.</span></b>
				</p>
			</td>
		</tr>
	</c:when>
	<c:when test="${empty reportlist}">
		<tr height="10">
			<td colspan="6">
				<p align="center">
					<b><span style="font-size: 9pt;">신고당한 회원이 없습니다.</span></b>
				</p>
			</td>
		</tr>
	</c:when>
	<c:otherwise>
</c:otherwise>
</c:choose>
	</tbody>
</table>
<table>
<td>
	${ map.pagingImg }
</td>
</table>
</div>
</body>
</html>
=======
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="active table1" style=" border: 1px solid #dddddd">
		<thead>
		<tr>
			<th style="text-align: center; vertical-align: middle;">번호</th>
			<th style="text-align: center; vertical-align: middle;">아이디</th>
			<th style="text-align: center; vertical-align: middle;">이름</th>
			<th style="text-align: center; vertical-align: middle;">연락처</th>
			<th style="text-align: center; vertical-align: middle;">파일</th>
			<th style="text-align: center; vertical-align: middle;">가입신청일</th>
			<th style="text-align: center; vertical-align: middle;">회원등급</th>
			<th style="text-align: center; vertical-align: middle;">회원승인</th>
			<th style="text-align: center; vertical-align: middle;">회원거절</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${ list ==null }">
			<tr height="10">
				<td colspan="6">
					<p align="center">
						<b><span style="font-size: 9pt;">승인대기 회원이 없습니다.</span></b>
					</p>
				</td>
			</tr>
		</c:when>
		<c:when test="${ list !=null }">
		<c:forEach var="item" items="${ list }" varStatus="articleNum">
		<tr align="center">
			<!-- 다른곳에서 복붙하지말고 여기에 추가해주세요  -->
			<td width="5%">${articleNum.count}</td>
			<td width="15%">${item.userId}</td>
			<td width="15%">${item.userName}</td>
			<td width="10%">${item.userCp}</td>
			<td width="15%">${item.ofile}</td>
			<td width="10%">${item.joinDate}</td>
			<td width="10%">${item.userStatus}</td>
			<td width="10%" ><input type="button" value="승인" onclick="location.href='${contextPath}/member/pass.do?id=${item.userId}'"></td>
			<td width="10%" ><input type="button" value="거절" onclick="location.href='${contextPath}/member/remove2.do?id=${item.userId}'"></td>
			</c:forEach>
			</c:when>
			</c:choose>
		</tbody>
	</table>
</div>
<div class="text-center">
	<c:if test="${tot != null }">
		<ul class="pagination">
			<c:choose>
				<c:when test="${tot > 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page==1 }">
							<li><a class="no-uline" href="/board/list.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; prev </a></li>
						</c:if>
						<li><a class="no-uline" href="/board/list.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }</a></li>

						<c:if test="${page ==10 }">
							<li><a class="no-uline" href="/board/list.do?section=${section+1}&pageNum=${section*10+1}">&nbsp;next</a></li>
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${tot == 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<li><a class="no-uline" href="#">${page} </a><li>
					</c:forEach>
				</c:when>

				<c:when test="${tot< 100 }">
					<c:forEach var="page" begin="1" end="${tot/10 +1}" step="1">
						<c:choose>
							<c:when test="${page== pageNum }">
								<li><a class="sel-page" href="/board/list.do?section=${section}&pageNum=${page}">${page } </a></li>
							</c:when>
							<c:otherwise>
								<li><a class="no-uline" href="/board/list.do?section=${section}&pageNum=${page}">${page } </a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
		</ul>
	</c:if>
</div>
>>>>>>> develop
