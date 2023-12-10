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

	<title>중고 거래</title>

</head>
<body>
<header>

	<jsp:include page="/view/common/header.jsp"></jsp:include>


</header>

<div id="wrap">
	<div id="container">
		<div id="contents">
			<style>
				#wrap {
					overflow: hidden;
				}

				#quick {
					top: 415px;
				}
			</style>
			<!-- 추천상품 -->

			<!-- 신상품 -->
			<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
				<div class="titleArea">
					<h2>
						<c:choose>
							<c:when test="${ map.cateSub eq '1'}"> 중고 거래 - 교재 </c:when>
							<c:when test="${ map.cateSub eq '2'}"> 중고 거래 - 교구 </c:when>
							<c:when test="${ map.cateSub eq '3'}"> 중고 거래 - 일상 용품 </c:when>
							<c:otherwise> 중고거래 </c:otherwise>
						</c:choose>
					</h2>
					<p>중고거래 게시판 입니다.</p>
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
							<input type="hidden" name="cateSub" value=${ map.cateSub }>
							<input id="search" name="searchWord"
								   class="inputTypeText" placeholder="" value="" type="text">
							<input id= "submitbtn" type="submit" value="검색하기"></p>
					</fieldset>
				</div>
			</form>
			<div class="xans-element- xans-product xans-product-normalpackage"><!-- 정렬기준 외 -->
				<div class="xans-element- xans-product xans-product-normalmenu">
					<div class="function" id="Product_ListMenu">
						<button type="button" onclick="location.href='${contextPath}/market/write.do';">글쓰기</button>
					</div>
				</div>
				<!-- 일반상품진열 -->
				<div class="xans-element- xans-product xans-product-listnormal ec-base-product">
					<!--
            $count = 100
                ※ 상품진열갯수를 설정하는 변수입니다. 설정하지 않을 경우, 최대 200개의 상품이 진열 됩니다.
                ※ 진열된 상품이 많으면, 쇼핑몰에 부하가 발생할 수 있습니다.
            $basket_result = /product/add_basket.html
            $basket_option = /product/basket_option.html
        -->
					<ul class="prdList grid4">
						<c:forEach items="${ boardLists }" var="row" varStatus="loop">
							<li id="" class="xans-record-">
								<div class="thumbnail">
									<div class="prdImg">
										<a href="${contextPath}/market/view.do?brdId=${ row.brdId }">
											<img src="${contextPath}/Uploads/${ row.sfile }" alt=""></a>
									</div>
								</div>
								<div class="description">
									<p class="summary">[${ row.status }] ${ row.dealAddress }</p>
									<strong class="name">
										<a href="${contextPath}/market/view.do?brdId=${ row.brdId }" class="">
											<span style="font-size:18px;color:#070707;">${ row.title }</span>
										</a>
									</strong>
									<ul class="xans-element- xans-product xans-product-listitem spec">
										<li rel="판매가" class=" xans-record-">
											<span
													style="font-size:20px;color:#070707;font-weight:bold;">${ row.price }원</span><span
												id="span_product_tax_type_text" style=""> </span>
										</li>
									</ul>
								</div>
							</li>
						</c:forEach>
					</ul>
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