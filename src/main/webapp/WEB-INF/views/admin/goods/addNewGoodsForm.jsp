<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>

<meta charset="utf-8">
<head>
<script type="text/javascript">
  var cnt=1;

  function fn_addFile(){
	  if(cnt <= 3){
		  $("#d_file").append("<p id = 'detail_image"+cnt+"' >상세 이미지 "+cnt+": "+
				  "<input type='file' name='detail_image"+cnt+"'> " +
				  "<a href='javascript:fn_removeFileButton("+cnt+")'> X </a>"+
				  "</p><br>");
	  }else{
		  alert('상세 이미지는 3개까지 추가 가능합니다')
	  }
  	
  	cnt++;
  }

  function fn_removeFileButton(i) {
	  $('#detail_image'+i).remove();
	  if(cnt>0){
		  cnt--;
	  }
  }
</script>    
</head>

<BODY>
	<form:form modelAttribute="goodsVO" action="${contextPath}/admin/goods/addNewGoods.do"
			   method="post"  enctype="multipart/form-data">
			<h1>새 상품 등록</h1>

		<div class="tab_container">
		<!-- 내용 들어 가는 곳 -->
		<div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">상품 정보</a></li>
				<li><a href="#tab2">상품 목차</a></li>
				<li><a href="#tab3">상품 저자 소개</a></li>
				<li><a href="#tab4">상품 소개</a></li>
				<li><a href="#tab5">출판사 상품 평가</a></li>
				<li><a href="#tab6">추천사</a></li>
				<li><a href="#tab7">상품 이미지</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
					<table >
	<%--			<tr >--%>
	<%--				<td width=200 >제품분류</td>--%>
	<%--				<td width=500><select name="goods_sort">--%>
	<%--						<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷--%>
	<%--						<option value="디지털 기기">디지털 기기--%>
	<%--					</select>--%>
	<%--				</td>--%>
	<%--			</tr>--%>
				<tr >
					<td >제품 이름</td>
					<td><input name="goodsTitle" type="text" size="40" /></td>
				</tr>

				<tr>
					<td >저자</td>
					<td><input name="goodsWriter" type="text" size="40" /></td>
				</tr>
				<tr>
					<td >출판사</td>
					<td><input name="goodsPublisher" type="text" size="40" /></td>
				</tr>
				<tr>
					<td >제품 정가</td>
					<td><input name="goodsPrice" type="text" size="40" /></td>
				</tr>

				<tr>
					<td >제품 판매 가격</td>
					<td><form:input path="goodsSalesPrice" type="number" size="40" /></td>
					<td><form:errors path="goodsSalesPrice" cssClass="text-danger"/></td>
				</tr>


	<%--			<tr>--%>
	<%--				<td >제품 구매 포인트</td>--%>
	<%--				<td><input name="goods_point" type="text" size="40" /></td>--%>
	<%--			</tr>--%>

				<tr>
					<td >제품 출판일</td>
					<td><input  name="goodsPublishedDate"  type="date" size="40" /></td>
				</tr>

				<tr>
					<td >제품 총 페이지 수</td>
					<td><input name="goodsTotalPage" type="text" size="40" /></td>
				</tr>

				<tr>
					<td >ISBN</td>
					<td><form:input path="goodsIsbn" type="text" size="40" /></td>
					<td><form:errors path="goodsIsbn" cssClass="text-danger"/></td>
				</tr>
				<tr>
					<td >제품 배송비</td>
					<td><input name="goodsDeliveryPrice" type="text" size="40" /></td>
				</tr>
				<tr>
					<td >제품 도착 예정일</td>
					<td><input name="goodsDeliveryDate"  type="date" size="40" /></td>
				</tr>

				<tr>
					<td >제품 종류</td>
					<td>
					<select name="goodsStatus">
					  <option value="bestseller"  >베스트셀러</option>
					  <option value="steadyseller" >스테디셀러</option>
					  <option value="newbook" selected >신간</option>
					  <option value="on_sale" >판매중</option>
					  <option value="buy_out" >품절</option>
					  <option value="out_of_print" >절판</option>
					</select>
					</td>
				</tr>
				<tr>
					<td >제품 카테고리</td>
					<td>
						<select name="goodsCateMain">
							<option value=1 selected>백엔드</option>
							<option value=2 >프론트엔드</option>
							<option value=3 >모바일 앱 개발</option>
							<option value=4 >알고리즘•자료구조</option>
							<option value=5 >데이터베이스</option>
						</select>
					</td>
				</tr>
				<tr>
				 <td>
				   <br>
				 </td>
				</tr>
					</table>
				</div>
				<div class="tab_content" id="tab2">
					<H4>책 목차</H4>
					<table>
					 <tr>
						<td >책 목차</td>
						<td><textarea rows="100" cols="80" name="goodsContentsOrder"></textarea></td>
					</tr>
					</table>
				</div>
				<div class="tab_content" id="tab3">
					<H4>제품 저자 소개</H4>
					 <table>
					 <tr>
						<td>제품 저자 소개</td>
						<td><textarea rows="100" cols="80" name="goodsWriterIntro"></textarea></td>
					</tr>
				   </table>
				</div>
				<div class="tab_content" id="tab4">
					<H4>제품 소개</H4>
					<table>
						<tr>
							<td >제품 소개</td>
							<td><textarea  rows="100" cols="80" name="goodsIntro"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="tab_content" id="tab5">
					<H4>출판사 제품 평가</H4>
					<table>
					 <tr>
						<td>출판사 제품 평가</td>
						<td><textarea  rows="100" cols="80" name="goodsPublisherComment"></textarea></td>
					</tr>
				</table>
				</div>
				<div class="tab_content" id="tab6">
					<H4>추천사</H4>
					 <table>
						 <tr>
						   <td>추천사</td>
							<td><textarea  rows="100" cols="80" name="goodsRecommendation"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="tab_content" id="tab7">
					<h4>상품 이미지</h4>

					<STRONG>메인 이미지</strong>: <input type="file" name="main_image"><br>
					<input type="button"  value="상세 이미지 추가" onClick="fn_addFile()"/><br>
					<div id="d_file">

					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	<center>
		 <table>
		 <tr>
				  <td align=center>
					  <input  type="submit" value="상품 등록하기">
				  </td>
				</tr>
		 </table>
	</center>
	</div>
	</form:form>
