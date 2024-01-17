<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">
<c:choose>
<c:when test='${not empty order_goods_list}'>
<script  type="text/javascript">
    var radioVar;
window.onload=function()
{
	init();
}

//화면이 표시되면서  각각의 주문건에 대한 배송 상태를 표시한다.
function init(){
	var frm_delivery_list=document.frm_delivery_list;
	var h_deliveryState=frm_delivery_list.h_deliveryState;
	var s_deliveryState=frm_delivery_list.s_deliveryState;
	
	
	if(h_deliveryState.length==undefined){
		s_deliveryState.value=h_deliveryState.value; //조회된 주문 정보가 1건인 경우
	}else{
		for(var i=0; s_deliveryState.length;i++){
			s_deliveryState[i].value=h_deliveryState[i].value;//조회된 주문 정보가 여러건인 경우
		}
	}
}
</script>
</c:when>
</c:choose>
<script>
function search_order_history(search_period){

	// temp=calcPeriod(search_period);
	// var date=temp.split(",");
	// var beginDate=date[0];
	// var endDate=date[1];

	<%--var formObj=document.createElement("form");--%>
	<%--var i_command = document.createElement("input");--%>
	<%--var i_beginDate = document.createElement("input");--%>
	<%--var i_endDate = document.createElement("input");--%>

	<%--i_beginDate.name="beginDate";--%>
	<%--i_beginDate.value=beginDate;--%>
	<%--i_endDate.name="endDate";--%>
	<%--i_endDate.value=endDate;--%>

    <%--formObj.appendChild(i_beginDate);--%>
    <%--formObj.appendChild(i_endDate);--%>
    <%--document.body.appendChild(formObj);--%>
    <%--formObj.method="get";--%>
    <%--formObj.action="${contextPath}/admin/order/adminOrderMain.do";--%>
    <%--formObj.submit();--%>

	var formObj=document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	var i_beginDate = document.createElement("input");
	var i_endDate = document.createElement("input");

	i_fixedSearch_period.name="fixedSearchPeriod";
	i_fixedSearch_period.value=search_period;

	formObj.appendChild(i_fixedSearch_period);
	document.body.appendChild(formObj);
	formObj.method="get";
	formObj.action="${contextPath}/admin/order/adminOrderMain.do";
	formObj.submit();
}


function  calcPeriod(search_period){
	var dt = new Date();
	var beginYear,endYear;
	var beginMonth,endMonth;
	var beginDay,endDay;
	var beginDate,endDate;
	
	endYear = dt.getFullYear();
	endMonth = dt.getMonth()+1;
	endDay = dt.getDate();
	if(search_period=='today'){
		beginYear=endYear;
		beginMonth=endMonth;
		beginDay=endDay;
	}else if(search_period=='one_week'){
		beginYear=dt.getFullYear();
		beginMonth=dt.getMonth()+1;
		dt.setDate(endDay-7);
		beginDay=dt.getDate();
		
	}else if(search_period=='two_week'){
		beginYear = dt.getFullYear();
		beginMonth = dt.getMonth()+1;
		dt.setDate(endDay-14);
		beginDay=dt.getDate();
	}else if(search_period=='one_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-1);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='two_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-2);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='three_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-3);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}else if(search_period=='four_month'){
		beginYear = dt.getFullYear();
		dt.setMonth(endMonth-4);
		beginMonth = dt.getMonth();
		beginDay = dt.getDate();
	}
	
	if(beginMonth <10){
		beginMonth='0'+beginMonth;
		if(beginDay<10){
			beginDay='0'+beginDay;
		}
	}
	if(endMonth <10){
		endMonth='0'+endMonth;
		if(endDay<10){
			endDay='0'+endDay;
		}
	}
	endDate=endYear+'-'+endMonth +'-'+endDay;
	beginDate=beginYear+'-'+beginMonth +'-'+beginDay;
	//alert(beginDate+","+endDate);
	return beginDate+","+endDate;
}

