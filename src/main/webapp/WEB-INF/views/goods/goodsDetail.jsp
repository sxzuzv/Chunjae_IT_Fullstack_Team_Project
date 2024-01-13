<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="goods" value="${goodsMap.goodsVO}"/>
<c:set var="imageList" value="${goodsMap.imageList }"/>
<%
  //치환 변수 선언합니다.
  pageContext.setAttribute("crcn", "\r\n"); //개행문자
  pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<html>
<head>
  <link rel="stylesheet" href="${contextPath}/resources/css/comment.css" />
  <style>
      #layer {
          z-index: 2;
          position: absolute;
          top: 0px;
          left: 0px;
          width: 100%;
      }

      #popup {
          z-index: 3;
          position: fixed;
          text-align: center;
          text-wrap: nowrap;
          vertical-align: middle;
          left: 50%;
          top: 45%;
          padding-bottom: 20px;
          background-color: #ffffff;
          border: 1px solid #666666;
      }

      #close {
          /*z-index: 4;*/
          float: right;
      }
  </style>
  <script type="text/javascript">
      function changefn() {
          var order_goods_qty = document.getElementById("order_goods_qty");
          var value = (order_goods_qty.options[order_goods_qty.selectedIndex].value);
          return value;
      }

      function add_cart(goods_id) {
          let cartGoodsQty = changefn();
          $.ajax({
              type: "post",
              async: false, //false인 경우 동기식으로 처리한다.
              url: "${contextPath}/cart/addGoodsInCart.do",
              data: {
                  goods_id: goods_id,
                  cartGoodsQty: cartGoodsQty

              },
              success: function (data, textStatus) {
                  //alert(data);
                  //	$('#message').append(data);
                  if (data.trim() == 'add_success') {
                      imagePopup('open', '.layer01');
                  } else if (data.trim() == 'already_existed') {
                      alert("이미 카트에 등록된 상품입니다.");
                  }

              },
              error: function (data, textStatus) {
                  alert("에러가 발생했습니다." + data);
              },
              complete: function (data, textStatus) {
                  //alert("작업을완료 했습니다");
              }
          }); //end ajax
      }

      function imagePopup(type) {
          if (type == 'open') {
              // 팝업창을 연다.
              jQuery('#layer').attr('style', 'visibility:visible');

              // 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
              jQuery('#layer').height(jQuery(document).height());
          } else if (type == 'close') {

              // 팝업창을 닫는다.
              jQuery('#layer').attr('style', 'visibility:hidden');
          }
      }

      function fn_order_each_goods(goods_id, goods_title, goods_sales_price, fileName, goods_delivery_price) {
          var _isLogOn = document.getElementById("isLogOn");
          var isLogOn = _isLogOn.value;

          if (isLogOn == "false" || isLogOn == '') {
              alert("로그인 후 주문이 가능합니다!!!");
          }


          var total_price, final_total_price;
          var order_goods_qty = document.getElementById("order_goods_qty");

          var formObj = document.createElement("form");
          var i_goods_id = document.createElement("input");
          var i_goods_title = document.createElement("input");
          var i_goods_sales_price = document.createElement("input");
          var i_fileName = document.createElement("input");
          var i_order_goods_qty = document.createElement("input");
          var i_goods_delivery_price = document.createElement("input");

          i_goods_id.name = "goodsId";
          i_goods_title.name = "goodsTitle";
          i_goods_sales_price.name = "goodsSalesPrice";
          i_fileName.name = "goodsFileName";
          i_order_goods_qty.name = "orderGoodsQty";
          i_goods_delivery_price.name = "goodsDeliveryPrice";

          i_goods_id.value = goods_id;
          i_order_goods_qty.value = order_goods_qty.value;
          i_goods_title.value = goods_title;
          i_goods_sales_price.value = goods_sales_price;
          i_goods_delivery_price.value = goods_delivery_price;
          i_fileName.value = fileName;

          formObj.appendChild(i_goods_id);
          formObj.appendChild(i_goods_title);
          formObj.appendChild(i_goods_sales_price);
          formObj.appendChild(i_fileName);
          formObj.appendChild(i_order_goods_qty);
          formObj.appendChild(i_goods_delivery_price);

          document.body.appendChild(formObj);
          formObj.method = "post";
          formObj.action = "${contextPath}/order/orderEachGoods.do";
          formObj.submit();
      }
  </script>
