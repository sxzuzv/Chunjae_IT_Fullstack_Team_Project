<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
<h1>1. 주문 상세정보</h1>
<table class="list_view">
  <thead>
  <tr>
    <td>주문번호</td>
    <td>주문일자</td>
    <td colspan="2">주문상품명</td>
    <td>수량</td>
    <td>주문금액</td>
    <td>배송비</td>
    <%--    <th>예상적립금</th>--%>
    <td>주문금액합계</td>
  </tr>
  </thead>
  <tbody class="order_detail">
  <c:forEach var="item" items="${myOrderList }">
    <tr>
      <td> ${item.orderId}</td>
      <td> ${item.payOrderTime}</td>
      <td class="goods_image">
        <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">
          <IMG width="75" alt=""
               src="${contextPath}/thumbnails.do?goods_id=${item.goodsId}&fileName=${item.goodsFileName}">
        </a>
      </td>
      <td>
        <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">${item.goodsTitle }</a>
      </td>
      <td>
          ${item.orderGoodsQty }개
      </td>
      <td>${item.orderGoodsQty *item.goodsSalesPrice}원</td>
      <td>${item.goodsDeliveryPrice}원</td>
        <%--      <td><h2>${1500 *item.orderGoodsQty }원</h2></td>--%>
      <td>
          ${item.orderGoodsQty *item.goodsSalesPrice + item.goodsDeliveryPrice}원
      </td>
    </tr>
  </c:forEach>
  </tbody>
  <tr>
    <td>
      <strong>* 도서의 배송비는 주문한 도서 중 가장 높은 가격의 배송비로 일괄 적용됩니다. *</strong>
    </td>
  </tr>
</table>
<div class="clear"></div>
<form name="form_order">
  <h1>2.배송지 정보</h1>
  <div class="destination_info">
    <div class="customer_info">
      <h2>[ 주문자 정보 ]</h2>
      <table>
        <tbody>
        <tr>
          <th>이름</th>
          <td>
            <input type="text" value="${orderer.memberName}" size="15" disabled/>
          </td>
        </tr>
        <tr>
          <th>핸드폰</th>
          <td>
            <input type="text" value="${orderer.memberHp1}-${orderer.memberHp2}-${orderer.memberHp3}" size="15"
                   disabled/>
          </td>
        </tr>
        <tr>
          <th>이메일</th>
          <td>
            <input type="text" value="${orderer.memberEmail1}@${orderer.memberEmail2}" size="15" disabled/>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
    <h2>[ 수령자 정보 ]</h2>
    <div class="detail_table">
      <table>
        <tbody>
        <tr class="dot_line">
          <td class="fixed_join">배송방법</td>
          <td>
            ${myOrderList[0].deliveryMethod }
          </td>
        </tr>
        <tr class="dot_line">
          <td class="fixed_join">받으실 분</td>
          <td>
            ${myOrderList[0].receiverName }
          </td>
        </tr>
        <tr class="dot_line">
          <td class="fixed_join">휴대폰번호</td>
          <td>
            ${myOrderList[0].receiverHp1}-${myOrderList[0].receiverHp2}-${myOrderList[0].receiverHp3}</td>
        </tr>
        <tr class="dot_line">
          <td class="fixed_join">주소</td>
          <td>
            ${myOrderList[0].deliveryAddress}
          </td>
        </tr>
        <tr class="dot_line">
          <td class="fixed_join">배송 메시지</td>
          <td>
            ${myOrderList[0].deliveryMessage}
          </td>
        </tr>
        <tr class="dot_line">
          <td class="fixed_join">선물 포장</td>
          <td>
            ${myOrderList[0].giftWrapping}
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="clear"></div>
  
  <H1>3.결제정보</H1>
  <DIV class="detail_table">
    <table>
      <tbody>
      <tr class="dot_line">
        <td class="fixed_join">결제방법</td>
        <td>
          ${myOrderList[0].payMethod }
        </td>
      </tr>
      <tr class="dot_line">
        <td class="fixed_join">결제카드</td>
        <td>
          ${myOrderList[0].cardComName}
        </td>
      </tr>
      <tr class="dot_line">
        <td class="fixed_join">할부기간</td>
        <td>
          ${myOrderList[0].cardPayMonth }
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</form>
<div class="clear"></div>
<section id="center">
  <button class="redirect_main" onclick="location.href='${contextPath}/main/main.do'">쇼핑 계속하기</button>
</section>
<div class="clear"></div>		
	
			
			
