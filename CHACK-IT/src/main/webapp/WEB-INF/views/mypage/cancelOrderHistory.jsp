<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/resources/css/mypage.css">
  <script>
      function search_order_history(fixedSearchPeriod) {
          var formObj = document.createElement("form");
          var i_fixedSearch_period = document.createElement("input");
          i_fixedSearch_period.name = "fixedSearchPeriod";
          i_fixedSearch_period.value = fixedSearchPeriod;
          formObj.appendChild(i_fixedSearch_period);
          document.body.appendChild(formObj);
          formObj.method = "get";
          formObj.action = "${contextPath}/mypage/cancelOrderHistory.do";
          formObj.submit();
      }
  
  </script>
</head>
<body>
<h1>주문 배송 조회</h1>
<form method="post">
  <table class="search_option">
    <tbody>
    <tr>
      <td colspan="2">
        <input id="simple" type="radio" name="simple" checked/>
        <label for="simple">간단조회</label>
        <input id="by_day" type="radio" name="simple"/>
        <label for="by_day">일간</label>
        <input id="by_month" type="radio" name="simple"/>
        <label for="by_month">월간</label>
      </td>
    </tr>
    <tr>
      <td>
        <select name="curYear">
          <c:forEach var="i" begin="0" end="5">
            <c:choose>
              <c:when test="${endYear==endYear-i }">
                <option value="${endYear}" selected>${endYear}</option>
              </c:when>
              <c:otherwise>
                <option value="${endYear-i }">${endYear-i }</option>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </select>년 <select name="curMonth">
        <c:forEach var="i" begin="1" end="12">
          <c:choose>
            <c:when test="${endMonth==i }">
              <option value="${i }" selected>${i }</option>
            </c:when>
            <c:otherwise>
              <option value="${i }">${i }</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </select>월
        
        <select name="curDay">
          <c:forEach var="i" begin="1" end="31">
            <c:choose>
              <c:when test="${endDay==i }">
                <option value="${i }" selected>${i }</option>
              </c:when>
              <c:otherwise>
                <option value="${i }">${i }</option>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </select>일 &nbsp;이전
      </td>
      <td>
        <a class="btn_search" href="javascript:search_order_history('today')">
          당일
        </a>
        <a class="btn_search" href="javascript:search_order_history('one_week')">
          1주
        </a>
        <a class="btn_search" href="javascript:search_order_history('two_week')">
          2주
        </a>
        <a class="btn_search" href="javascript:search_order_history('one_month')">
          1개월
        </a>
        <a class="btn_search" href="javascript:search_order_history('two_month')">
          2개월
        </a>
        <a class="btn_search" href="javascript:search_order_history('three_month')">
          3개월
        </a>
        <a class="btn_search" href="javascript:search_order_history('four_month')">
          4개월
        </a>
        &nbsp;까지 조회
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <select name="search_condition">
          <option value="2015" checked>전체</option>
          <option value="2014">수령자</option>
          <option value="2013">주문자</option>
          <option value="2012">주문번호</option>
        </select>
        <input type="text" size="30"/>
        <input type="button" value="조회"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        조회한 기간:<input type="text" size="4" value="${beginYear}"/>년
        <input type="text" size="4" value="${beginMonth}"/>월
        <input type="text" size="4" value="${beginDay}"/>일
        &nbsp; ~
        <input type="text" size="4" value="${endYear}"/>년
        <input type="text" size="4" value="${endMonth}"/>월
        <input type="text" size="4" value="${endDay}"/>일
      </td>
    </tr>
    </tbody>
  </table>
  <div class="clear">
  </div>
</form>
<div class="clear"></div>
<table class="list_view">
  <thead align=center>
  <tr>
    <td class="fixed">주문번호</td>
    <td class="fixed">주문일자</td>
    <td>주문내역</td>
    <td>주문금액/수량</td>
    <td>주문상태</td>
  </tr>
  </thead>
  <tbody>
  <c:choose>
    <c:when test="${empty myCancelList }">
      <tr>
        <td colspan=8 class="fixed">
          <strong>취소내역이 없습니다.</strong>
        </td>
      </tr>
    </c:when>
    <c:otherwise>
      <c:forEach var="item" items="${myCancelList }" varStatus="i">
        <c:choose>
          <c:when test="${item.orderId != pre_order_id }">
            <tr>
              <td>
                <a href="${contextPath}/mypage/myOrderDetail.do?order_id=${item.orderId }"><strong>${item.orderId }</strong>
                </a>
              </td>
              <td>
                <strong>${item.payOrderTime }</strong>
              </td>
              <td>
                <strong>
                  <c:forEach var="item2" items="${myCancelList}" varStatus="j">
                    <c:if test="${item.orderId ==item2.orderId}">
                      <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goodsId }">${item2.goodsTitle }</a><br>
                    </c:if>
                  </c:forEach>
                </strong>
              </td>
              <td>
                <strong>
                  <c:forEach var="item2" items="${myCancelList}" varStatus="j">
                    <c:if test="${item.orderId ==item2.orderId}">
                      ${item.goodsSalesPrice*item.orderGoodsQty }원/${item.orderGoodsQty }<br>
                    </c:if>
                  </c:forEach>
                </strong>
              </td>
              <td>
                <strong>
                  <c:choose>
                    <c:when test="${item.deliveryState=='delivery_prepared' }">
                      배송준비중
                    </c:when>
                    <c:when test="${item.deliveryState=='delivering' }">
                      배송중
                    </c:when>
                    <c:when test="${item.deliveryState=='finished_delivering' }">
                      배송완료
                    </c:when>
                    <c:when test="${item.deliveryState=='cancel_order' }">
                      주문취소
                    </c:when>
                    <c:when test="${item.deliveryState=='returning_goods' }">
                      반품
                    </c:when>
                  </c:choose>
                </strong>
              </td>
            </tr>
            <c:set var="pre_order_id" value="${item.orderId }"/>
          </c:when>
        </c:choose>
      </c:forEach>
    </c:otherwise>
  </c:choose>
  </tbody>
</table>

<div class="clear"></div>
</body>
</html>