</head>
<body>
<hgroup>
  <h1>컴퓨터와 인터넷</h1>
  <h2>국내외 도서 &gt; 컴퓨터와 인터넷 &gt; 웹 개발</h2>
  <h3>${goods.goodsTitle }</h3>
  <h4>${goods.goodsWriter} &nbsp;저| ${goods.goodsPublisher}</h4>
  <hr>
</hgroup>
<div class="detail_info">
  <div id="goods_image">
    <figure>
      <img alt="HTML5 &amp; CSS3"
           src="${contextPath}/thumbnails.do?goods_id=${goods.goodsId}&fileName=${goods.goodsFileName}">
    </figure>
  </div>
  <div id="detail_table">
    <table>
      <tbody>
      <%--		<tr>--%>
      <%--			<td class="fixed">정가</td>--%>
      <%--			<td class="active"><span >--%>
      <%--					   <fmt:formatNumber  value="${goods.goodsPrice}" type="number" var="goodsPrice" />--%>
      <%--				         ${goodsPrice}원--%>
      <%--					</span></td>--%>
      <%--		</tr>--%>
      <tr>
        <th class="fixed">판매가</th>
        <td class="active"><span>
					   <fmt:formatNumber value="${goods.goodsPrice}" type="number" var="goodsPrice"/>
				         ${goodsPrice}원</span></td>
      </tr>
      <%--<tr>
          <td class="fixed">포인트적립</td>
          <td class="active">P(10%적립)</td>
      </tr>
      <tr class="dot_line">
          <td class="fixed">포인트 추가적립</td>
          <td class="fixed">만원이상 구매시 1,000P, 5만원이상 구매시 2,000P추가적립 편의점 배송 이용시 300P 추가적립</td>
      </tr>--%>
      <tr>
        <th class="fixed">발행일</th>
        <td class="fixed">
          <c:set var="pub_date" value="${goods.goodsPublishedDate}"/>
          <c:set var="arr" value="${fn:split(pub_date,' ')}"/>
          <c:out value="${arr[0]}"/>
        </td>
      </tr>
      <tr>
        <th class="fixed">페이지 수</th>
        <td class="fixed">${goods.goodsTotalPage}쪽</td>
      </tr>
      <tr class="dot_line">
        <th class="fixed">ISBN</th>
        <td class="fixed">${goods.goodsIsbn}</td>
      </tr>
      <tr>
        <th class="fixed">배송료</th>
        <td class="fixed">
          <c:choose>
            <c:when test="${goods.goodsDeliveryPrice}.equals('0') || ${goods.goodsDeliveryPrice} == null">
              <strong>무료</strong>
            </c:when>
            <c:otherwise>
              ${goods.goodsDeliveryPrice}원
            </c:otherwise>
          </c:choose>
        
        </td>
      </tr>
      <tr>
        <th class="fixed">배송안내</th>
        <td class="fixed"><strong>[당일배송]</strong> 당일배송 서비스 시작!<br> <strong>[휴일배송]</strong>
          휴일에도 배송받는 Bookshop
        </TD>
      </tr>
      <tr>
        <th class="fixed">도착예정일</th>
        <td class="fixed">
          ${goods.goodsDeliveryDate}
        </td>
      </tr>
      <tr>
        <th class="fixed">수량</th>
        <td class="fixed">
          <select style="width: 60px;" id="order_goods_qty" onchange="changefn()">
            <option value="1">1</option>
            <option value="2">2</option>
            `
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
        </td>
      </tr>
      </tbody>
    </table>
    <div class="button-container">
      <ul>
        <li>
          <button type="button" class="button-buy"
                  onclick="fn_order_each_goods('${goods.goodsId }','${goods.goodsTitle }','${goods.goodsSalesPrice}','${goods.goodsFileName}','${goods.goodsDeliveryPrice}');">
            구매하기
          </button>
        </li>
        <li>
          <button type="button" class="button-cart" onclick="add_cart('${goods.goodsId }');">장바구니</button>
        </li>
      </ul>
    </div>
  </div>
</div>

<div class="clear"></div>
<!-- 내용 들어 가는 곳 -->
<div id="container">
  <ul class="tabs">
    <li><a href="#tab1">책소개</a></li>
    <li><a href="#tab2">저자소개</a></li>
    <li><a href="#tab3">책목차</a></li>
    <li><a href="#tab4">출판사서평</a></li>
    <li><a href="#tab5">추천사</a></li>
    <li><a href="#tab6">리뷰</a></li>
  </ul>
  <div class="tab_container">
    <div class="tab_content" id="tab1">
<%--      <h4>책소개</h4>--%>
      <p>${fn:replace(goods.goodsIntro,crcn,br)}</p>
      <c:forEach var="image" items="${imageList }">
        <img
                src="${contextPath}/download.do?goods_id=${goods.goodsId}&fileName=${image.fileName}">
      </c:forEach>
    </div>
    <div class="tab_content" id="tab2">
      <h4>저자소개</h4>
      <div class="writer">저자 : ${goods.goodsWriter}</div>
      <p>${fn:replace(goods.goodsWriterIntro,crcn,br) }</p>
    
    </div>
    <div class="tab_content" id="tab3">
      <h4>책목차</h4>
      <p>${fn:replace(goods.goodsContentsOrder,crcn,br)}</p>
    </div>
    <div class="tab_content" id="tab4">
      <h4>출판사서평</h4>
      <p>${fn:replace(goods.goodsPublisherComment ,crcn,br)}</p>
    </div>
    <div class="tab_content" id="tab5">
      <h4>추천사</h4>
      <p>${fn:replace(goods.goodsRecommendation,crcn,br) }</p>
    </div>
    <div class="tab_content" id="tab6">
      <h4>리뷰</h4>
      <div class = "xans-product-detail">
        <div id="comment_add">
          <div class="title">리뷰</div>
          <div class="input"><textarea id="comContent"></textarea></div>
          <div class="btn"><button type="button" id="add_btn">댓글등록</button></div>
          <div id="add_message">&nbsp;</div>
        </div>
        <%-- 댓글 목록 출력 영역 --%>
        <div id="comment_list">
        </div>
      </div>
    </div>
  </div>
</div>
<div class="clear"></div>
<div id="layer" style="visibility: hidden">
  <!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
  <div id="popup">
    <!-- 팝업창 닫기 버튼 -->
    <a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
            src="${contextPath}/resources/image/close.png" id="close"/>
    </a>
    <div class="popup-container">
      <p id="contents">장바구니에 담았습니다.</p>
      <form action='${contextPath}/cart/myCartList.do'>
        <input class="button-popup" type="submit" value="장바구니 보기">
      </form>
    </div>
    
</body>
<script type="text/javascript">
	//script를 body의 상단에 작성하게 되면, 간혹 html이 로드 되기 전에 script를 먼저 불러와버리는 경우가 생긴다.
	// 그렇게 되면 addEventListener을 부여할 DOM을 찾지 못하게 되어 에러가 발생하게 된다. 따라서 가장 아래에 작성함

	// [문서가 실행되자마자 목록을 출력하기위해 가장먼저 호출]
	loadComment();

	// 댓글목록을 제공하는 JSP문서를 요청하여 응답받아 출력하는 함수
	function loadComment() {
		$.ajax({
			type: "GET",
			url: "${contextPath}/comment/commentList.do/${goods.goodsId}",
			success: function(commentArray) {

				// 댓글 출력목록의 초기화
				$("#comment_list").children().remove();

				// 반복지시자 이용하여 출력 >> object객체로 인식!하니까 $넣어서 접근
				$(commentArray).each(function() {
					// 수정을 위해 각각의 div에 고유값인 id를 부여 >> 이때 num활용
					// 삭제를 위해 num부여 >> 이때도 num활용
					$("#comment_list").append("<div id='comment_"+this.comId+ "' class='comment' num='"+this.comId+"'>" +
							"<b>["+this.memberId+"]</b>&nbsp;&nbsp;"+this.regDate+
							'<br><br>'+
							'<div id ="comContent">'+this.comContent.replace(/\n/g, "<br>")+"</div>" +
							"<br>" +
							"<button>수정</button>&nbsp;<button>삭제</button></div>");
				});
			},
			error: function() {
				alert("list 로드시 에러발생");
			}
		});
	}


	// [댓글등록] 클릭시 호출될 이벤트핸들러 함수 등록
	$("#add_btn").click(
			function() {
				// 입력값 유효성검사
				var comContent=$("#comContent").val();
				if(comContent=="") {
					$("#add_message").html("내용을 입력하세요");
					$("#comContent").focus();
					return;
				}

				// 입력태그 초기화
				$("#comContent").val("");
				$("#add_message").html("");

				var comment = {
					<!-- 새로운 글 정보를 json으로 생성한다 -->
					brdId:"${goods.goodsId}",
					memberId:"${memberInfo.memberId}",
					comContent:comContent
				};
				// ajax기능으로 요청 및 응답처리
				$.ajax({
					type: "POST",
					url: "${contextPath}/comment/addComment.do/${goods.goodsId}",
					data: JSON.stringify(comment),
					contentType : 'application/json; charset=utf-8',
					success: function(result) {
						loadComment();
					},
					error: function() {
						alert("댓글 작성시 에러발생");
					}
				});
			});

	// [댓글삭제] 클릭시 호출될 이벤트핸들러 함수 등록
	$("#comment_list").on("click", "button:contains('삭제')",
			function() {
				// 삭제할 댓글의 고유번호(num)를 가져온다.
				var comId = $(this).parent().attr("num");

				// ajax기능으로 요청 및 응답처리
				$.ajax({
					type: "DELETE",
					url: "${contextPath}/comment/deleteComment.do/${comId}",
					success: function(result) {
						// 삭제 성공시 댓글목록을 다시 불러온다.
						loadComment();
					},
					error: function() {
						alert("삭제시 에러발생");
					}
				});
			});

	// [댓글수정] 클릭시 호출될 이벤트핸들러 함수 등록
	$("#comment_list").on("click", "button:contains('수정')", function() {
		// 수정할 댓글의 고유번호(num)와 내용을 가져온다.
		var comId = $(this).parent().attr("num");
		var comContent = $(this).parent().find("#comContent").text();

		// 수정할 댓글의 내용을 textarea 태그로 바꾼다.
		$(this).parent().html("<textarea id='editContent' rows='3' cols='50'>"+comContent+"</textarea><br><br>" +
				"<button id='save_btn'>저장</button>&nbsp;<button id='cancel_btn'>취소</button>");

		// [저장] 버튼에 수정할 댓글의 고유번호를 속성으로 부여한다.
		$("#save_btn").attr("num", comId);
	});

	// [저장] 클릭시 호출될 이벤트핸들러 함수 등록
	$("#comment_list").on("click", "#save_btn", function() {
		// 수정할 댓글의 고유번호(num)와 새로운 내용을 가져온다.
		var comId = $(this).attr("num");
		var comContent = $("#editContent").val();

		// 입력값 유효성검사
		if(comContent=="") {
			alert("내용을 입력하세요");
			$("#editContent").focus();
			return;
		}

		// ajax기능으로 요청 및 응답처리
		$.ajax({
			type: "POST",
			url: "${contextPath}/comment/updateComment.do",
			data: "comId=" + comId + "&comContent=" + comContent,  // QueryString형태로 전달
			dataType: "Json",
			success: function(result) {
				// 수정 성공시 댓글목록을 다시 불러온다.
				loadComment();
			},
			error: function() {
				alert("수정시 에러발생");
			}
		});
	});

	// [취소] 클릭시 호출될 이벤트핸들러 함수 등록
	$("#comment_list").on("click", "#cancel_btn", function() {
		// 댓글목록을 다시 불러온다.
		loadComment();
	});

</script>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
