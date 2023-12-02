<%--
  Created by IntelliJ IDEA.
  User: cyj
  Date: 2023-11-26
  Time: 오후 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>내상점</title>

	<!--헤더 공통 css -->
	<link href="../../../css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">


	<link href="../../../css/headers.css" rel="stylesheet">
	<link href="../../../css/main.css" rel="stylesheet">
	<link href="../../../css/nav.css" rel="stylesheet">


	<!-- 슬라이드 css-->
	<link href="../../../css/carousel.css" rel="stylesheet">

</head>
<body>
<header>

	<jsp:include page="../../common/header.jsp"></jsp:include>


</header>
<h2>파일 첨부형 게시판 - 목록 보기(List)</h2>
	<!-- 검색 폼 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" />
					<input type="hidden" name="myStore" value=${ map.myStore }/>
					<input type="submit" value="검색하기" />
				</td>
			</tr>
		</table>
	</form>
	<!-- 목록 테이블 -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">지역</th>
			<th width="*">제목</th>
			<th width="15%">상태</th>
			<th width="10%">가격</th>
			<th width="15%">게시일자</th>
		</tr>
		<c:choose>
			<c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
				<tr>
					<td colspan="6" align="center">
						등록된 게시물이 없습니다^^*
					</td>
				</tr>
			</c:when>
			<c:otherwise>  <!-- 게시물이 있을 때 -->
				<c:forEach items="${ boardLists }" var="row" varStatus="loop">
					<tr align="center">
						<td>  <!-- 번호 -->
								${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
						</td>
						<td>${ row.dealAddress }</td>  <!-- 지역 -->
						<td align="left">  <!-- 제목(링크) -->
							<a href="/market/view.do?brdId=${ row.brdId }">${ row.title }</a>
						</td>
						<td>${ row.status }</td>  <!-- 상태 -->
						<td>${ row.price }</td>  <!-- 가격 -->
						<td>${ row.regDate }</td>  <!-- 게시일자 -->
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<!-- 하단 메뉴(바로가기, 글쓰기) -->
	<table border="1" width="90%">
		<tr align="center">
			<td>
				${ map.pagingImg }
			</td>
		</tr>
	</table>
</body>
</html>