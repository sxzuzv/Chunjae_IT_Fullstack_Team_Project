<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/resources/css/mypage.css">
  <c:if test="${message=='cancel_order'}">
    <script>
        window.onload = function () {
            init();
        }

        function init() {
            alert("주문을 취소했습니다.");
        }
    </script>
  </c:if>
  <script>
      function fn_cancel_order(order_id) {
          var answer = confirm("주문을 취소하시겠습니까?");
          if (answer == true) {
              var formObj = document.createElement("form");
              var i_order_id = document.createElement("input");

              i_order_id.name = "order_id";
              i_order_id.value = order_id;

              formObj.appendChild(i_order_id);
              document.body.appendChild(formObj);
              formObj.method = "post";
              formObj.action = "${contextPath}/mypage/cancelMyOrder.do";
              formObj.submit();
          }
      }
  
  </script>
</head>

<h1>기본 배송지 정보
  <button onclick="location.href='${contextPath}/mypage/myDetailInfo.do'"
          class="view_more">더보기 <span>&raquo;</span>
  </button>
</h1>
<div class="default_orderer_info">
  <p>
    <span class="info_caption">이메일</span>
    <span class="info_value">${memberInfo.memberEmail1 }@${memberInfo.memberEmail2 }</span>
  </p>
  <p>
    <span class="info_caption">
      전화번호
    </span>
    <span class="info_value">
      ${memberInfo.memberHp1 }-${memberInfo.memberHp2}-${memberInfo.memberHp3 }
    </span>
  </p>
  <p>
    <span class="info_caption">
      주소
    </span>
    <span class="info_value">
      <b>[도로명]</b> ${memberInfo.roadAddress }
      <br>
      <b>[지번]</b> ${memberInfo.jibunAddress }
    </span>
  </p>
</div>
<h1>최근주문내역
  <%--<A href="${contextPath}/mypage/listMyOrderHistory.do">
    <IMG src="${contextPath}/resources/image/btn_more_see.jpg">
  </A>--%>
  <button onclick="location.href='${contextPath}/mypage/listMyOrderHistory.do'"
          class="view_more">
    더보기 <span>&raquo;</span>
  </button>
</h1>
<table class="list_view">
  <thead>
  <tr>
    <td>주문번호</td>
    <td>주문일자</td>
    <td>주문상품</td>
    <td>주문상태</td>
    <td>주문취소</td>
  </tr>
  </thead>
  <c:choose>
    <c:when test="${ empty myOrderList  }">
      <tr>
        <td colspan=5 class="fixed">
          <strong>주문한 상품이 없습니다.</strong>
        </td>
      </tr>
    </c:when>
    <c:otherwise>
      <c:forEach var="item" items="${myOrderList }" varStatus="i">
        <c:choose>
          <c:when test="${ pre_order_id != item.orderId}">
            <c:choose>
              <c:when test="${item.deliveryState=='delivery_prepared' }">
                <tr bgcolor="lightgreen">
              </c:when>
              <c:when test="${item.deliveryState=='finished_delivering' }">
                <tr bgcolor="lightgray">
              </c:when>
              <c:otherwise>
                <tr bgcolor="orange">
              </c:otherwise>
            </c:choose>
            <tr>
              <td>
                <a href="${contextPath}/mypage/myOrderDetail.do?order_id=${item.orderId }"><span>${item.orderId }</span>
                </a>
              </td>
              <td><span>${item.payOrderTime }</span></td>
              <td align="left">
                <strong>
                  <c:forEach var="item2" items="${myOrderList}" varStatus="j">
                    <c:if test="${item.orderId ==item2.orderId}">
                      <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item2.goodsId }">${item2.goodsTitle }/${item.orderGoodsQty }개</a><br>
                    </c:if>
                  </c:forEach>
                </strong></td>
              <td>
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
                    반품완료
                  </c:when>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${item.deliveryState=='delivery_prepared'}">
                    <input type="button" class="cancel_available" onClick="fn_cancel_order('${item.orderId}')"
                           value="주문취소"/>
                  </c:when>
                  <c:otherwise>
                    <input type="button" class="cancel_unavailable" onClick="fn_cancel_order('${item.orderId}')"
                           value="주문취소" disabled/>
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
            <c:set var="pre_order_id" value="${item.orderId}"/>
          </c:when>
        </c:choose>
      </c:forEach>
    </c:otherwise>
  </c:choose>
</table>

<%--<br><br><br>	--%>
<%--<h1>계좌내역--%>
<%--    <a href="#"> <img  src="${contextPath}/resources/image/btn_more_see.jpg" />  </a>--%>
<%--</h1>--%>
<%--<table border=0 width=100%  cellpadding=10 cellspacing=10>--%>
<%--  <tr>--%>
<%--    <td>--%>
<%--	   예치금 &nbsp;&nbsp;  <strong>10000원</strong>--%>
<%--   </td>--%>
<%--    <td>--%>
<%--	   쇼핑머니 &nbsp;&nbsp; <strong>9000원</strong>--%>
<%--   </td>--%>
<%--   </tr>--%>
<%--   <tr>--%>
<%--    <td>--%>
<%--	   쿠폰 &nbsp;&nbsp;  <strong>6000원</strong>--%>
<%--   </td>--%>
<%--    <td>--%>
<%--	   포인트 &nbsp;&nbsp; <strong>2000원</strong>--%>
<%--   </td>--%>
<%--   </tr>--%>
<%--   <tr>--%>
<%--    <td>--%>
<%--	   상품권 &nbsp;&nbsp;  <strong>4000원</strong>--%>
<%--   </td>--%>
<%--    <td>--%>
<%--		디지털머니 &nbsp;&nbsp; <strong>9000원</strong>--%>
<%--   </td>--%>
<%--   </tr>--%>
<%--</table>--%>
