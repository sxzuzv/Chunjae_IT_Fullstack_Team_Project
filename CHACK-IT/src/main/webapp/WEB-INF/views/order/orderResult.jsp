<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
</head>
<BODY>
<H1>1.최종 주문 내역서</H1>
<TABLE class="list_view">
  <thead>
  <tr>
    <td>주문 번호</td>
    <td colspan=2 class="fixed">주문 상품명</td>
    <td>수량</td>
    <td>주문 금액</td>
    <td>배송비</td>
    <td>주문 금액 합계</td>
  </tr>
  </thead>
  <TR>
    <c:forEach var="item" items="${myOrderList }">
    <td> ${item.orderId }</td>
    <TD class="goods_image">
      <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">
        <IMG width="75" alt=""
             src="${contextPath}/thumbnails.do?goods_id=${item.goodsId}&fileName=${item.goodsFileName}">
      </a>
    </TD>
    <TD>
      <h2 align="left">
        <A href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">${item.goodsTitle }</A>
      </h2>
    </TD>
    <td>
      <h2>${item.orderGoodsQty }개</h2>
    </td>
    <td><h2>${item.orderGoodsQty *item.goodsSalesPrice}원</h2></td>
      <%-- todo: 배송비 값 받아오기 --%>
    <td><h2>${item.goodsDeliveryPrice}원</h2></td>
      <%--    <td><h2>${1500 *item.orderGoodsQty }원</h2></td>--%>
    <td>
      <h2>${item.orderGoodsQty *item.goodsSalesPrice + item.goodsDeliveryPrice}원</h2>
    </td>
  </TR>
  </c:forEach>
</TABLE>
<DIV class="clear"></DIV>
<form name="form_order">
  <br>
  <br>
  <H1>2.배송지 정보</H1>
  <div class="destination_info">
    <div class="customer_info">
      <h2>[ 주문자 정보 ]</h2>
      <table>
        <TBODY>
        <tr class="dot_line">
          <th>이름</th>
          <td>
            <input type="text" value="${orderer.memberName}" size="15" disabled/>
          </td>
          <th>핸드폰</th>
          <td>
            <input type="text" value="${orderer.memberHp1}-${orderer.memberHp2}-${orderer.memberHp3}" size="15"
                   disabled/>
          </td>
        </tr>
        <tr class="dot_line">
          <th>이메일</th>
          <td>
            <input type="text" value="${orderer.memberEmail1}@${orderer.memberEmail2}" size="15" disabled/>
          </td>
        </tr>
        </TBODY>
      </table>
    </div>
    <h2>[ 배송지 정보 ]</h2>
    <DIV class="detail_table">
      <TABLE>
        <TBODY>
        <TR class="dot_line">
          <TD class="fixed_join">배송방법</TD>
          <TD>
            ${myOrderInfo.deliveryMethod }
          </TD>
        </TR>
        <TR class="dot_line">
          <TD class="fixed_join">받으실 분</TD>
          <TD>
            ${myOrderInfo.receiverName }
          </TD>
        </TR>
        <TR class="dot_line">
          <TD class="fixed_join">휴대폰번호</TD>
          <TD>
            ${myOrderInfo.receiverHp1}-${myOrderInfo.receiverHp2}-${myOrderInfo.receiverHp3}
          </TD>
        </TR>
        <TR class="dot_line">
          <TD class="fixed_join">주소</TD>
          <td>
            ${myOrderInfo.deliveryAddress}
          </td>
        </TR>
        <TR class="dot_line">
          <TD class="fixed_join">배송 메시지</TD>
          <TD>
            ${myOrderInfo.deliveryMessage}
          </TD>
        </TR>
        <TR class="dot_line">
          <TD class="fixed_join">선물 포장</TD>
          <td>
            ${myOrderInfo.giftWrapping}
          </td>
        </TR>
        </TBODY>
      </TABLE>
    </DIV>
  </div>
  
  <DIV class="clear"></DIV>
  <H1>3.결제정보</H1>
  <DIV class="detail_table">
    <table>
      <TBODY>
      <TR class="dot_line">
        <TD class="fixed_join">결제방법</TD>
        <TD>
          ${myOrderInfo.payMethod }
        </TD>
      </TR>
      <c:if test="${myOrderInfo.payMethod} == '신용카드'">
        <TR class="dot_line">
          <TD class="fixed_join">결제카드</TD>
          <TD>
              ${myOrderInfo.cardComName}
          </TD>
        </TR>
        <TR class="dot_line">
          <TD class="fixed_join">할부기간</TD>
          <TD>
              ${myOrderInfo.cardPayMonth }
          </TD>
        </TR>
      </c:if>
      </TBODY>
    </table>
  </DIV>
</form>
<DIV class="clear"></DIV>
<section id="center">
  <button type="button" class="btn btn-light" onclick="location.href='${contextPath}/main/main.do'">
    쇼핑 계속하기
  </button>
  <DIV class="clear"></DIV>
</section>
