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
  <script>
      function fn_order_each_goods(goods_id, goods_title, goods_sales_price, fileName) {
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

          i_goods_id.name = "goodsId";
          i_goods_title.name = "goodsTitle";
          i_goods_sales_price.name = "goodsSalesPrice";
          i_fileName.name = "goodsFileName";
          i_order_goods_qty.name = "orderGoodsQty";

          i_goods_id.value = goods_id;
          i_order_goods_qty.value = 1;
          i_goods_title.value = goods_title;
          i_goods_sales_price.value = goods_sales_price;
          i_fileName.value = fileName;

          formObj.appendChild(i_goods_id);
          formObj.appendChild(i_goods_title);
          formObj.appendChild(i_goods_sales_price);
          formObj.appendChild(i_fileName);
          formObj.appendChild(i_order_goods_qty);

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
  <h2>오늘의 책</h2>
</hgroup>
<section id="new_book">
  <h3>새로나온 책</h3>
  <div id="left_scroll">
    <a href='javascript:slide("left");'><img src="${contextPath}/resources/image/left.gif"></a>
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
                <div class="writer">${item.goodsWriter} | ${item.goodsPublisher}</div>
                <div class="price">
							<span>
							  <fmt:formatNumber value="${item.goodsPrice}" type="number" var="goods_price"/>
		                         ${goods_price}원
							</span> <br>
                  <fmt:formatNumber value="${item.goodsPrice*0.9}" type="number" var="discounted_price"/>
                    ${discounted_price}원(10%할인)
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
    <a href='javascript:slide("right");'><img src="${contextPath}/resources/image/right.gif"></a>
  </div>
  <input id="hidden_auto_slide_seconds" type="hidden" value="0">
  
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
<table id="list_view">
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
        <h2>
          <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goodsId }">${item.goodsTitle }</a>
        </h2>
        <c:set var="goods_pub_date" value="${item.goodsPublishedDate }"/>
        <c:set var="arr" value="${fn:split(goods_pub_date,' ')}"/>
        <div class="writer_press">${item.goodsWriter }저
          |${item.goodsPublisher }|<c:out value="${arr[0]}"/>
        </div>
      </td>
      <td class="price"><span>${item.goodsPrice }원</span><br>
        <strong>
          <fmt:formatNumber value="${item.goodsPrice*0.9}" type="number" var="discounted_price"/>
            ${discounted_price}원
        </strong><br>(10% 할인)
      </td>
      <td><input type="checkbox" value=""></td>
      <td class="buy_btns">
        <UL>
          <li><a href="#">장바구니</a></li>
          <li><a href="javascript:fn_order_each_goods('${item.goodsId }','${item.goodsTitle }','${item.goodsSalesPrice}','${item.goodsFileName}');">구매하기</a></li>
          <li><a href="#">비교하기</a></li>
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
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>
