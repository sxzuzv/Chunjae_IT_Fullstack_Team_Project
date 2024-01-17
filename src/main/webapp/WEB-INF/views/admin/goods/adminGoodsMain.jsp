<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/resources/css/admin.css">
  <script>
      // function search_goods_list(fixedSearchPeriod){
      function search_goods_list(searchPeriod) {
          var formObj = document.createElement("form");
          var i_fixedSearch_period = document.createElement("input");
          i_fixedSearch_period.name = "fixedSearchPeriod";
          i_fixedSearch_period.value = searchPeriod;
          formObj.appendChild(i_fixedSearch_period);
          document.body.appendChild(formObj);
          formObj.method = "get";
          formObj.action = "${contextPath}/admin/goods/adminGoodsMain.do";
          formObj.submit();
      }

      function calcPeriod(search_period) {
          var dt = new Date();
          var beginYear, endYear;
          var beginMonth, endMonth;
          var beginDay, endDay;
          var beginDate, endDate;

          endYear = dt.getFullYear();
          endMonth = dt.getMonth() + 1;
          endDay = dt.getDate();
          if (search_period == 'today') {
              beginYear = endYear;
              beginMonth = endMonth;
              beginDay = endDay;
          } else if (search_period == 'one_week') {
              beginYear = dt.getFullYear();
              beginMonth = dt.getMonth() + 1;
              dt.setDate(endDay - 7);
              beginDay = dt.getDate();

          } else if (search_period == 'two_week') {
              beginYear = dt.getFullYear();
              beginMonth = dt.getMonth() + 1;
              dt.setDate(endDay - 14);
              beginDay = dt.getDate();
          } else if (search_period == 'one_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 1);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          } else if (search_period == 'two_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 2);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          } else if (search_period == 'three_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 3);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          } else if (search_period == 'four_month') {
              beginYear = dt.getFullYear();
              dt.setMonth(endMonth - 4);
              beginMonth = dt.getMonth();
              beginDay = dt.getDate();
          }

          if (beginMonth < 10) {
              beginMonth = '0' + beginMonth;
              if (beginDay < 10) {
                  beginDay = '0' + beginDay;
              }
          }
          if (endMonth < 10) {
              endMonth = '0' + endMonth;
              if (endDay < 10) {
                  endDay = '0' + endDay;
              }
          }
          endDate = endYear + '-' + endMonth + '-' + endDay;
          beginDate = beginYear + '-' + beginMonth + '-' + beginDay;
          //alert(beginDate+","+endDate);
          return beginDate + "," + endDate;
      }
  
  
  </script>
</head>
<body>
<div class="admin_main_title">
  <h1>상품 관리</h1>
  <div id="search">
    <form action="${contextPath}/admin/goods/addNewGoodsForm.do">
      <input type="submit" value="상품 등록하기">
    </form>
  </div>
</div>

<form method="post">
  <TABLE class="search_option">
    <TBODY>
