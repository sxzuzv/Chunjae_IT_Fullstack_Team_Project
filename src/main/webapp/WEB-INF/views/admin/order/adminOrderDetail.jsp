<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="orderList"  value="${orderMap.orderList}"  />
<c:set var="deliveryInfo"  value="${orderMap.deliveryInfo}"  />
<c:set var="orderer"  value="${orderMap.orderer}"  />

<script  type="text/javascript">
function fn_modify_order_state(order_id){
	alert(order_id);
	console.log(typeof order_id);
	var s_delivery_state=document.getElementById("s_delivery_state");
    var index = s_delivery_state.selectedIndex;   //선택한 옵션의 인덱스를 구합니다.
    var value = s_delivery_state[index].value;    //선택한 옵션의 값을 구합니다.
	console.log("value: " +value);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/order/modifyDeliveryState.do",
		data : {
			orderId:order_id,
			"deliveryState":value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("주문 정보를 수정했습니다.");
				location.href="${contextPath}/admin/order/orderDetail.do?orderId="+order_id;
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax		
}

</script>
</head>
<body>
	<H1>1. 주문 상세 정보</H1>
	<table class="list_view">
		<tbody align=center>
			<tr style="background: #33ff00">
			     <td>주문 번호 </td>
				<td colspan=2 class="fixed">주문 상품명</td>
				<td>수량</td>
				<td>주문 금액</td>
				<td>배송비</td>
				<td>예상 적립금</td>
				<td>주문 금액 합계</td>
			</tr>
			<tr>
				<c:forEach var="item" items="${orderList }">
				    <td> ${item.orderId }</td>
					<td class="goods_image">
					  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">
					    <img width="75" alt=""  src="${contextPath}/thumbnails.do?goods_id=${item.goodsId}&fileName=${item.goodsFileName}">
					  </a>
					</td>
					<td>
					  <h2>
					     <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">${item.goodsTitle }</a>
					  </h2>
					</td>
					<td>
					  <h2>${item.orderGoodsQty }개</h2>
					</td>
					<td><h2>${item.orderGoodsQty *item.goodsSalesPrice}원 (10% 할인)</h2></td>
					<td><h2>0원</h2></td>
					<td><h2>${1500 *item.orderGoodsQty }원</h2></td>
					<td>
					  <h2>${item.orderGoodsQty *item.goodsSalesPrice}원</h2>
					</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="clear"></div>
<form name="frm_delivery_list" >	
	<br>
	<br>
	<h1>2. 배송지 정보</h1>
	<div class="detail_table">
	
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">배송 방법</td>
					<td>
					   ${deliveryInfo.deliveryMethod }
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">받으실 분</td>
					<td>
					${deliveryInfo.receiverName }
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">휴대폰 번호</td>
					<td>
					  ${deliveryInfo.receiverHp1}-${deliveryInfo.receiverHp2}-${deliveryInfo.receiverHp3}</td>
				  </tr>
<%--				<tr class="dot_line">--%>
<%--					<td class="fixed_join">유선 전화(선택)</td>--%>
<%--					<td>--%>
<%--					   ${deliveryInfo.receiver_tel1}-${deliveryInfo.receiver_tel2}-${deliveryInfo.receiver_tel3}</td>--%>
<%--				</tr>--%>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   ${deliveryInfo.deliveryAddress}
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">배송 메시지</td>
					<td>
					${deliveryInfo.deliveryMessage}
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">선물 포장</td>
					<td>
					${deliveryInfo.giftWrapping}
					</td>
				</tr>
			</tbody>
		</table>
		
	</div>
	<div >
	  <br><br>
	   <h2>주문 고객</h2>
		 <table >
		   <TBODY>
			 <tr class="dot_line">
				<td ><h2>이름</h2></td>
				<td>
				 <input  type="text" value="${orderer.memberName}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>휴대전화</h2></td>
				<td>
				 <input  type="text" value="${orderer.memberHp1}-${orderer.memberHp2}-${orderer.memberHp3}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td><h2>이메일</h2></td>
				<td>
				   <input  type="text" value="${orderer.memberEmail1}@${orderer.memberEmail2}" size="15" disabled />
				</td>
			  </tr>
		   </tbody>
		</table>
	</div>
	<div class="clear"></div>
	<br>
	<br>
	<br>
	<h1>3. 결제 정보</h1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">결제 방법</td>
					<td>
					   ${deliveryInfo.payMethod }
				    </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">결제 카드</td>
					<td>
					   ${deliveryInfo.cardComName}
				    </TD>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">할부 기간</td>
					<td>
					   ${deliveryInfo.cardPayMonth }
				    </td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="clear"></div>
	<br>
	<br>
	<br>
	<h1>4. 배송 상태</h1>
	<div class="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td>
				<select name="s_delivery_state"  id="s_delivery_state">
				 <c:choose>
				   <c:when test="${deliveryInfo.deliveryState=='delivery_prepared' }">
				     <option  value="delivery_prepared" selected>배송 준비 중</option>
				     <option  value="delivering">배송 중</option>
				     <option  value="finished_delivering">배송 완료</option>
				     <option  value="cancel_order">주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				    <c:when test="${deliveryInfo.deliveryState=='delivering' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering" selected >배송 중</option>
				     <option  value="finished_delivering">배송 완료</option>
				     <option  value="cancel_order">주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${deliveryInfo.deliveryState=='finished_delivering' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering"  >배송 중</option>
				     <option  value="finished_delivering" selected>배송 완료</option>
				     <option  value="cancel_order">주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${deliveryInfo.deliveryState=='cancel_order' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering"  >배송 중</option>
				     <option  value="finished_delivering" >배송 완료</option>
				     <option  value="cancel_order" selected>주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${deliveryInfo.deliveryState=='returning_goods' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering"  >배송 중</option>
				     <option  value="finished_delivering" >배송 완료</option>
				     <option  value="cancel_order" >주문 취소</option>
				     <option  value="returning_goods" selected>반품</option>
				   </c:when>
				   </c:choose>
				 </select> 
				  <input  type="hidden" name="h_delivery_state" value="${deliveryInfo.deliveryState }" />
				</td>
				<td width=10%>
			     <input  type="button" value="배송 수정"  onClick="fn_modify_order_state('${deliveryInfo.orderId}')"/>
			    </td>
				</tr>
				
			</tbody>
		</table>
	</div>
</form>
<%--    <div class="clear"></div>--%>
<%--	<br>--%>
<%--	<br>--%>
<%--	<br>--%>
<%--		<br>--%>
<%--		<br> --%>
<%--		<a href="${contextPath}/main/main.do"> --%>
<%--		   <IMG width="75" alt="" src="${contextPath}/resources/image/btn_shopping_continue.jpg">--%>
<%--		</a>--%>
<%--<div class="clear"></div>		--%>
	<br>
	<br>
	<br>
<%--	<a href="${contextPath}/admin/order/adminOrderMain.do"><input type="button" value="목록으로"></a>--%>

	<div>
		<form action="${contextPath}/admin/order/adminOrderMain.do">
			<input type="submit" value="목록으로">
		</form>
	</div>
	
			
			
			