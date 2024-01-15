<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         isELIgnored="false"
%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
  //치환 변수 선언합니다.
  pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
  pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<head>
  <title>검색 도서 목록 페이지</title>
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
  <script>
      function add_cart(goods_id) {

          var _isLogOn = document.getElementById("isLogOn");
          var isLogOn = _isLogOn.value;

          if (isLogOn == "false" || isLogOn == '') {
              alert("로그인 후 주문이 가능합니다!!!");
          }

          $.ajax({
              type: "post",
              async: false, //false인 경우 동기식으로 처리한다.
              url: "${contextPath}/cart/addGoodsInCart.do",
              data: {
                  goods_id: goods_id,
                  cartGoodsQty: 1  /* 리스트에서는 상품 수량 조절 기능이 없으므로 1로 임의 설정 */
              },
              success: function (data, textStatus) {
                  //alert(data);
                  //	$('#message').append(data);
                  if (data.trim() == 'add_success') {
                      // alert("장바구니에 상품을 추가했습니다.")
                      imagePopup('open', '.layer01');
                      imagePopup('open');
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
          // var order_goods_qty = document.getElementById("order_goods_qty");
          var order_goods_qty = 1;

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
          i_order_goods_qty.value = 1;
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
<hgroup>
  <h1>추천 도서</h1>
</hgroup>
<section id="new_book">
  <div class="carousel_container">
    <div class="carousel_content">
      <div id="left_scroll">
        <a href='javascript:slide("left");'><img src="${contextPath}/resources/image/left.gif"></span></a>
      </div>
      <div id="carousel_inner">
        <ul id="carousel_ul">
          <c:choose>
            <c:when test="${ empty goodsList  }">
              <li>
                <div id="book_empty">
                  <a><h1>제품이없습니다.</h1></a>
                </div>
              </li>
            </c:when>
            <c:otherwise>
              <c:forEach var="item" items="${goodsList }">
                <li>
                  <div id="book">
                    <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId}">
                      <img width="75" alt=""
                           src="${contextPath}/thumbnails.do?goods_id=${item.goodsId}&fileName=${item.goodsFileName}">
                    </a>
                    <div class="sort">[컴퓨터 인터넷]</div>
                    <div class="title">
                      <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">
                          ${item.goodsTitle}
                      </a>
                    </div>
                    <div class="writer">${item.goodsWriter} | <span>${item.goodsPublisher}</span></div>
                    <div class="price">
                        <%--<span>
                          <fmt:formatNumber value="${item.goodsPrice}" type="number" var="goods_price"/>
                             ${goods_price}원
                        </span> <br>--%>
                      <fmt:formatNumber value="${item.goodsPrice}" type="number" var="goods_price"/>
                        ${goods_price}원
                    </div>
                  </div>
                </li>
              </c:forEach>
              <li>
              </li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
      <div id="right_scroll">
        <a href='javascript:slide("right");'><img src="${contextPath}/resources/image/right.gif"></span></a>
      </div>
      <input id="hidden_auto_slide_seconds" type="hidden" value="0">
    </div>
  </div>
  <div class="clear"></div>
</section>
<div class="clear"></div>
<div id="sorting">
  <ul>
    <li><a class="active" href="#">베스트 셀러</a></li>
    <li><a href="#">최신 출간</a></li>
    <li><a style="border: currentColor; border-image: none;" href="#">최근 등록</a></li>
  </ul>
</div>
<table id="list_view" class="table table-hover">
  <tbody>
  <c:forEach var="item" items="${goodsList }">
    <tr>
      <td class="goods_image">
        <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId}">
          <img width="75" alt=""
               src="${contextPath}/thumbnails.do?goods_id=${item.goodsId}&fileName=${item.goodsFileName}">
        </a>
      </td>
      <td class="goods_description">
        <a class="link-dark link-underline link-underline-opacity-0"
           href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">
          <h2>
              ${item.goodsTitle }
          </h2>
          <c:set var="goods_pub_date" value="${item.goodsPublishedDate }"/>
          <c:set var="arr" value="${fn:split(goods_pub_date,' ')}"/>
          <div class="writer_press">${item.goodsWriter } · ${item.goodsPublisher }
            · <c:out value="${arr[0]}"/>
          </div>
          <div class="price">
            <fmt:formatNumber value="${item.goodsPrice}" type="number" var="goods_sales_price"/>
              ${goods_sales_price}원
          </div>
        </a>
      </td>
      <input type="hidden" id="h_goods_delivery_price" name="h_goods_delivery_price"
             value="${item.goodsDeliveryPrice}"/>
      <td class="buy_btns">
        <UL>
          <li>
            <button type="button" class="btn_cart" onclick="javascript:add_cart('${item.goodsId }');">장바구니
            </button>
          </li>
          <li>
            <button type="button" class="btn_buy"
                    onclick="javascript:fn_order_each_goods('${item.goodsId }','${item.goodsTitle }','${item.goodsSalesPrice}','${item.goodsFileName}','${item.goodsDeliveryPrice}');">
              구매하기
            </button>
          </li>
        </UL>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<div class="clear"></div>
<div id="page_wrap">
  <ul id="page_control">
    <li><a class="no_border" href="#">Prev</a></li>
    <c:set var="page_num" value="0"/>
    <c:forEach var="count" begin="1" end="10" step="1">
      <c:choose>
        <c:when test="${count==1 }">
          <li><a class="page_contrl_active" href="#">${count+page_num*10 }</a></li>
        </c:when>
        <c:otherwise>
          <li><a href="#">${count+page_num*10 }</a></li>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <li><a class="no_border" href="#">Next</a></li>
  </ul>
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
    </div>
    <form action='${contextPath}/cart/myCartList.do'>
      <input class="button-popup" type="submit" value="장바구니 보기">
    </form>
    <input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
