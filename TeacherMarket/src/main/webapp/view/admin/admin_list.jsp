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
	<%--	<link rel="stylesheet" href="../../css/bootstrap.css">--%>
	<link rel="stylesheet" href="../../css/list.css">
	<%--	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
	<%--	<script src="../../js/bootstrap.js"></script>--%>
	<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
	</style>
	<title>고객지원</title>

</head>
<header>
	<jsp:include page="/view/common/header.jsp"></jsp:include>
</header>
<div class="main_back">
	<div class="container">
		<h1 style="font-family: Namum">고객지원</h1>
		<div style="border-bottom: 1px solid #bdbdbd42; margin:5px 20px 20px 20px"></div>
		<form method="post" name="search">
			<table class="pull-right">
				<tr>
					<td>
						<select class="form-control-lg" name="searchField">
							<option value="0">선택</option>
							<option value="bbsTitle">문의사항</option>
							<option value="userID">신고</option>
						</select>
					</td>
					<%--<td>
						<input type="text" class="form-control-lg" placeholder="검색어 입력" name="searchText" maxlength="100"></td>
					<td><button type="button" class="btn btn-white btn-dark">검색</button></td>
					<%--<td>
						 <a href="${contextPath}/board/Form.do?katNo=${katTargetNo}" class="btn btn-success pull-right" data-toggle="modal" data-target="#myModal">모달 열기</a> --%>
						<%--									<a href="#" data-toggle="modal" data-target="#myModal"  class="btn back-blue2 addbtn pull-right">글쓰기</a>
					</td>--%>
				</tr>
			</table>
		</form>
		<div style="width:100%; height:70%; overflow:auto">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="active table1" style=" border: 1px solid #dddddd">
				<thead>
				<tr>
					<th style="text-align: center; vertical-align: middle;">글번호</th>
					<th style="text-align: center; vertical-align: middle;">제목</th>
					<th style="text-align: center; vertical-align: middle;">내용</th>
					<th style="text-align: center; vertical-align: middle;">작성자</th>
					<th style="text-align: center; vertical-align: middle;">작성일</th>
					<th style="text-align: center; vertical-align: middle;"></th>
				</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${boardList ==null }">
					<tr height="10">
						<td colspan="6">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${boardList !=null }">
				<c:forEach var="row" items="${boardList }" varStatus="loop">
				<tr align="center">
					<!-- 다른곳에서 복붙하지말고 여기에 추가해주세요  -->
					<td width="5%">${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}</td>
					<td><a href="#" ${ row.brdId }>${ row.title }</a></td>
					<td><a href="#" ${ row.brdId }>${ row.content }</a></td>
					<td width="10%">${row.userId}</td>
					<td width="10%">${row.regDate}</td>
						<%--												<td width="5%" colspan="2"><input type="button" value="삭제" onclick="location.href='${contextPath}/admin/remove.do?katNo=${katTargetNo}&brdNo=${item.brdNo}'"></td>--%>
					</c:forEach>
					</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
		<table border="1" width="90%">
			<tr align="center">
				<td>
					${ map.pagingImg }
				</td>
				<%--<td width="100"><button type="button"
                                        onclick="location.href='/market/write.do';">글쓰기</button></td>--%>
			</tr>
		</table>
	</div>
</div>
</div>
<jsp:include page="/view/common/footer.jsp" flush="false"/>
</body>

</html>