function fn_modify_order_state(orderId,select_id){
	var s_deliveryState=document.getElementById(select_id);
    var index = s_deliveryState.selectedIndex;
    var value = s_deliveryState[index].value;
    //console.log("value: "+value );
	 
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/admin/order/modifyDeliveryState.do",
		data : {
			orderId:orderId,
			"deliveryState":value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("주문 정보를 수정했습니다.");
				location.href="${contextPath}/admin/order/adminOrderMain.do";
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

// 라디오 버튼(주문일자로 조회 or 상세 조회) 선택 상태에 따른 검색 조건 활성화
function fn_enable_detail_search(r_search){
	var frm_delivery_list=document.frm_delivery_list;


	t_beginYear=frm_delivery_list.beginYear;
	t_beginMonth=frm_delivery_list.beginMonth;
	t_beginDay=frm_delivery_list.beginDay;
	endYear = frm_delivery_list.endYear;
	endMonth = frm_delivery_list.endMonth;
	endDay = frm_delivery_list.endDay;

	var frm_search_order=document.frm_search_order;
	s_search_type = frm_search_order.s_search_type;
	s_search_word = frm_search_order.s_search_word;
	btn_search = frm_search_order.btn_search;


	// s_search_type=frm_delivery_list.s_search_type;
	// t_search_word=frm_delivery_list.t_search_word;
	// btn_search=frm_delivery_list.btn_search;

	// '상세 조회' 옵션 선택 시
	if(r_search.value=='detail_search'){
		//alert(r_search.value);
		t_beginYear.disabled=true;
		t_beginMonth.disabled=true;
		t_beginDay.disabled=true;
		endYear.disabled=true;
		endMonth.disabled=true;
		endDay.disabled=true;
		
		// s_search_type.disabled=false;
		// t_search_word.disabled=false;
		// btn_search.disabled=false;

		document.getElementById("curYear").disabled = true;
		document.getElementById("curMonth").disabled = true;
		document.getElementById("curDay").disabled = true;


		s_search_type.disabled = false;
		s_search_word.disabled = false;
		btn_search.disabled = false;
		// document.getElementById("d_curYear").disabled = false;
		// document.getElementById("d_curMonth").disabled = false;
		// document.getElementById("d_curDay").disabled = false;
		// document.getElementById("d_endYear").disabled = false;
		// document.getElementById("d_endMonth").disabled = false;
		// document.getElementById("d_endDay").disabled = false;
		// document.getElementById("s_search_type").disabled = false;
		// document.getElementById("s_search_word").disabled = false;
		// document.getElementById("btn_search").disabled = false;

	}else { // '주문일자로 조회' 선택 시
		t_beginYear.disabled=false;
		t_beginMonth.disabled=false;
		t_beginDay.disabled=false;
		endYear.disabled=false;
		endMonth.disabled=false;
		endDay.disabled=false;

		// s_search_type.disabled=true;
		// t_search_word.disabled=true;
		// btn_search.disabled=true;
		document.getElementById("curYear").disabled = false;
		document.getElementById("curMonth").disabled = false;
		document.getElementById("curDay").disabled = false;

		s_search_type.disabled = true;
		s_search_word.disabled = true;
		btn_search.disabled = true;
		// document.getElementById("d_curYear").disabled = true;
		// document.getElementById("d_curMonth").disabled = true;
		// document.getElementById("d_curDay").disabled = true;
		// document.getElementById("d_endYear").disabled = true;
		// document.getElementById("d_endMonth").disabled = true;
		// document.getElementById("d_endDay").disabled = true;
		// document.getElementById("s_search_type").disabled = true;
		// document.getElementById("s_search_word").disabled = true;
		// document.getElementById("btn_search").disabled = true;
	}
}

<%--function fn_detail_order(orderId){--%>
<%--	alert(orderId);--%>
<%--	var frm_delivery_list=document.frm_delivery_list;--%>
<%--	--%>

<%--	var formObj=document.createElement("form");--%>
<%--	var orderId = document.createElement("input");--%>

<%--	i_orderId.name="orderId";--%>
<%--	i_orderId.value=orderId;--%>
<%--	--%>
<%--    formObj.appendChild(i_orderId);--%>
<%--    document.body.appendChild(formObj); --%>
<%--    formObj.method="post";--%>
<%--    formObj.action="${contextPath}/admin/order/orderDetail.do";--%>
<%--    formObj.submit();--%>
<%--	--%>
<%--}--%>

function fn_detail_order(orderId){
	//alert(orderId);
	var frm_delivery_list=document.frm_delivery_list;


	var formObj=document.createElement("form");
	var i_orderId = document.createElement("input");

	i_orderId.name="orderId";
	i_orderId.value=orderId;

	formObj.appendChild(i_orderId);
	document.body.appendChild(formObj);
	formObj.method="post";
	formObj.action="${contextPath}/admin/order/orderDetail.do";
	formObj.submit();

}

// 상세 조회 검색 조건 유지
// $(document).ready(function(){
// 	$('#s_search_type').change(typeChange);
// })
//
// function typeChange() {
// 	var s_search_type = $('#s_search_type option:selected').val();
// 	$('input#s_search_word').val(s_search_type);
// }

//상세조회 버튼 클릭 시 수행
function fn_detail_search(){
    // radioVar = $('input[name=r_search_option]:checked').val(); // value = detail_search
    // alert(radioVar);
    //
    // $(function () {
    //     $(radioVar == 'detail_search').prop("selected", true);
    // })
	// var frm_delivery_list=document.frm_delivery_list;
	// var frm_search_order=document.frm_search_order;

	// beginYear=frm_delivery_list.beginYear.value;
	// beginMonth=frm_delivery_list.beginMonth.value;
	// beginDay=frm_delivery_list.beginDay.value;
	// endYear=frm_delivery_list.endYear.value;
	// endMonth=frm_delivery_list.endMonth.value;
	// endDay=frm_delivery_list.endDay.value;
	// search_type=frm_delivery_list.s_search_type.value;

	// s_search_type = document.getElementById("s_search_type");
	// search_type = (s_search_type.options[s_search_type.selectedIndex].value);
	// search_word=frm_delivery_list.t_search_word.value;

	var s_search_type = document.getElementById("s_search_type");
	var search_type = s_search_type.value;

	var s_search_word = document.getElementById("s_search_word");
	var search_word = s_search_word.value;
	// search_type = s_search_type.value;
	// search_word = frm_search_order.s_search_word.value;

	var formObj=document.createElement("form");
	// var i_command = document.createElement("input");
	// var i_beginDate = document.createElement("input");
	// var i_endDate = document.createElement("input");
	var i_search_type = document.createElement("input");
	var i_search_word = document.createElement("input");

	//alert("beginYear:"+beginYear);
	//alert("endDay:"+endDay);
	//alert("search_type:"+search_type);
	//alert("search_word:"+search_word);

    // i_command.name="command";
    // i_beginDate.name="beginDate";
    // i_endDate.name="endDate";
    i_search_type.name="search_type";
    i_search_word.name="search_word";

    // i_command.value="list_detail_order_goods";
	// i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
    // i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
    i_search_type.value=search_type;
    i_search_word.value=search_word;

    // formObj.appendChild(i_command);
    // formObj.appendChild(i_beginDate);
    // formObj.appendChild(i_endDate);
    formObj.appendChild(i_search_type);
    formObj.appendChild(i_search_word);
    document.body.appendChild(formObj);
    formObj.method="post";
    formObj.action="${contextPath}/admin/order/detailOrder.do";
    formObj.submit();


	alert(i_search_type.value);
	alert(i_search_word.value);

	alert("submit");
}

	<%--function fn_detail_search() {--%>
	<%--	var formObj=document.createElement("form");--%>
	<%--	var i_fixedSearch_period = document.createElement("input");--%>
	<%--	var i_search_word = document.createElement("input");--%>
	<%--	var i_search_type = document.createElement("input");--%>
	<%--	var i_beginDate = document.createElement("input");--%>
	<%--	var i_endDate = document.createElement("input");--%>

	<%--	s_search_type = document.getElementById("s_search_type");--%>
	<%--	search_type = s_search_type.value;--%>

	<%--	s_search_word = document.getElementById("s_search_word");--%>
	<%--	search_word = s_search_word.value;--%>

	<%--	i_fixedSearch_period.name="fixedSearchPeriod";--%>
	<%--	i_fixedSearch_period.value=search_period;--%>

	<%--	i_search_type.name="search_type";--%>
	<%--	i_search_type.value=search_type;--%>
	<%--	alert(i_search_type.value);--%>
	<%--	alert(i_search_word.value);--%>
	<%--	i_search_word.name="search_word";--%>
	<%--	i_search_word.value=search_word;--%>

	<%--	formObj.appendChild(i_search_type);--%>
	<%--	formObj.appendChild(i_search_word);--%>
	<%--	formObj.appendChild(i_fixedSearch_period);--%>
	<%--	document.body.appendChild(formObj);--%>
	<%--	formObj.method="get";--%>
	<%--	formObj.action="${contextPath}/admin/order/adminOrderMain.do";--%>
	<%--	formObj.submit();--%>
	<%--}--%>

<%--$(document).ready(function() {--%>
<%--    $("#btn_search").click(function() {--%>
<%--        $.ajax({--%>
<%--            url : '${contextPath}/admin/order/detailOrder.do',--%>
<%--            type : 'POST',--%>
<%--            data : $("#frm_search_order").serialize(),--%>
<%--            success : function(obg) {--%>
<%--                console.log(obj);--%>
<%--            },--%>
<%--            error : function(e) {--%>
<%--                console.log(e);--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--});--%>

$(document).ready(function () {
	$("#btn_search").click(function () {
		var frm_search_order = document.frm_search_order;
		search_type = frm_search_order.s_search_type.value;
		search_word = frm_search_order.s_search_word.value;

		<%--$.ajax({--%>
		<%--	url : '${contextPath}/admin/order/detailOrder.do',--%>
		<%--	type : 'POST',--%>
		<%--	data : {searchType : search_type, searchWord : search_word},--%>
		<%--	success: function (obj) {--%>
		<%--		console.log(obj);--%>
		<%--	},--%>
		<%--	error: function (e) {--%>
		<%--		console.log(e);--%>
		<%--	}--%>
		<%--});--%>
		$.ajax({
			url: '${contextPath}/admin/order/detailOrder.do',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({ searchType: search_type, searchWord: search_word }),
			success: function (response) {
				console.log(response);
			},
			error: function (e) {
				console.log(e);
			}
		});
	});
});

</script>

</head>
<body>
	<H3>주문 조회</H3>
	<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> 주문일자로 조회 &nbsp;&nbsp;&nbsp;
	<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> 상세 조회 &nbsp;
<%--	<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> 주문일자로 조회 &nbsp;&nbsp;&nbsp;--%>
<%--	<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> 상세 조회 &nbsp;&nbsp;&nbsp;--%>
	<form name="frm_delivery_list" action="${contextPath}/admin/order/adminOrderMain.do" method="post">
		<table>
<%--				<tr>--%>
<%--					<td>--%>
<%--						<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> 주문일자로 조회 &nbsp;&nbsp;&nbsp;--%>
<%--						<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> 상세 조회 &nbsp;&nbsp;&nbsp;--%>
<%--					</td>--%>
<%--				</tr>--%>
				<tr>
					<td>
<%--						<input type="hidden" name="endYear" value="${endYear}" />--%>
					  <select id="curYear" name="curYear">
					     <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==endYear-i}">
					          <option value="${endYear }" selected>${endYear  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${endYear-i }">${endYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년
<%--						<input type="hidden" name="endMonth" value="${endMonth}" />--%>
						<select id="curMonth" name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월

<%--						<input type="hidden" name="endDay" value="${endDay}" />--%>
					 <select id="curDay" name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:search_order_history('today')">
					   <img   src="${contextPath}/resources/image/btn_search_one_day.jpg">
					</a>
					<a href="javascript:search_order_history('one_week')">
					   <img   src="${contextPath}/resources/image/btn_search_1_week.jpg">
					</a>
					<a href="javascript:search_order_history('two_week')">
					   <img   src="${contextPath}/resources/image/btn_search_2_week.jpg">
					</a>
					<a href="javascript:search_order_history('one_month')">
					   <img   src="${contextPath}/resources/image/btn_search_1_month.jpg">
					</a>
					<a href="javascript:search_order_history('two_month')">
					   <img   src="${contextPath}/resources/image/btn_search_2_month.jpg">
					</a>
					<a href="javascript:search_order_history('three_month')">
					   <img   src="${contextPath}/resources/image/btn_search_3_month.jpg">
					</a>
					<a href="javascript:search_order_history('four_month')">
					   <img   src="${contextPath}/resources/image/btn_search_4_month.jpg">
					</a>
					&nbsp;이전까지 조회
					</td>
				</tr>
				<tr>
					<td>
<%--						<input type="hidden" name="beginYear" value="${beginYear}" />--%>
<%--						<input type="hidden" name="beginMonth" value="${beginMonth}" />--%>
<%--						<input type="hidden" name="beginDay" value="${beginDay}" />--%>

						조회 기간 : <input  type="text" name="beginYear" size="4" value="${beginYear}" />년
						<input  type="text"  size="4" name="beginMonth" value="${beginMonth}"/>월
						<input  type="text"  size="4" name="beginDay" value="${beginDay}"/>일 ~
						<input  type="text"  size="4" name="endYear" value="${endYear }" />년
						<input  type="text"  size="4" name="endMonth" value="${endMonth }"/>월
						<input  type="text"  size="4" name="endDay" value="${endDay }"/>일
					</td>
				</tr>
	</form>
	<form name="frm_search_order" action="${contextPath}/admin/order/detailOrder.do" method="post">
		<table>
			<%--			<tr>--%>
			<%--				주문일자 기간 선택 :--%>
			<%--				<input type="hidden" name="d_curYear" value="${endYear}" />--%>
			<%--				<select id="d_curYear" name="d_curYear" disabled>--%>
			<%--					<option value="none" selected disabled hidden="">연도</option>--%>
			<%--					<option value="2024">2024</option>--%>
			<%--					<option value="2023">2023</option>--%>
			<%--					<option value="2022">2022</option>--%>
			<%--					<c:forEach   var="i" begin="0" end="5">--%>
			<%--						<c:choose>--%>
			<%--							<c:when test="${endYear==endYear-i}">--%>
			<%--								<option value="${endYear }" selected>${endYear  }</option>--%>
			<%--							</c:when>--%>
			<%--							<c:otherwise>--%>
			<%--								<option value="${endYear-i }">${endYear-i }</option>--%>
			<%--							</c:otherwise>--%>
			<%--						</c:choose>--%>
			<%--					</c:forEach>--%>
			<%--				</select>년--%>
			<%--				<input type="hidden" name="d_curMonth" value="${endMonth}" />--%>
			<%--				<select id="d_curMonth" name="d_curMonth" disabled>--%>
			<%--					<option value="none" selected hidden="">월</option>--%>
			<%--					<option value="01">1</option>--%>
			<%--					<option value="02">2</option>--%>
			<%--					<option value="03">3</option>--%>
			<%--					<option value="04">4</option>--%>
			<%--					<option value="05">5</option>--%>
			<%--					<option value="06">6</option>--%>
			<%--					<option value="07">7</option>--%>
			<%--					<option value="08">8</option>--%>
			<%--					<option value="09">9</option>--%>
			<%--					<option value="10">10</option>--%>
			<%--					<option value="11">11</option>--%>
			<%--					<option value="12">12</option>--%>
			<%--					<c:forEach   var="i" begin="1" end="12">--%>
			<%--						<c:choose>--%>
			<%--							<c:when test="${endMonth==i }">--%>
			<%--								<option value="${i }"  selected>${i }</option>--%>
			<%--							</c:when>--%>
			<%--							<c:otherwise>--%>
			<%--								<option value="${i }">${i }</option>--%>
			<%--							</c:otherwise>--%>
			<%--						</c:choose>--%>
			<%--					</c:forEach>--%>
			<%--				</select>월--%>

			<%--				<input type="hidden" name="d_curDay" value="${endDay}" />--%>
			<%--				<select id="d_curDay" name="d_curDay" disabled>--%>
			<%--					<option value="none" selected hidden="">일</option>--%>
			<%--					<option value="01">1</option>--%>
			<%--					<option value="02">2</option>--%>
			<%--					<option value="03">3</option>--%>
			<%--					<option value="04">4</option>--%>
			<%--					<option value="05">5</option>--%>
			<%--					<option value="06">6</option>--%>
			<%--					<option value="07">7</option>--%>
			<%--					<option value="08">8</option>--%>
			<%--					<option value="09">9</option>--%>
			<%--					<option value="10">10</option>--%>
			<%--					<option value="11">11</option>--%>
			<%--					<option value="12">12</option>--%>
			<%--					<option value="13">13</option>--%>
			<%--					<option value="14">14</option>--%>
			<%--					<option value="15">15</option>--%>
			<%--					<option value="16">16</option>--%>
			<%--					<option value="17">17</option>--%>
			<%--					<option value="18">18</option>--%>
			<%--					<option value="19">19</option>--%>
			<%--					<option value="20">20</option>--%>
			<%--					<option value="21">21</option>--%>
			<%--					<option value="22">22</option>--%>
			<%--					<option value="23">23</option>--%>
			<%--					<option value="24">24</option>--%>
			<%--					<option value="25">25</option>--%>
			<%--					<option value="26">26</option>--%>
			<%--					<option value="27">27</option>--%>
			<%--					<option value="28">28</option>--%>
			<%--					<option value="29">29</option>--%>
			<%--					<option value="30">30</option>--%>
			<%--					<option value="31">31</option>--%>
			<%--					<c:forEach   var="i" begin="1" end="31">--%>
			<%--						<c:choose>--%>
			<%--							<c:when test="${endDay==i }">--%>
			<%--								<option value="${i }"  selected>${i }</option>--%>
			<%--							</c:when>--%>
			<%--							<c:otherwise>--%>
			<%--								<option value="${i }">${i }</option>--%>
			<%--							</c:otherwise>--%>
			<%--						</c:choose>--%>
			<%--					</c:forEach>--%>
			<%--				</select>일 ~--%>
			<%--				<input type="hidden" name="d_endYear" value="${endYear}" />--%>
			<%--				<select id="d_endYear" name="d_endYear" disabled>--%>
			<%--					<option value="none" selected disabled hidden="">연도</option>--%>
			<%--					<option value="2024">2024</option>--%>
			<%--					<option value="2023">2023</option>--%>
			<%--					<option value="2022">2022</option>--%>
			<%--&lt;%&ndash;					<c:forEach   var="i" begin="0" end="5">&ndash;%&gt;--%>
			<%--						<c:choose>--%>
			<%--							<c:when test="${endYear==endYear-i}">--%>
			<%--								<option value="${endYear }" selected>${endYear  }</option>--%>
			<%--							</c:when>--%>
			<%--							<c:otherwise>--%>
			<%--								<option value="${endYear-i }">${endYear-i }</option>--%>
			<%--							</c:otherwise>--%>
			<%--						</c:choose>--%>
			<%--					</c:forEach>--%>
			<%--				</select>년--%>
			<%--				<input type="hidden" name="d_endMonth" value="${endMonth}" />--%>
			<%--				<select id="d_endMonth" name="d_endMonth" disabled>--%>
			<%--					<option value="none" selected hidden="">월</option>--%>
			<%--					<option value="01">1</option>--%>
			<%--					<option value="02">2</option>--%>
			<%--					<option value="03">3</option>--%>
			<%--					<option value="04">4</option>--%>
			<%--					<option value="05">5</option>--%>
			<%--					<option value="06">6</option>--%>
			<%--					<option value="07">7</option>--%>
			<%--					<option value="08">8</option>--%>
			<%--					<option value="09">9</option>--%>
			<%--					<option value="10">10</option>--%>
			<%--					<option value="11">11</option>--%>
			<%--					<option value="12">12</option>--%>
			<%--					<c:forEach   var="i" begin="1" end="12">--%>
			<%--						<c:choose>--%>
			<%--							<c:when test="${endMonth==i }">--%>
			<%--								<option value="${i }"  selected>${i }</option>--%>
			<%--							</c:when>--%>
			<%--							<c:otherwise>--%>
			<%--								<option value="${i }">${i }</option>--%>
			<%--							</c:otherwise>--%>
			<%--						</c:choose>--%>
			<%--					</c:forEach>--%>
			<%--				</select>월--%>

			<%--				<input type="hidden" name="d_endDay" value="${endDay}" />--%>
			<%--				<select id="d_endDay" name="d_endDay" disabled>--%>
			<%--					<option value="none" selected hidden="">일</option>--%>
			<%--					<option value="01">1</option>--%>
			<%--					<option value="02">2</option>--%>
			<%--					<option value="03">3</option>--%>
			<%--					<option value="04">4</option>--%>
			<%--					<option value="05">5</option>--%>
			<%--					<option value="06">6</option>--%>
			<%--					<option value="07">7</option>--%>
			<%--					<option value="08">8</option>--%>
			<%--					<option value="09">9</option>--%>
			<%--					<option value="10">10</option>--%>
			<%--					<option value="11">11</option>--%>
			<%--					<option value="12">12</option>--%>
			<%--					<option value="13">13</option>--%>
			<%--					<option value="14">14</option>--%>
			<%--					<option value="15">15</option>--%>
			<%--					<option value="16">16</option>--%>
			<%--					<option value="17">17</option>--%>
			<%--					<option value="18">18</option>--%>
			<%--					<option value="19">19</option>--%>
			<%--					<option value="20">20</option>--%>
			<%--					<option value="21">21</option>--%>
			<%--					<option value="22">22</option>--%>
			<%--					<option value="23">23</option>--%>
			<%--					<option value="24">24</option>--%>
			<%--					<option value="25">25</option>--%>
			<%--					<option value="26">26</option>--%>
			<%--					<option value="27">27</option>--%>
			<%--					<option value="28">28</option>--%>
			<%--					<option value="29">29</option>--%>
			<%--					<option value="30">30</option>--%>
			<%--					<option value="31">31</option>--%>
			<%--					<c:forEach   var="i" begin="1" end="31">--%>
			<%--						<c:choose>--%>
			<%--							<c:when test="${endDay==i }">--%>
			<%--								<option value="${i }"  selected>${i }</option>--%>
			<%--							</c:when>--%>
			<%--							<c:otherwise>--%>
			<%--								<option value="${i }">${i }</option>--%>
			<%--							</c:otherwise>--%>
			<%--						</c:choose>--%>
			<%--					</c:forEach>--%>
			<%--				</select>일--%>
			<tr>
				<td>
					<select id="s_search_type" name="s_search_type" disabled>
						<%--						<option value="all" checked>전체</option>--%>
						<option value="ordererName">주문자 이름</option>
<%--						<option value="orderId">주문자 아이디</option>--%>
<%--							<option value="ordererHp">주문자 휴대폰 번호</option>--%>
						<option value="goodsTitle">주문 상품 품명</option>
					</select>
					<input type="text" size="30" id="s_search_word" name="s_search_word" value="${searchWord}" disabled />
					<%--					<button name="btn_search" id="btn_search" onclick=fn_detail_search()>조회</button>--%>
					<button name="btn_search" id="btn_search" disabled>조회</button>
				</td>
			</tr>
		</table>
	</form>
	<%--		</table>--%>
<%--	</form>--%>
<%--	<form name="frm_search_order" action="${contextPath}/admin/order/adminOrderMain.do" method="post">--%>
<%--		<table>--%>
<%--			<tr>--%>
<%--			  <td>--%>
<%--				<select id="s_search_type" name="s_search_type" disabled>--%>
<%--					<option value="all" checked>전체</option>--%>
<%--					<option value="ordererName">주문자 이름</option>--%>
<%--					<option value="orderId">주문자 아이디</option>--%>
<%--	&lt;%&ndash;						<option value="ordererHp">주문자 휴대폰 번호</option>&ndash;%&gt;--%>
<%--					<option value="goodsTitle">주문 상품 품명</option>--%>
<%--				</select>--%>
<%--				<input type="text" size="30" id="s_search_word" name="s_search_word" disabled />--%>
<%--				  <button name="btn_search" id="btn_search" onclick=fn_detail_search()>조회</button>--%>
<%--			  </td>--%>
<%--			</tr>--%>
<%--		</table>--%>
<%--	</form>--%>
<div class="clear"></div>
	
<div class="clear"></div>
<table class="list_view">
		<tbody align=center >
			<tr style="background:#33ff00" >
				<td class="fixed" >주문 번호</td>
				<td class="fixed">주문 일자</td>
				<td>주문 내역</td>
				<td>배송 상태</td>
				<td>배송 수정</td>
			</tr>
   <c:choose>
     <c:when test="${empty newOrderList}">			
			<tr>
		       <td colspan=5 class="fixed">
				  <strong>주문한 상품이 없습니다.</strong>
			   </td>
		     </tr>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${newOrderList}" varStatus="i">
        <c:choose>
          <c:when test="${item.orderId != pre_orderId }">
            <c:choose>
              <c:when test="${item.deliveryState=='delivery_prepared' }">
                <tr  bgcolor="lightgreen">    
              </c:when>
              <c:when test="${item.deliveryState=='finished_delivering' }">
                <tr  bgcolor="lightgray">    
              </c:when>
              <c:otherwise>
                <tr  bgcolor="orange">   
              </c:otherwise>
            </c:choose>   
				 <td width=10%>
				   <a href="javascript:fn_detail_order('${item.orderId}')">
				     <strong>${item.orderId}</strong>
				   </a>
				</td>
				<td width=20%>
				 <strong>${item.payOrderTime }</strong>
				</td>
				<td width=50% align=left >
				    <strong>주문자:${item.ordererName}</strong><br>
				  <strong>주문자 전화번호:${item.ordererHp}</strong><br>
				  <strong>수령자:${item.receiverName}</strong><br>
				  <strong>수령자 전화번호:${item.receiverHp1}-${item.receiverHp2}-${item.receiverHp3}</strong><br>
				  <strong>주문 상품명(수량):${item.goodsTitle}(${item.orderGoodsQty})</strong><br>
				     <c:forEach var="item2" items="${newOrderList}" varStatus="j">
				       <c:if test="${j.index > i.index }" >
				          <c:if  test="${item.orderId ==item2.orderId}" >
				            <strong>주문 상품명(수량):${item2.goodsTitle}(${item2.orderGoodsQty})</strong><br>
				      </c:if>   
				       </c:if>
				    </c:forEach> 
				</td>
				<td width=10%>
				 <select name="s_deliveryState${i.index }"  id="s_deliveryState${i.index }">
				 <c:choose>
				   <c:when test="${item.deliveryState=='delivery_prepared' }">
				     <option  value="delivery_prepared" selected>배송 준비 중</option>
				     <option  value="delivering">배송 중</option>
				     <option  value="finished_delivering">배송 완료</option>
				     <option  value="cancel_order">주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				    <c:when test="${item.deliveryState=='delivering' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering" selected >배송 중</option>
				     <option  value="finished_delivering">배송 완료</option>
				     <option  value="cancel_order">주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${item.deliveryState=='finished_delivering' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering"  >배송 중</option>
				     <option  value="finished_delivering" selected>배송 완료</option>
				     <option  value="cancel_order">주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${item.deliveryState=='cancel_order' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering"  >배송 중</option>
				     <option  value="finished_delivering" >배송 완료</option>
				     <option  value="cancel_order" selected>주문 취소</option>
				     <option  value="returning_goods">반품</option>
				   </c:when>
				   <c:when test="${item.deliveryState=='returning_goods' }">
				    <option  value="delivery_prepared" >배송 준비 중</option>
				     <option  value="delivering"  >배송 중</option>
				     <option  value="finished_delivering" >배송 완료</option>
				     <option  value="cancel_order" >주문 취소</option>
				     <option  value="returning_goods" selected>반품</option>
				   </c:when>
				   </c:choose>
				 </select> 
				</td>
				<td width=10%>
			     <input  type="button" value="배송 수정"  onClick="fn_modify_order_state('${item.orderId}','s_deliveryState${i.index}')"/>
			    </td>
			</tr>
		</c:when>
		</c:choose>	
		<c:set  var="pre_orderId" value="${item.orderId }" />
	</c:forEach>
	</c:otherwise>
  </c:choose>	
         <tr>
             <td colspan=8 class="fixed">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;&nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach> 
           </td>
        </tr>  		   
		</tbody>
	</table>
	<div class="clear"></div>
</body>
</html>

