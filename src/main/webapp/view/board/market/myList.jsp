<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html xml:lang="ko" lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>내상점</title>

</head>
<body>
	<header>

		<jsp:include page="/view/common/header.jsp"></jsp:include>


	</header>
	<div id="wrap">
		<div id="container">
			<div id="contents">
				<div
						class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
					<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
						<div class="titleArea">
							<h2>
								<font color="#555555">
								<c:choose>
									<c:when test="${ map.myStore eq 'sell'}"> 판매내역 </c:when>
									<c:otherwise> 구매내역 </c:otherwise>
								</c:choose>
								</font>
							</h2>
							<p>내상점 입니다.</p>
						</div>
						<p class="imgArea"></p>
					</div>
					<form id="boardSearchForm" name=""
						  method="get">
						<div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
							<fieldset class="boardSearch">
								<legend>게시물 검색</legend>
								<p>
									<select id="search_key" name="searchField">
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>
									<input type="hidden" name="myStore" value=${ map.myStore }>
									<input id="search" name="searchWord"
										   class="inputTypeText" placeholder="" value="" type="text">
									<input id= "submitbtn" type="submit" value="검색하기"></p>
							</fieldset>
						</div>
					</form>
					<div class="boardSort">
							<span
									class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
					</div>
					<div class="ec-base-table typeList gBorder">
						<table border="1" summary="">
							<caption>게시판 목록</caption>
							<colgroup
									class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
								<col style="width:95px;">
								<col style="width:auto;">
								<col style="width:134px;">
								<col style="width:134px;">
								<col style="width:134px;">
								<col style="width:134px;">
							</colgroup>
							<thead
									class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							<tr style=" ">
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">게시일자</th>
								<th scope="col">가격</th>
								<th scope="col">지역</th>
							</tr>
							</thead>
							<tbody
									class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
								<c:choose>
									<c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
										<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
											<td colspan="6" align="center">
												등록된 게시물이 없습니다.
											</td>
										</tr>
									</c:when>
									<c:otherwise>  <!-- 게시물이 있을 때 -->
										<c:forEach items="${ boardLists }" var="row" varStatus="loop">
											<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
												<td>  <!-- 번호 -->
														${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
												</td>
												<td class="subject left txtBreak">  <!-- 제목(링크) -->
													<a href="${contextPath}/market/view.do?brdId=${ row.brdId }">${ row.title }</a> <span
															class="txtEm"></span>
												</td>
												<td>${ row.status }</td>  <!-- 상태 -->
												<td><span class="txtNum">${ row.regDate }</span></td>  <!-- 게시일자 -->
												<td><span class="txtNum">${ row.price }</span></td>  <!-- 가격 -->
												<td>${ row.dealAddress }</td>  <!-- 지역 -->
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<p
								class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone ">
						</p>
					</div>
				</div>

				<%--페이징 블록--%>
				<div
						class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
					<ol>

						${ map.pagingImg }

					</ol>
				</div>
			</div>
			<hr class="layout">
		</div>
		<hr class="layout">
	</div>
	<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>
</html>