<%--    <TR>--%>
<%--      <TD colspan="2">--%>
<%--        <input type="radio" name="r_search" id="by_regdate" checked/>--%>
<%--        <label for="by_regdate">상품 등록일로 조회</label>--%>
<%--        <input type="radio" name="r_search" id="detailed_search"/>--%>
<%--        <label for="detailed_search">상세 조회</label>--%>
<%--      </TD>--%>
<%--    </TR>--%>
<%--    <TR>--%>
<%--      <TD>--%>
<%--        <select name="curYear">--%>
<%--          <c:forEach var="i" begin="0" end="5">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${endYear==endYear-i}">--%>
<%--                <option value="${endYear}" selected>${endYear}</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <option value="${endYear-i }">${endYear-i }</option>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>년 <select name="curMonth">--%>
<%--        <c:forEach var="i" begin="1" end="12">--%>
<%--          <c:choose>--%>
<%--            <c:when test="${endMonth==i }">--%>
<%--              <option value="${i }" selected>${i }</option>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--              <option value="${i }">${i }</option>--%>
<%--            </c:otherwise>--%>
<%--          </c:choose>--%>
<%--        </c:forEach>--%>
<%--      </select>월--%>
<%--        --%>
<%--        <select name="curDay">--%>
<%--          <c:forEach var="i" begin="1" end="31">--%>
<%--            <c:choose>--%>
<%--              <c:when test="${endDay==i}">--%>
<%--                <option value="${i }" selected>${i }</option>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <option value="${i }">${i }</option>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--          </c:forEach>--%>
<%--        </select>일 &nbsp;이전--%>
<%--      </td>--%>
<%--      <td>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('today')">--%>
<%--          당일--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('one_week')">--%>
<%--          1주--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('two_week')">--%>
<%--          2주--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('one_month')">--%>
<%--          1개월--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('two_month')">--%>
<%--          2개월--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('three_month')">--%>
<%--          3개월--%>
<%--        </a>--%>
<%--        <a class="btn_search" href="javascript:search_order_history('four_month')">--%>
<%--          4개월--%>
<%--        </a>--%>
<%--        까지 조회--%>
<%--      </TD>--%>
<%--    </TR>--%>
<%--    <tr>--%>
<%--      <td colspan="2">--%>
<%--        <select name="search_condition">--%>
<%--          <option value="전체" checked>전체</option>--%>
<%--          <option value="제품번호">상품 번호</option>--%>
<%--          <option value="제품이름">상품 이름</option>--%>
<%--          <option value="제조사">제조사</option>--%>
<%--        </select>--%>
<%--        <input type="text" size="30"/>--%>
<%--        <input type="button" value="조회"/>--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td colspan="2">--%>
<%--        조회한 기간:<input type="text" size="4" value="${beginYear}"/>년--%>
<%--        <input type="text" size="4" value="${beginMonth}"/>월--%>
<%--        <input type="text" size="4" value="${beginDay}"/>일 ~--%>
<%--        <input type="text" size="4" value="${endYear }"/>년--%>
<%--        <input type="text" size="4" value="${endMonth }"/>월--%>
<%--        <input type="text" size="4" value="${endDay }"/>일--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--    </TBODY>--%>
  </TABLE>
  <DIV class="clear">
  </DIV>
</form>
<DIV class="clear"></DIV>
<TABLE class="list_view admin_goods_list">
  <thead>
  <tr>
    <td>상품 번호</td>
    <td>상품 이름</td>
    <td style="width: 150px;">저자</td>
    <td style="max-width: 150px;">출판사</td>
    <td>상품 가격</td>
    <td>입고일자</td>
    <td>출판일</td>
  </tr>
  </thead>
  <TBODY>
  <c:choose>
    <c:when test="${empty newGoodsList }">
      <TR>
        <TD colspan=8 class="fixed">
          <strong>조회된 상품이 없습니다.</strong>
        </TD>
      </TR>
    </c:when>
    <c:otherwise>
      <c:forEach var="item" items="${newGoodsList }">
        <TR>
          <TD>
              ${item.goodsId }
          </TD>
          <TD align="left">
            <a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_Id=${item.goodsId}">
                ${item.goodsTitle }
            </a>
          </TD>
          <TD>
              ${item.goodsWriter }
          </TD>
          <TD>
              ${item.goodsPublisher }
          </TD>
          <td>
              ${item.goodsSalesPrice }
          </td>
          <td>
              ${item.goodsEnteredDate }
          </td>
          <td>
            <c:set var="pub_date" value="${item.goodsPublishedDate}"/>
            <c:set var="arr" value="${fn:split(pub_date,' ')}"/>
            <c:out value="${arr[0]}"/>
          </td>
        </TR>
      </c:forEach>
    </c:otherwise>
  </c:choose>
  </TBODY>
</table>
<table class="page_controller">
  <tr>
    <td>
      <c:forEach var="page" begin="1" end="10" step="1">
      <c:if test="${section >1 && page==1 }">
      <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;
        &nbsp;</a>
      </c:if>
      <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
      <c:if test="${page ==10 }">
      <a href="${contextPath}/admin/goods/adminGooodsMain.do?chapter=${section+1}&pageNum=${section*10+1}"
         class="btn_next">&nbsp;
        next</a>
      </c:if>
      </c:forEach>
</TABLE>
<DIV class="clear"></DIV>
<%--<br><br><br>
<H3>상품 등록하기</H3>
<DIV id="search">
  <form action="${contextPath}/admin/goods/addNewGoodsForm.do">
    <input type="submit" value="상품 등록하기">
  </form>
</DIV>--%>
</body>
</html>
