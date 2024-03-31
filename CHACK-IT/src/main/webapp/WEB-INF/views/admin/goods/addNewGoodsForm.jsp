<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<meta charset="utf-8">
<head>
  <link rel="stylesheet" href="/resources/css/admin.css">
  <script type="text/javascript">
      var cnt = 1;

      function fn_addFile() {
          if (cnt <= 3) {
              $("#d_file").append("<p id = 'detail_image" + cnt + "' >상세 이미지 " + cnt + ": " +
                  "<input type='file' name='detail_image" + cnt + "'> " +
                  "<a href='javascript:fn_removeFileButton(" + cnt + ")'> X </a>" +
                  "</p><br>");
          } else {
              alert('상세 이미지는 3개까지 추가 가능합니다')
          }

          cnt++;
      }

      function fn_removeFileButton(i) {
          $('#detail_image' + i).remove();
          if (cnt > 0) {
              cnt--;
          }
      }

      //goodsSalesPrice 항목 미제거로 인해 임시로 goodsPrice입력과 동일하게 설정
      function fn_setGoodsSalesPrice() {
          document.querySelector("#goodsSalesPrice").value = document.querySelector("#goodsPrice").value;
      }
  </script>
</head>

<BODY>
<form:form modelAttribute="goodsVO" action="${contextPath}/admin/goods/addNewGoods.do"
           method="post" enctype="multipart/form-data">
<h1>새 상품 등록</h1>

<div class="tab_container">
  <!-- 내용 들어 가는 곳 -->
  <div class="tab_container" id="container">
    <ul class="tabs">
      <li><a href="#tab1">상품 정보</a></li>
      <li><a href="#tab2">상품 소개</a></li>
      <li><a href="#tab3">저자 소개</a></li>
      <li><a href="#tab4">상품 목차</a></li>
      <li><a href="#tab5">출판사 서평</a></li>
      <li><a href="#tab6">추천사</a></li>
      <li><a href="#tab7">상품 이미지</a></li>
    </ul>
    <div class="tab_container">
      <div class="tab_content" id="tab1">
        <table class="detail_table">
            <%--			<tr >--%>
            <%--				<td width=200 >제품분류</td>--%>
            <%--				<td width=500><select name="goods_sort">--%>
            <%--						<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷--%>
            <%--						<option value="디지털 기기">디지털 기기--%>
            <%--					</select>--%>
            <%--				</td>--%>
            <%--			</tr>--%>
          <tr>
            <td>상품 종류</td>
            <td>
              <select name="goodsStatus">
                <option value="bestseller">베스트셀러</option>
                <option value="steadyseller">스테디셀러</option>
                <option value="newbook" selected>신간</option>
                <option value="on_sale">판매중</option>
                <option value="buy_out">품절</option>
                <option value="out_of_print">절판</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>상품 카테고리</td>
            <td>
              <select name="goodsCateMain">
                <option value=1 selected>백엔드</option>
                <option value=2>프론트엔드</option>
                <option value=3>모바일 앱 개발</option>
                <option value=4>알고리즘•자료구조</option>
                <option value=5>데이터베이스</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>상품 이름</td>
            <td><form:input path="goodsTitle" type="text" size="40"/></td>
            <td><form:errors path="goodsTitle" cssStyle="color: #dd362a"/></td>
          </tr>
          <tr>
            <td>저자</td>
            <td><form:input path="goodsWriter" type="text" size="40"/></td>
            <td><form:errors path="goodsWriter" cssStyle="color: #dd362a"/></td>
          </tr>
          <tr>
            <td>출판사</td>
            <td><form:input path="goodsPublisher" type="text" size="40"/></td>
            <td><form:errors path="goodsPublisher" cssStyle="color: #dd362a"/></td>
          </tr>
          <tr>
            <td>ISBN</td>
            <td><form:input path="goodsIsbn" type="text" size="40"/></td>
            <td><form:errors path="goodsIsbn" cssStyle="color: #dd362a"/></td>
          </tr>
          <tr>
            <td>상품 출판일</td>
            <td><form:input path="goodsPublishedDate" type="date" size="40"/></td>
          </tr>
          <tr>
            <td>상품 총 페이지 수</td>
            <td><form:input path="goodsTotalPage" type="number"/></td>
            <td><form:errors path="goodsTotalPage" cssStyle="color: #dd362a"/></td>
          </tr>
          <tr>
            <td>상품 판매가</td>
            <td><form:input path="goodsPrice" type="number" size="40" onchange="fn_setGoodsSalesPrice()"
                            id="goodsPrice"/></td>
            <td><form:errors path="goodsPrice" cssStyle="color: #dd362a"/></td>
            <form:input path="goodsSalesPrice" type="hidden" size="40" id="goodsSalesPrice" value=""/>
          </tr>
            <%--			<tr>--%>
            <%--				<td >제품 구매 포인트</td>--%>
            <%--				<td><input name="goods_point" type="text" size="40" /></td>--%>
            <%--			</tr>--%>
          <tr>
            <td>상품 배송비</td>
            <td><form:input path="goodsDeliveryPrice" type="number" size="40"/></td>
            <td><form:errors path="goodsDeliveryPrice" cssStyle="color: #dd362a"/></td>
          </tr>
          <tr>
            <td>상품 도착 예정일</td>
            <td><form:input path="goodsDeliveryDate" type="date" size="40"/></td>
          </tr>
        </table>
      </div>
      <div class="tab_content" id="tab2">
        <table class="detail_table">
          <tr>
            <th>상품 소개</th>
            <td><form:errors path="goodsIntro" cssStyle="color: #dd362a"/></td>
            <td class="text_container"><form:textarea rows="25" path="goodsIntro"/></td>
          </tr>
        </table>
      </div>
      <div class="tab_content" id="tab3">
        <table class="detail_table">
          <tr>
            <th>상품 저자 소개</th>
            <td><form:errors path="goodsWriterIntro" cssStyle="color: #dd362a"/></td>
            <td class="text_container"><form:textarea rows="25" path="goodsWriterIntro"/></td>
          </tr>
        </table>
      </div>
      <div class="tab_content" id="tab4">
        <table class="detail_table">
          <tr>
            <th>책 목차</th>
            <td><form:errors path="goodsContentsOrder" cssStyle="color: #dd362a"/></td>
            <td class="text_container"><form:textarea rows="25" path="goodsContentsOrder"/></td>
          </tr>
        </table>
      </div>
      <div class="tab_content" id="tab5">
        <table class="detail_table">
          <tr>
            <th>출판사 서평</th>
            <td><form:errors path="goodsPublisherComment" cssStyle="color: #dd362a"/></td>
            <td class="text_container"><form:textarea rows="25" path="goodsPublisherComment"/></td>
          </tr>
        </table>
      </div>
      <div class="tab_content" id="tab6">
        <table class="detail_table">
          <tr>
            <th>추천사</th>
            <td><form:errors path="goodsRecommendation" cssStyle="color: #dd362a"/></td>
            <td class="text_container"><form:textarea rows="25" path="goodsRecommendation"/></td>
          </tr>
        </table>
      </div>
      <div class="tab_content" id="tab7">
        <STRONG>메인 이미지</strong>: <input type="file" name="main_image"><br>
        <input type="button" value="상세 이미지 추가" onClick="fn_addFile()"/><br>
        <div id="d_file">
        </div>
      </div>
    </div>
  </div>
  <div class="clear"></div>
  <section id="center">
          <input type="submit" value="상품 등록하기">
  </section>
</div>
</form:form>
