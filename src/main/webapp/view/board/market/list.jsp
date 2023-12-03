<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>중고게시판</title>

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
					<input type="hidden" name="cateSub" value=${ map.cateSub }/>
					<input type="submit" value="검색하기" />
				</td>
			</tr>
		</table>
	</form>
	<!-- 목록 테이블 -->
	<div class="ec-base-table typeList gBorder">
		<table border="1" width="90%">
			<colgroup
					class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
				<col style="width:95px;">
				<col style="width:135px;">
				<col style="width:auto;">
				<col style="width:134px;">
				<col style="width:134px;">
				<col style="width:134px;">
			</colgroup>
			<thead
					class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">지역</th>
					<th scope="col">제목</th>
					<th scope="col">상태</th>
					<th scope="col">가격</th>
					<th scope="col">게시일자</th>
				</tr>
			</thead>
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
						<tbody
							class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
							<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
								<td>  <!-- 번호 -->
										${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
								</td>
								<td>${ row.dealAddress }</td>  <!-- 지역 -->
								<td align="left">  <!-- 제목(링크) -->
									<a href="/market/view.do?brdId=${ row.brdId }">${ row.title }</a>
								</td>
								<td>${ row.status }</td>  <!-- 상태 -->
								<td><span class="txtNum">${ row.price }</span></td>  <!-- 가격 -->
								<td><span class="txtNum">${ row.regDate }</span></td>  <!-- 게시일자 -->
							</tr>
						</tbody>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<!-- 하단 메뉴(바로가기, 글쓰기) -->
	<table border="1" width="90%">
		<tr align="center">
			<td>
				${ map.pagingImg }
			</td>
			<td width="100"><button type="button"
									onclick="location.href='/market/write.do';">글쓰기</button></td>
		</tr>
	</table>
</body>
</html>